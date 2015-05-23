Dionysus.module('Test', function (Test, Dionysus, Backbone, Marionette, $, _) {
  'use strict';

  var PsychTestItemOptionView = Marionette.ItemView.extend({
    template: JST['templates/home/psychtests/option'],
    initialize: function () {
      this.model.on('change:selected', this.render, this);
    },

    ui: {
      checkbox: 'input'
    },

    events: {
      'click': 'selectOption'
    },

    selectOption: function () {
      if (!this.model.get('selected')) {
        this.trigger('option:changed', this.model.get('id'));

      }
    },

    onRender: function () {
      this.$el.toggleClass('test-item-option-selected', this.model.get('selected'));
      this.ui.checkbox.prop('checked', this.model.get('selected'));
    }
  });

  var PsychTestView = Marionette.LayoutView.extend({

    template: JST['templates/home/psychtests/layout'],
    className: 'ui segment',
    regions: {
      TestHeaderRegion: '#test-header',
      TestItemRegion: '#test-item',
      TestWizardRegion: '#test-wizard'
    }

  });

  var HeaderView = Marionette.ItemView.extend({
    template: JST["templates/home/psychtests/header"],
    initialize: function () {
      this.model.on('change:current', this.render, this);
    }
  });

  var ItemView = Marionette.CompositeView.extend({
    template: JST["templates/home/psychtests/question"],
    childView: PsychTestItemOptionView,
    childViewContainer: '#item-options'
  });

  var WizardView = Marionette.ItemView.extend({
    template: JST["templates/home/psychtests/wizard"],
    className: 'ui grid',
    initialize: function () {
      this.model.on('change:current', this.render, this);
    },
    events: {
      'click #last': 'lastClicked',
      'click #next': 'nextClicked'
    },

    ui: {
      'lastBtn': '#last',
      'nextBtn': '#next',
      'submitBtb': '#submit'
    },
    onRender: function () {
      var current = this.model.get('current');
      var total = this.model.get('total');
      if (current === 0) {
        this.ui.lastBtn.addClass('disabled');
      }
      if (current === total - 1) {
        this.ui.nextBtn.addClass('disabled');
        this.ui.submitBtb.removeClass('disabled');
      }

    },

    lastClicked: function () {
      this.trigger('item:changed', -1);
    },

    nextClicked: function () {
      this.trigger('item:changed', 1);
    }
  });


  var TestSuiteView = Marionette.ItemView.extend({
    template: JST["templates/home/psychtests/suite"],
    className : 'ui card'
  });

  var TestSuiteCollectionView = Marionette.CollectionView.extend({
    childView : TestSuiteView,
    className : 'ui list'
  });

  var TestController = Marionette.Controller.extend({
    showTestSuites : function() {
      var testsets = Dionysus.request('psychtestsuite:instances');
      $.when(testsets).done(function(tests) {
        var view = new TestSuiteCollectionView({ collection: tests });
        Dionysus.mainRegion.show(view);
      });
    },
    showTestSuite: function (id) {
      var testFetching = Dionysus.request('psychtestsuite:instance', id);
      $.when(testFetching).done(function (test) {
        var total = test.get('items').length;
        test.set('total', total);
        var headerView = new HeaderView({
          model: test
        });
        var current = test.get('current');
        var item = new Dionysus.Entities.PsychTestItem({
          description: test.get('items')[current].description
        });

        var options = new Dionysus.Entities.PsychTestItemOptionCollection(test.get('items')[current].options);

        var itemView = new ItemView({
          model: item,
          collection: options
        });

        itemView.on('childview:option:changed', function (childview, selectedId) {
          var current = test.get('current');
          var currentItem = test.get('items')[current];
          currentItem.options.map(function (option) {
            option.selected = (option.id === selectedId);
          });
          itemView.collection.each(function (option) {
            option.set('selected', option.get('id') === selectedId);
          });
        });

        var wizardView = new WizardView({model: test});

        wizardView.on('item:changed', function (step) {
          var current = test.get('current') + step;
          test.set('current', current);
          var currentItem = test.get('items')[current];
          itemView.model.set('description', currentItem.description);
          itemView.collection = new Dionysus.Entities.PsychTestItemOptionCollection(test.get('items')[current].options);
          itemView.render();
        });


        var testView = new PsychTestView();

        testView.on('show', function () {
          testView.TestHeaderRegion.show(headerView);
          testView.TestItemRegion.show(itemView);
          testView.TestWizardRegion.show(wizardView);

        });

        Dionysus.mainRegion.show(testView);
      });
    }
  });

  Dionysus.addInitializer(function () {
    new Marionette.AppRouter({
      appRoutes: {
        'psychtestsuites/:id(/)': 'showTestSuite',
        'psychtestsuites(/)' : 'showTestSuites'
      },
      controller: new TestController()
    });
  });
});
