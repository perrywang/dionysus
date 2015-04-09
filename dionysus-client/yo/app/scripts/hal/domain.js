Dionysus.module('Domain', function(Domain, Dionysus, Backbone, Marionette, $) {
  var Article = Backbone.RelationalModel.extend({
    urlRoot: '/api/v1/articles'
  });

  var ArticleCollection = Backbone.Collection.extend({
    url: '/api/v1/articles',
    model: Article
  });

  var ArticleResources = Backbone.RelationalHalResource.extend({
    url: '/api/v1/articles',
    halEmbeded: {
      articles: {
        type: Backbone.HasMany,
        relatedModel: Article,
        collectionType: ArticleCollection
      }
    }
  });

  var Category = Backbone.RelationalHalResource.extend({});

  Dionysus.reqres.setHandler('article:instances', function() {
    var resources = new ArticleResources();
    var defer = $.Deferred();
    resources.fetch({ data: { projection: 'summary' }}).then(function() {
      defer.resolve(resources.embedded('articles'));
    });
    return defer.promise();
  });
});