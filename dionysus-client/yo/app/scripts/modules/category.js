Dionysus.module('DionysusApp.Categories', function(Categories, Dionysus, Backbone) {
  'use strict';

  var Category = Backbone.Model.extend({
    urlRoot: '/api/v1/categories'
  });

  var CategoryCollection = Backbone.Collection.extend({
    url: '/api/v1/categories',
    parse: function(response) {
      return response._embedded.categories;
    },
    model: Category
  });
});

