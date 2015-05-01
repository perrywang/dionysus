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

  var CategoryResources = Backbone.RelationalHalResource.extend({
    url: '/api/v1/categories',
    halEmbedded: {
      categories: {
        type: Backbone.HasMany,
        relatedModel: Category
      }
    },
    toSelection : function() {
      var categories = this.embedded('categories');
      return categories.map(function(category) {
        return {
          name : category.get('name'),
          link : category.link('self').href()
        }
      });
    }
  });

  var ArticleResources = Backbone.RelationalHalResource.extend({
    url: '/api/v1/articles',
    halEmbedded: {
      articles: {
        type: Backbone.HasMany,
        relatedModel: Article
      }
    }
  });

  Dionysus.reqres.setHandler('category:instances', function() {
    var resources = new CategoryResources(), defer = $.Deferred();
    resources.fetch().then(function() {
      defer.resolve(resources);
    });
    return defer.promise();
  });

  Dionysus.reqres.setHandler('category:instance', function(id) {
    var Category = Backbone.RelationalHalResource.extend({
      url: '/api/v1/categories/' + id
    });
    var category = new Category(), defer = $.Deferred();
    category.fetch().then(function() {
      defer.resolve(category);
    });
    return defer.promise();
  });

  Dionysus.reqres.setHandler('article:instances', function(pageId) {
    var resources = new ArticleResources(), defer = $.Deferred();
    var pageX = pageId?pageId:0;
    resources.fetch({ data: { projection: 'summary', page: pageX }}).then(function() {
      defer.resolve(resources);
    });
    return defer.promise();
  });

  Dionysus.reqres.setHandler('article:instances:page', function(pageId) {
    var resources = new ArticleResources(), defer = $.Deferred();
    resources.fetch({data: { projection: 'summary', page: pageId}}).then(function(){
      defer.resolve(resources);
    });
    return defer.promise();
  })

  Dionysus.reqres.setHandler('article:instance', function(id) {
    // TODO: single resource fetch
    var Article = Backbone.RelationalHalResource.extend({ 
      url: '/api/v1/articles/' + id
    });
    var article = new Article(), defer = $.Deferred();

    article.fetch({ data: { projection: 'details'}}).then(function() {
      article.link('category').fetchResource().then(function(data) {
        var category = data._links.self.href;
        article.set('category', category);
        defer.resolve(article);
      });
    });
    return defer.promise();
  });
});