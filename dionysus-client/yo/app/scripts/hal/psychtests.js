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
      this.total = questions.length;
    },
    hasNext : function() {
      var questions = this.embedded('questions');
      var index = questions.indexOf(this.current);
      return index + 1 < this.total;
    },
    hasPrev : function() {
      var questions = this.embedded('questions');
      var index = questions.indexOf(this.current);
      return index + 1 > 1;
    },
    getNavData : function() {
      var questions = this.embedded('questions');
      var index = questions.indexOf(this.current), next = {}, prev = {};
      if (this.hasPrev()) {
        prev = questions.at(index - 1);
      }
      if (this.hasNext()) {
        next = questions.at(index + 1);
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
      this.current = question;
      this.trigger('select', question);
    },
    selectById : function(id) {
      var questions = this.embedded('questions');
      var question = questions.get(id);
      this.select(question);
    },
    startTest : function() {
      var questions = this.embedded('questions');
      var first = questions.at(0);
      this.select(first);
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