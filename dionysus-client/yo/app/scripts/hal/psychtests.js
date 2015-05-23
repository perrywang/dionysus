Dionysus.module('Domain', function(Domain, Dionysus, Backbone, Marionette, $) {
  'use strict';

  var PsychTest = Backbone.RelationalHalResource.extend({});

  var TestSetResources = Backbone.RelationalHalResource.extend({
    url: '/api/v1/psychtestsuites',
    halEmbedded: {
      psychtestsuites: {
        type: Backbone.HasMany,
        relatedModel: PsychTest
      }
    }
  });

  Dionysus.reqres.setHandler('psychtestset:instances', function() {
    var resources = new TestSetResources(), defer = $.Deferred();
    resources.fetch().then(function() { 
      defer.resolve(resources.embedded('psychtestsuites')); 
    });
    return defer.promise();
  });
});