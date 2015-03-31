Dionysus.module('Entities', function(Entities, Dionysus, Backbone, Marionette, $) {
  'use strict';

  Entities.Page = Backbone.Model.extend({
    urlRoot: '/api/v1/pages'
  });

});

