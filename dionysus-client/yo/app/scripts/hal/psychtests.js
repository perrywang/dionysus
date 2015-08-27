Dionysus.module('Domain', function(Domain, Dionysus, Backbone, Marionette, $) {
  'use strict';

  var PsychTestQuestion = Backbone.RelationalHalResource.extend({
    urlRoot: '/api/v1/psychtestquestions',
    getAnswer : function() {
      var answers = this.answers;
      return answers ? answers.findWhere({qid : this.id}) : null;
    }
  });

  var PsychTestQuestionOption = Backbone.RelationalHalResource.extend({
    urlRoot: '/api/v1/psychtestquestionoptions'
  });

  var PsychTest = Backbone.RelationalHalResource.extend({
    // urlRoot: '/api/v1/psychtests',
    // url : function() {
    //   return '/api/v1/psychtests/' + this.get('id');
    // },
    // halUrl : '/api/v1/psychtests',
    url : function() {
      return '/api/v1/psychtests/' + this.get('id');
    },
    halEmbedded: {
      questions: {
        type: Backbone.HasMany,
        relatedModel: PsychTestQuestion
      }
    },
    initResult : function(result) {
      // 传入参数是一个经过projection的对象，不是原本的entity，需要重新建立answer对象
      var answers = result.embedded('answers');
      this.answers = answers || new Backbone.Collection();
      this.state = result.get('state');
      this.cachedResults = result;
    },
    saveResults : function() { // 保存中间状态
      // this.cachedResults.save();
      // console.log(this.cachedResults.toJSON());
      var data = this.cachedResults.toData();
      var cachedResults = this.cachedResults;
      if(this.answers.length == 0) return;

      $.ajax({
        url: '/controllers/psychtest/' + this.id + '/submit',
        method: 'POST',
        dataType:"json",
        //contentType: 'application/json',
        contentType: 'text/plain',
        data: JSON.stringify(data)
      }).done(function(data) {
        if(typeof data === "number") cachedResults.set("id", data);
        alert('保存成功');
      });
    },
    submitResults : function() {
      this.cachedResults.set('state', 'FINISHED');
      // this.cachedResults.save();
      // console.log(this.cachedResults.toJSON());
    },
    updateResult : function(question, answer) {
      var type = question.get('type');
      var val = null;
      switch(type){
        case 'SINGLE_CHOICE': 
          val = parseInt(answer, 10);
          break;
        case 'YES_NO':
          val = Boolean(parseInt(answer, 10));
          break;
      }

      var result_answer = this.answers.findWhere({qid : question.id});
      if(result_answer){
        result_answer.set("value",val);
      }
      else{
        result_answer = new PsychTestAnswer({value:val, type: type, qid: question.id});
        this.answers.add(result_answer);
      }

      console.log(type);
    },
    canUpdate : function() {
      return ['FINISHED', 'WAIT_FEEDBACK', 'DONE'].indexOf(this.state) === -1;
    },
    initialize : function() {
      this.on('sync', this.updateMeta, this);
    },
    updateMeta : function() {
      var questions = this.embedded('questions');  // TODO: use backbone.choice
      this.questions = questions;
      this.total = questions.length;
    },
    hasNext : function() {
      var index = this.questions.indexOf(this.current);
      return index >= 0 && index + 1 < this.total;
    },
    hasPrev : function() {
      var index = this.questions.indexOf(this.current);
      return index > 0;
    },
    getNavData : function() {
      var index = this.questions.indexOf(this.current), next = {}, prev = {};
      if (this.hasPrev()) {
        prev = this.questions.at(index - 1);
      }
      if (this.hasNext()) {
        next = this.questions.at(index + 1);
      }
      return {
        current : index + 1,
        prev : prev.id,
        next : next.id,
        hasPrev : this.hasPrev(),
        hasNext : this.hasNext(),
        question : this.id,
        total : this.total,
        canUpdate : this.canUpdate()
      };
    },
    select : function(question) {
      if (!question) { question = this.questions.at(0); }
      if (_.isString(question)) { question = parseInt(question, 10); }
      if (_.isNumber(question)) { question = this.questions.get(question); }

      this.current = question;
      question.answers = this.answers;
      this.trigger('select', question);
    }
  });













  var PsychTestSuite = Backbone.RelationalHalResource.extend({});

  var PsychTestSuiteCollection = Backbone.RelationalHalResource.extend({
    url: '/api/v1/psychtestsuites',
    halEmbedded: {
      psychtestsuites: {
        type: Backbone.HasMany,
        relatedModel: PsychTestSuite
      }
    }
  });




  var PsychTestQuestionResult = Backbone.RelationalHalResource.extend({});

  /*var PsychTestResult = Backbone.RelationalHalResource.extend({
    url : '/api/v1/psychtestresults',
    halEmbedded: {
      test : {
        type : Backbone.One,
        relatedModel : PsychTest
      }
    }
  });*/













  Dionysus.reqres.setHandler('psychtestsuite:instances', function() {
    var resources = new PsychTestSuiteCollection(), defer = $.Deferred();
    resources.fetch().then(function() {
      defer.resolve(resources.embedded('psychtestsuites')); 
    });
    return defer.promise();
  });

  Dionysus.reqres.setHandler('psychtests:instance', function (id) {
    var test = PsychTest.findOrCreate({ id : id }), defer = $.Deferred();
    test.fetch().then(function () {
      defer.resolve(test);
    });
    return defer.promise();
  });







  var PsychTestAnswer = Backbone.RelationalHalResource.extend({
    url: '/api/v1/psychtestanswers'
  });



  var PsychTestResult = Backbone.RelationalHalResource.extend({
    urlRoot: '/api/v1/psychtestresults',
    defaults : {
      state : 'IN_PROGRESS'
    },
    halEmbedded : {
      test : {
        type : Backbone.HasOne,
        relatedModel : PsychTest
      },
      answers : {
        type : Backbone.HasMany,
        relatedModel : PsychTestAnswer
      }
    },
    toData : function() {
      var json = this.toJSON();
      var answers = this.embedded('answers');
      json.answers = answers.toJSON();
      var test = this.embedded('test');
      if (test) {
        json.test = {
          id : test.id
        }
      }
      return json;
    }
  });

  var PsychTestResultCollection = Backbone.RelationalHalResource.extend({
    url: '/api/v1/psychtestresults',
    halEmbedded: {
      type: Backbone.HasMany,
      relatedModel: PsychTestResult
    }
  });


  Dionysus.reqres.setHandler('psychtestresults:instance', function(id) {
    var defer = $.Deferred();
    if (id) {
      var result = PsychTestResult.findOrCreate({
          id: id
        });
      result.fetch({
        url: '/api/v1/psychtestresults/' + id
      }).then(function() {
        defer.resolve(result);
      }).fail(function(xhr) {
        if (xhr.status === 404) {
          var r = new PsychTestResult();
          r.set("_embedded", {answers: new Backbone.Collection()});
          defer.resolve(r);
          /*defer.resolve(new PsychTestResult({}));*/
        } else {
          defer.reject();
        }
      });
    }
    else {
      var r = new PsychTestResult();
      r.set("_embedded", {answers: new Backbone.Collection()});
      defer.resolve(r);
      /*defer.resolve(new PsychTestResult());*/
    }
    return defer.promise();
  });

});