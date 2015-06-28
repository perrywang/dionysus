Dionysus.module('Domain', function(Domain, Dionysus, Backbone, Marionette, $) {
  'use strict';

  var PsychTestQuestion = Backbone.RelationalHalResource.extend({
    urlRoot: '/api/v1/psychtestquestions',
    getAnswer : function() {
      var answers = this.answers;
      return answers ? answers.findWhere({qid : this.id}) : null;
    }
  });

  var PsychTest = Backbone.RelationalHalResource.extend({
    urlRoot: '/api/v1/psychtests',
    halEmbedded: {
      questions: {
        type: Backbone.HasMany,
        relatedModel: PsychTestQuestion
      }
    },
    mergetLastResult : function(result) {
      var answers = result.embedded('answers');
      this.answers = answers;
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
        total : this.total
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

  var PsychTestResult = Backbone.RelationalHalResource.extend({
    url : '/api/v1/psychtestresults',
    halEmbedded: {
      test : {
        type : Backbone.One,
        relatedModel : PsychTest
      }
    }
  });













  Dionysus.reqres.setHandler('psychtestsuite:instances', function() {
    var resources = new PsychTestSuiteCollection(), defer = $.Deferred();
    resources.fetch().then(function() {
      defer.resolve(resources.embedded('psychtestsuites')); 
    });
    return defer.promise();
  });

  Dionysus.reqres.setHandler('psychtests:instance', function (id) {
    var test = PsychTest.findOrCreate({
      id : id,
      _links : {
        self: {
          href : '/api/v1/psychtests/' + id 
        }
      }
    }), defer = $.Deferred();
    test.fetch().then(function () {
      defer.resolve(test);
    });
    return defer.promise();
  });







  var PsychTestAnswer = Backbone.RelationalHalResource.extend({
    url: '/api/v1/psychtestanswers'
  });



  var PsychTestResult = Backbone.RelationalHalResource.extend({
    halEmbedded : {
      test : {
        type : Backbone.HasOne,
        relatedModel : PsychTest
      },
      answers : {
        type : Backbone.HasMany,
        relatedModel : PsychTestAnswer
      }
    }
  });

  var PsychTestResultCollection = Backbone.RelationalHalResource.extend({
    url: '/api/v1/psychtestresults',
    halEmbedded: {
      type: Backbone.HasMany,
      relatedModel: PsychTestResult
    }
  });

  Dionysus.reqres.setHandler('psychtestresults:submit', function(results) {
    var result = new PsychTestResult({

    });
    result.save();
  });

  Dionysus.reqres.setHandler('psychtestresults:instance', function(id) {
    var result = PsychTestResult.findOrCreate({
      id : id,
      _links : {
        self: {
          href : '/api/v1/psychtestresults/' + id 
        }
      }
    }), defer = $.Deferred();
    result.fetch().then(function () {
      defer.resolve(result);
    }).fail(function(xhr) {
      if (xhr.status === 404) {
        defer.resolve(new PsychTestResult({}));
      } else {
        defer.reject();
      }
    });
    return defer.promise();
  });

});