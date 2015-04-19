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
});

