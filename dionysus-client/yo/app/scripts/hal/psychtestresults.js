Dionysus.module('Domain', function(Domain, Dionysus, Backbone, Marionette, $) {
  'use strict';

  var PsychTestResult = Backbone.RelationalHalResource.extend({});

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

});