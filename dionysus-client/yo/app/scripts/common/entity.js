Dionysus.module('Entities', function(Entities, Dionysus, Backbone, Marionette, $) {
  'use strict';

  Entities.Page = Backbone.Model.extend({
    urlRoot: '/api/v1/pages'
  });

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

  Entities.Article = Backbone.Model.extend({
    urlRoot: '/api/v1/articles'
  });

  Entities.ArticleCollection = Backbone.PageableCollection.extend({
    model: Entities.Article,
    url: '/api/v1/articles',
    parse: function(response) {
      var embedded = response._embedded;
      return embedded ? embedded.articles : [];
    },
    state: {
      firstPage: 0
    },
    queryParams: {
      currentPage: 'page',
      pageSize: 'size'
    }
  });

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

  Dionysus.reqres.setHandler("article:entities", function() {
    var articles = new Entities.ArticleCollection();
    var defer = $.Deferred();
    articles.fetch({ data: { projection: 'summary' }}).then(function() {
      defer.resolve(articles);
    });
    return defer.promise();
  });

  Dionysus.reqres.setHandler("article:entity", function(id) {
    var article = new Entities.Article({id: id});
    var defer = $.Deferred();
    article.fetch({ data: { projection: 'detail' }}).then(function() {
      defer.resolve(article);
    });
    return defer.promise();
  });

});

