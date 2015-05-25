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


  var PsychTestQuestionView = Marionette.ItemView.extend({
    template : JST['templates/home/psychtests/question'],
    onRender : function() {
      this.$('.ui.radio.checkbox').checkbox();
    },
    initialize: function() {
      this.listenTo(this.model, 'change', this.render, this);
    },
    serializeData : function() {
      var data = this.serializeModel(this.model);
      data.question = this.serializeModel(this.model.getQuestion());
      return data;
    },
    events : {
      'click .prev' : function() {
        this.model.prevQuestion();
      },
      'click .next' : function() {
        this.model.nextQuestion();
      }
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
        Dionysus.mainRegion.show(new PsychTestQuestionView({ model : test }));
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
