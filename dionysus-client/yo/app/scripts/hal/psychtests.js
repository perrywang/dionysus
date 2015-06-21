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
      return this.current < this.total;
    },
    hasPrev : function() {
      return this.current > 1;
    },
    getNavData : function() {
      return {
        current : this.current,
        hasPrev : this.hasPrev(),
        hasNext : this.hasNext(),
        total : this.total
      };
    },
    navigateTo : function(index) {
      this.current = index;
      this.trigger('nav', this.current);
    },
    startTest : function() {
      this.navigateTo(1);
    },
    currentQuestion : function() {
      var questions = this.embedded('questions');
      return questions.at(this.current - 1);
    },
    nextQuestion : function() {
      if (this.hasNext()) {
        this.navigateTo(this.current + 1);
      }
    },
    prevQuestion : function() {
      if (this.hasPrev()) {
        this.navigateTo(this.current - 1);
      }
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