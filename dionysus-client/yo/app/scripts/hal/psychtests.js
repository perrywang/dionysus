Dionysus.module('Domain', function(Domain, Dionysus, Backbone, Marionette, $) {
  'use strict';

  var PsychTestQuestion = Backbone.RelationalHalResource.extend({
    urlRoot: '/api/v1/psychtestquestions'
  });

  var PsychTest = Backbone.RelationalHalResource.extend({
    urlRoot: '/api/v1/psychtests',
    halEmbedded: {
      questions: {
        type: Backbone.HasMany,
        relatedModel: PsychTestQuestion
      }
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

  Dionysus.reqres.setHandler('psychtest:instance', function (id) {
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
});