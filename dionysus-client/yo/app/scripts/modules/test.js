Dionysus.module('Test', function (Test, Dionysus, Backbone, Marionette, $) {
  'use strict';

  var TestSuiteView = Marionette.ItemView.extend({
    template : JST['templates/home/psychtests/suite'],
    className : 'ui card',
    serializeData : function() {
      var data = this.serializeModel(this.model);
      data.tests = this.model.embedded('tests');
      return data;
    }
  });

  var TestSuiteCollectionView = Marionette.CompositeView.extend({
    template : JST['templates/home/psychtests/psychtest'],
    childView : TestSuiteView,
    childViewContainer : '.ui.cards'
  });

  // TODO: should put logic into controller
  var PsychTestQuestionOneByOneView = Marionette.ItemView.extend({
    template : JST['templates/home/psychtests/onebyone'],
    onRender : function() {
      this.$('.ui.radio.checkbox').checkbox();
    },
    initialize: function() {
      this.listenTo(this.model, 'change', this.updateCurrentQuestion, this);
      this.updateCurrentQuestion();
    },
    updateCurrentQuestion : function() {
      var model = this.model;
      var questions = model.embedded('questions') || [],
          total = questions.length,
          current = model.get('current');

      var index = current - 1;
      model.set('hasPrev', index > 0, { silent : true });
      model.set('hasNext', index < total - 1, { silent : true });
      model.set('total', questions.length, { silent : true });
      return this.render();
    },
    serializeData : function() {
      var model = this.model;
      var questions = model.embedded('questions'),
          index = model.get('current') - 1;
      var question = questions.find(function(item, i) { return index === i; });

      var data = this.serializeModel(this.model);
      data.question = this.serializeModel(question);
      return data;
    },
    events : {
      'click .prev' : function() {
        var model = this.model;
        if (model.get('hasPrev')) {
          model.set('current', model.get('current') - 1); 
        }
      },
      'click .next' : function() {
        var model = this.model;
        if (model.get('hasNext')) {
          model.set('current', model.get('current') + 1);
        }
      }
    }
  });

  var PsychTestQuestionTableView = Marionette.ItemView.extend({
    template : JST['templates/home/psychtests/table'],
    serializeData : function() {
      var model = this.model;
      var data = this.serializeModel(model);
      data.questions = this.serializeCollection(model.embedded('questions'));
      return data;
    },
    onRender : function() {
      this.$('.ui.radio.checkbox').checkbox();
    }
  });

  var TestController = Marionette.Controller.extend({
    showTestSuites : function() {
      var fetching = Dionysus.request('psychtestsuite:instances');
      $.when(fetching).done(function(suites) {
        Dionysus.mainRegion.show(new TestSuiteCollectionView({ collection: suites }));
      });
    },
    showTest: function (id) {
      var fetching = Dionysus.request('psychtest:instance', id);
      $.when(fetching).done(function (test) {
        var format = test.get('format');
        switch(format) {
          case 'TABLE':
            Dionysus.mainRegion.show(new PsychTestQuestionTableView({ model : test }));
            break;
          case 'ONE_BY_ONE':
            Dionysus.mainRegion.show(new PsychTestQuestionOneByOneView({ model : test}));
            break;
        }
        
      });
    }
  });

  Dionysus.addInitializer(function () {
    new Marionette.AppRouter({
      appRoutes: {
        'psychtest/:id(/)': 'showTest',
        'psychtestsuites(/)' : 'showTestSuites'
      },
      controller: new TestController()
    });
  });
});
