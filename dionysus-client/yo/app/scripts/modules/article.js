Dionysus.module('DionysusApp.Article', function(Article, Dionysus, Backbone, Marionette) {
  'use strict';

  var ArticleModel = Backbone.Model.extend({
    urlRoot: '/api/v1/articles'
  });

  var ArticleCollection = Backbone.Collection.extend({
    url: '/api/v1/articles',
    parse: function(response) {
      return response._embedded.articles;
    },
    model: ArticleModel
  });

  var ArticleView = Marionette.ItemView.extend({ 
    template: '#article-tpl',
    tagName: 'li',
    className: 'item'
  });

  var ArticlesView = Marionette.CompositeView.extend({
    template: '#articles-tpl',
    childView: ArticleView,
    childViewContainer: '.items',
    className: 'ui page'
  });

  var ArticleDetailView = Marionette.ItemView.extend({
    template: '#article-detail-tpl',
    tagName: 'article',
    className: 'ui page'
  });

  var articles = new ArticleCollection();

  var ArticleController = Marionette.Controller.extend({
    showArticles: function () {
      Dionysus.mainRegion.show(new ArticlesView({ collection: articles }));
      articles.fetch({ data: { projection: 'summary' }});
    },
    showArticle: function(id) {
      var article = new ArticleModel({id: id});
      article.fetch({ data: { projection: 'detail' }}).then(function() {
        Dionysus.mainRegion.show(new ArticleDetailView({ model: article}));
      });
    } 
  });

  Dionysus.addInitializer(function() {
    new Marionette.AppRouter({
      appRoutes : {
        'app/articles(/)': 'showArticles',
        'app/articles/:id(/)': 'showArticle'
      },
      controller: new ArticleController()
    });
  });
});
