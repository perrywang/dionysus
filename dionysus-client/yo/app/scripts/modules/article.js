Dionysus.module('Article', function(Article, Dionysus, Backbone, Marionette) {
  'use strict';

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

  var ArticleController = Marionette.Controller.extend({
    showArticles: function () {
      var fetchingArticles = Dionysus.request('article:entities');
      $.when(fetchingArticles).done(function(articles) {
        Dionysus.mainRegion.show(new ArticlesView({ collection: articles }));
      });
    },
    showArticle: function(id) {
      var articleFetching = Dionysus.request('article:entity', id);
      $.when(articleFetching).done(function(article) {
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
