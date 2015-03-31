Dionysus.module('Entities', function(Entities, Dionysus, Backbone, Marionette, $) {
  'use strict';

  Entities.Category = Backbone.Model.extend({
    urlRoot: '/api/v1/categories'
  });

  Entities.CategoryCollection = Backbone.Collection.extend({
    url: '/api/v1/categories',
    parse: function(response) {
      return response._embedded.categories;
    },
    model: Entities.Category
  });

});

