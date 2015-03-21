Dionysus.module('DionysusApp.Articles', function(Articles, Dionysus, Backbone, Marionette, $, _) {
  'use strict';

  var Article = Backbone.Model.extend({
    urlRoot: '/api/v1/articles'
  });

  var ArticleCollection = Backbone.Collection.extend({
    url: '/api/v1/articles',
    parse: function(response) {
      return response._embedded.articles;
    },
    model: Article
  });

  var ArticleView = Marionette.ItemView.extend({ 
    template: '#article-tpl',
    tagName: 'li',
    className: 'collection-item'
  });

  var ArticlesView = Marionette.CompositeView.extend({
    template: '#articles-tpl',
    childView: ArticleView,
    childViewContainer: 'ul.collection',
    className: 'container'
  });

  var ArticleDetailView = Marionette.ItemView.extend({
    template: '#article-detail-tpl',
    tagName: 'article'
  });

  var HeaderView = Marionette.ItemView.extend({
    template: '#header-tpl',
    tagName: 'nav'
  });

  var articles = new ArticleCollection();
  var views = new ArticlesView({ collection: articles });

  var ArticleController = Marionette.Controller.extend({
    showArticles: function () {
      Dionysus.mainRegion.show(views);
      Dionysus.headerRegion.show(new HeaderView());
      articles.fetch();
    },
    showArticle: function(id) {
      alert(id);
    } 
  });

  Dionysus.addInitializer(function() {
    new Marionette.AppRouter({
      appRoutes : {
        "app/articles(/)": "showArticles",
        "app/articles/:id": "showArticle"
      },
      controller: new ArticleController()
    });
  });
});
