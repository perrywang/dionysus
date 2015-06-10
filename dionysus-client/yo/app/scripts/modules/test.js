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

  var PsychTestQuestionOneByOneView = Marionette.ItemView.extend({
    template : JST['templates/home/psychtests/onebyone'],
    onRender : function() {
      this.$('.ui.radio.checkbox').checkbox();
    },
    initialize: function() {
      var questions = this.model.embedded('questions') || []
      this.total = questions.length;
      this.listenTo(this.model, 'change', this.render, this);
      this.model.set('current', 1);
    },
    serializeData : function() {
      var model = this.model;
      var questions = model.embedded('questions'),
          current = model.get('current'),
          total = this.total;

      var question = questions.at(current - 1);

      var data = this.serializeModel(this.model);
      data.question = this.serializeModel(question);
      data.hasPrev = (current > 1);
      data.hasNext = (current < total);
      data.total = total;
      return data;
    },
    events : {
      'click .prev' : function() {
        var current = this.model.get('current');
        if (current > 1) {
          this.model.set('current', current - 1); 
        }
      },
      'click .next' : function() {
        var current = this.model.get('current');
        var total = this.total;
        if (current < total) {
          this.model.set('current', current + 1);
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
