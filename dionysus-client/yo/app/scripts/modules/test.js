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
    template : JST['templates/home/psychtests/question']
  });

  var PsychTestView = Marionette.CompositeView.extend({
    template : JST['templates/home/psychtests/workspace'],
    className : 'ui segment',
    childView : PsychTestQuestionView,
    childViewContainer : '.question',
    // TODO: move collection filter into PsychTest model
    selectQuestion: function() {
      var index = this.model.get('current') - 1;
      var models = this._collection.filter(function(item, i) {
        return index === i;
      });
      this.collection = new Backbone.Collection(models);
    },
    onRender : function() {
      this.$('.ui.radio.checkbox').checkbox();
    },
    initialize: function() {
      this._collection = this.collection;
      this.selectQuestion();
      this.listenTo(this.model, 'change', function() {
        this.selectQuestion();
        this.render();
      }, this);
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
        var questions = test.embedded('questions');
        Dionysus.mainRegion.show(new PsychTestView({ 
          model : test,
          collection : questions
        }));
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
