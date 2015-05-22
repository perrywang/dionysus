Dionysus.module('Entities', function(Entities, Dionysus, Backbone, Marionette, $) {
  'use strict';

  Entities.Article = Backbone.Model.extend({
    urlRoot: '/api/v1/articles'
  });

  Entities.ArticleCollection = Backbone.Collection.extend({
    model: Entities.Article,
    url: '/api/v1/articles',
    parse: function(response) {
      var embedded = response._embedded;
      return embedded ? embedded.articles : [];
    },

    initialize : function(options){
      if(options && options.appendUrl){
        this.url += options.appendUrl;
      }
    }
  });

  Entities.ArticleDto = Backbone.Model.extend({
    urlRoot: '/articles'
  });

  Entities.ArticleCollectionDto = Backbone.Collection.extend({
    model: Entities.ArticleDto,
    url: '/articles',
    parse: function(response){
      return response.content ? response.content : [];
    },
    initialize: function(options){
      if(options && options.appendUrl){
        this.url += options.appendUrl;
      }
    }
  });

  Dionysus.reqres.setHandler('articles:createdby', function(userid) {
    var articles = new Entities.ArticleCollection({appendUrl:'/search/findByCreatedBy'});
    var defer = $.Deferred();
    articles.fetch({ data: { author:userid }}).then(function() {
      defer.resolve(articles);
    });
    return defer.promise();
  });

  Dionysus.reqres.setHandler('article:new', function() {
    return new Entities.Article();
  });

  Dionysus.reqres.setHandler('article:byCategoryAndType', function(category, type, size) {
    var articles = new Entities.ArticleCollectionDto({ appendUrl:'/coverpage' });
    var defer = $.Deferred();
    
    category = category ? 1 : category;
    type = type? 'DOC' : type;
    size = size? 7 : size;

    articles.fetch({
      data: {
        category: category,
        type: type,
        size: size
      }
    }).then(function() {
      defer.resolve(articles);
    });
    return defer.promise();
  });
});

