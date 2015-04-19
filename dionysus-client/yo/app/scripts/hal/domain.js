Dionysus.module('Domain', function(Domain, Dionysus, Backbone, Marionette, $) {
  var Category = Backbone.RelationalHalResource.extend({
    url: '/api/v1/categories'
  });

  var Article = Backbone.RelationalHalResource.extend({
    relations: [{
      type: Backbone.HasOne,
      key: 'category',
      relatedModel: Category
    }]
  });

  ArticleResources = Backbone.RelationalHalResource.extend({
    url: '/api/v1/articles',
    halEmbedded: {
      articles: {
        type: Backbone.HasMany,
        relatedModel: Article
      }
    }
  });

  Dionysus.reqres.setHandler('article:instances', function() {
    var resources = new ArticleResources(), defer = $.Deferred();
    resources.fetch({ data: { projection: 'summaryWithCategory' }}).then(function() {
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
    article.fetch({ data: { projection: 'detailsWithCategory'}}).then(function() {
      defer.resolve(article);
    });
    return defer.promise();
  });
});