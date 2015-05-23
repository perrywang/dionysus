Dionysus.module('Domain', function(Domain, Dionysus, Backbone, Marionette, $) {
  'use strict';


  var PsychTestQuestion = Backbone.RelationalHalResource.extend({
    urlRoot: '/api/v1/psychtestquestions'
  });

  var PsychTest = Backbone.RelationalHalResource.extend({
    urlRoot: '/api/v1/psychtests',
    initialize: function() {
      this.bind('change', this.updateCalculated, this);
    },
    updateCalculated : function(){
      var questions = this.embedded('questions') || [];
      this.set('total', questions.length, { silent : true });
    },
    defaults : {
      current : 1
    },
    halEmbedded: {
      questions: {
        type: Backbone.HasMany,
        relatedModel: PsychTestQuestion
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