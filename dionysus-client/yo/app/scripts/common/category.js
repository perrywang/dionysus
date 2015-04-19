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

  Dionysus.reqres.setHandler('category:new', function() {
    return new Entities.Category();
  });

  Dionysus.reqres.setHandler('category:entity', function(id) {
    var category = new Entities.Category({id: id});
    var defer = $.Deferred();
    category.fetch().then(function(data) {
      defer.resolve(category);
    });
    return defer.promise();
  });

  Dionysus.reqres.setHandler('category:entities', function() {
    var categories = new Entities.CategoryCollection();
    var defer = $.Deferred();
    categories.fetch().then(function() {
      defer.resolve(categories);
    });
    return defer.promise();
  });

});

