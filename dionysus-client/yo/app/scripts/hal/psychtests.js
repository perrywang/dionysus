Dionysus.module('Domain', function(Domain, Dionysus, Backbone, Marionette, $) {
  'use strict';

  var PsychTestQuestion = Backbone.RelationalHalResource.extend({
    urlRoot: '/api/v1/psychtestquestions'
  });

  var PsychTest = Backbone.RelationalHalResource.extend({
    urlRoot: '/api/v1/psychtests',
    defaults : {
      current : 1
    },
    halEmbedded: {
      questions: {
        type: Backbone.HasMany,
        relatedModel: PsychTestQuestion
      }
    },
    initialize: function() {
      this.bind('change', this.updateCalculated, this);
    },
    updateCalculated : function(){
      var questions = this.embedded('questions') || [],
          total = questions.length,
          current = this.get('current');

      var index = current - 1;
      
      this.set('hasPrev', index > 0, { silent : true });
      this.set('hasNext', index < total - 1, { silent : true });
      this.set('total', questions.length, { silent : true });
    },
    prevQuestion : function() {
      if (this.get('hasPrev')) {
        this.set('current', this.get('current') - 1); 
      }
    },
    nextQuestion : function() {
      if (this.get('hasNext')) {
        this.set('current', this.get('current') + 1);
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