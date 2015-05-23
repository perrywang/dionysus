Dionysus.module('Domain', function(Domain, Dionysus, Backbone, Marionette, $) {
  'use strict';

  var PsychTest = Backbone.RelationalHalResource.extend({

  });


  Domain.PsychTestQuestion = Backbone.Model.extend({
  });

  Domain.PsychTestQuestionCollection = Backbone.Collection.extend({
    model: Domain.PsychTestQuestion,
    url: '/api/v1/testitems',
    parse: function (response) {
      var embedded = response._embedded;
      return embedded ? embedded.testitems : [];
    },
    state: {
      firstPage: 0
    },
    queryParams: {
      currentPage: 'page',
      pageSize: 'size'
    }
  });

  Domain.PsychTestQuestionOption = Backbone.Model.extend({
    defaults: {
      selected: false
    }
  });

  Domain.PsychTestItemOptionCollection = Backbone.Collection.extend({
    model: Domain.PsychTestQuestionOption
  });
  

  var PsychTestSuiteResources = Backbone.RelationalHalResource.extend({
    url: '/api/v1/psychtestsuites',
    halEmbedded: {
      psychtestsuites: {
        type: Backbone.HasMany,
        relatedModel: PsychTest
      }
    }
  });

  Domain.PsychTest = Backbone.Model.extend({
    defaults: {
      'current': 0
    },
    urlRoot: '/api/v1/psychtests'
  });

  Dionysus.reqres.setHandler('psychtestsuite:instance', function (id) {
    var test = new Domain.PsychTest({id: id});
    var defer = $.Deferred();
    test.fetch().then(function () {
      defer.resolve(test);
    });
    return defer.promise();
  });

  Dionysus.reqres.setHandler('psychtestsuite:instances', function() {
    var resources = new PsychTestSuiteResources(), defer = $.Deferred();
    resources.fetch().then(function() { 
      defer.resolve(resources.embedded('psychtestsuites')); 
    });
    return defer.promise();
  });
});