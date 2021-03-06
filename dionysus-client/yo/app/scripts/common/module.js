Dionysus.module('Entities', function(Entities, Dionysus, Backbone, Marionette, $) {
  'use strict';

  Entities.Module = Backbone.Model.extend({
    urlRoot: '/api/v1/modules'
  });

  Entities.ModuleCollection = Backbone.Collection.extend({
    url: '/api/v1/modules',
    parse: function(response) {
      var embedded = response._embedded;
      return embedded ? embedded.modules : [];
    },
    model: Entities.Module
  });

  Dionysus.reqres.setHandler('module:entities', function() {
    var modules = new Entities.ModuleCollection();
    var defer = $.Deferred();
    modules.fetch().then(function() {
      defer.resolve(modules);
    });
    return defer;
  });

});

