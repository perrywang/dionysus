Dionysus.module('Category', function(Category, Dionysus, Backbone) {
  'use strict';

  var CategoryModel = Backbone.Model.extend({
    urlRoot: '/api/v1/categories'
  });

  var CategoryCollection = Backbone.Collection.extend({
    url: '/api/v1/categories',
    parse: function(response) {
      return response._embedded.categories;
    },
    model: CategoryModel
  });
});

