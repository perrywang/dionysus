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







  var SingleChoiceQuestionView = Marionette.ItemView.extend({
    template : JST['templates/home/psychtests/singlechoice'],
    onRender : function() {
      this.$('.ui.radio.checkbox').checkbox();
    }
  });

  var OneByOneNavView = Marionette.ItemView.extend({
    template : JST['templates/home/psychtests/onebyonenav'],
    initialize : function() {
      this.listenTo(this.model, 'select', this.render, this);
    },
    serializeData : function() {
      return this.model.getNavData();
    }
  });

  var PsychTestQuestionOneByOneView = Marionette.LayoutView.extend({
    template : JST['templates/home/psychtests/onebyone'],
    regions : {
      question : 'section.question',
      navigator : 'footer.nav'
    },
    initialize: function() {
      this.listenTo(this.model, 'select', this.renderQuestion, this);
    },
    onRender : function() {
      this.showChildView('navigator', new OneByOneNavView({ model : this.model }));
    },
    renderQuestion : function(question) {
      if (question.get('type') === 'SINGLE_CHOICE') {
        this.showChildView('question', new SingleChoiceQuestionView({ model : question }));  
      } else {
        throw new Error('cannot handle question type: ' + question.get('type'));
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

  var psychtestController = (function() {

    var currentTest;

    return {
      showTestSuites : function() {
        var fetching = Dionysus.request('psychtestsuite:instances');
        $.when(fetching).done(function(suites) {
          Dionysus.mainRegion.show(new TestSuiteCollectionView({ collection: suites }));
        });
      },
      showTest: function (id, question) {
        var qid = parseInt(question, 10);
        if (!currentTest || currentTest.id === qid) {
          // loading at the first time
          var fetching = Dionysus.request('psychtest:instance', id);
          $.when(fetching).done(function (test) {
            currentTest = test;
            var format = test.get('format');
            switch(format) {
              case 'TABLE':
                Dionysus.mainRegion.show(new PsychTestQuestionTableView({ model : test }));
                break;
              case 'ONE_BY_ONE':
                Dionysus.mainRegion.show(new PsychTestQuestionOneByOneView({ model : test }));
                break;
              default:
                throw new Error("cannot handle test format: " + format);
            }
            if (question) {
              currentTest.selectById(question);
            } else {
              currentTest.startTest();  
            }
          });
        } else {
          currentTest.selectById(question);
        }
      }
    };
  })();

  Dionysus.addInitializer(function () {
    new Marionette.AppRouter({
      appRoutes: {
        'psychtest/:id(/)(:question)': 'showTest',
        'psychtestsuites(/)' : 'showTestSuites'
      },
      controller: psychtestController
    });
  });
});
