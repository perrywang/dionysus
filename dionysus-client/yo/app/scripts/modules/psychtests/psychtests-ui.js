Dionysus.module('PsychTest', function (PsychTest, Dionysus, Backbone, Marionette, $) {
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
    className : 'ui centered stackable grid',
    childView : TestSuiteView,
    childViewContainer : '.ui.cards'
  });







  var SingleChoiceQuestionView = Marionette.ItemView.extend({
    template : JST['templates/home/psychtests/singlechoice'],
    tagName : 'form',
    events : {
      'change input[type="radio"]' : 'chooseAnswer'
    },
    chooseAnswer : function() {
      var answer = this.$('input[type="radio"]:checked').val(),
          question = this.model;
      this.triggerMethod('answer:choose', question, answer);
    },
    onRender : function() {
      var answer = this.model.getAnswer();
      if (answer) {
        var value = answer.get('value');
        this.$('#option-' + value).attr("checked", true)
      }
      this.$('.ui.radio.checkbox').checkbox();
    }
  });

  var OneByOneNavView = Marionette.ItemView.extend({
    template : JST['templates/home/psychtests/onebyonenav'],
    initialize : function() {
      this.listenTo(this.model, 'select', this.render, this);
    },
    triggers : {
      'click button.save' : 'results:save',
      'click button.submit' : 'results:submit'
    },
    serializeData : function() {
      return this.model.getNavData();
    }
  });

  var PsychTestQuestionOneByOneView = Marionette.LayoutView.extend({
    template : JST['templates/home/psychtests/onebyone'],
    className : 'ui centered stackable grid',
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
    childEvents : {
      'answer:choose' : function(view, question, answer) {
        this.model.updateResult(question, answer);
      },
      'results:save' : function(view) {
        this.model.saveResults();
      },
      'results:submit' : function(view) {
        this.model.submitResults();
      }
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
    className : 'ui centered stackable grid',
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
      clear : function() {
        currentTest = null;
      },
      showPsychTestSuites : function() {
        var fetching = Dionysus.request('psychtestsuite:instances');
        $.when(fetching).done(function(suites) {
          Dionysus.mainRegion.show(new TestSuiteCollectionView({ collection: suites }));
        });
      },
      showPsychTest: function (id, question) {
        var tid = parseInt(id, 10);
        // 如果测试数据没有没加载，或者加载的测试数据不是当前选择的
        // 那么重新发起数据库查询
        if (!currentTest || currentTest.id !== tid) {
          // loading at the first time
          var fetchTest = Dionysus.request('psychtests:instance', id),
              fetchResult = Dionysus.request('psychtestresults:instance', id);

          $.when(fetchTest, fetchResult).done(function (test, result) {
            test.initResult(result);
            var format = test.get('format');
            switch(format) {
              case 'ONE_BY_ONE':
                Dionysus.mainRegion.show(new PsychTestQuestionOneByOneView({ model : test }));
                break;
              case 'TABLE':
                Dionysus.mainRegion.show(new PsychTestQuestionTableView({ model : test }));
                break;
              default:
                throw new Error("cannot handle test format: " + format);
            }
            currentTest = test;
            currentTest.select(question);
          });
        } else {
          // 如果数据已经加载，那么定位到选中的题目
          currentTest.select(question);
        }
      }
    };
  })();

  Dionysus.addInitializer(function () {
    var router = new Marionette.AppRouter({
      appRoutes: {
        'psychtests/:id(/)(:question)': 'showPsychTest',
        'psychtestsuites(/)' : 'showPsychTestSuites'
      },
      controller: psychtestController
    });
    router.on('route', function(route, params) {
      // 心理测试的数据是一次读取并cache全部的测试题目，在题目之间迁移是不会再次发送数据请求
      // 一旦超出当前测试就清空cache，释放内存，保证view的重新渲染
      if (route !== 'showPsychTest') {
        psychtestController.clear();
      }
    });
  });
});
