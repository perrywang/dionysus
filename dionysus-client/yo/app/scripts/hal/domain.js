Dionysus.module('Domain', function(Domain, Dionysus, Backbone, Marionette, $) {
  Article = Backbone.RelationalHalResource.extend({});

  ArticleResources = Backbone.RelationalHalResource.extend({
    url: '/api/v1/articles',
    halEmbedded: {
      articles: {
        type: Backbone.HasMany,
        relatedModel: Article
      }
    }
  });

  var Category = Backbone.RelationalHalResource.extend({});

  Dionysus.reqres.setHandler('article:instances', function() {
    var resources = new ArticleResources(), defer = $.Deferred();
    resources.fetch({ data: { projection: 'summary' }}).then(function() {
      defer.resolve(resources.embedded('articles'));
    });
    return defer.promise();
  });

  Dionysus.reqres.setHandler('article:instance', function(id) {
    // TODO: single resource fetch
    var Article = Backbone.RelationalHalResource.extend({ 
      url: '/api/v1/articles/' + id
    });
    var article = new Article(), defer = $.Deferred();
    article.fetch({ data: { projection: 'detail'}}).then(function() {
      defer.resolve(article);
    });
    return defer.promise();
  });

  Dionysus.reqres.setHandler('article:new1', function() {

  });
});