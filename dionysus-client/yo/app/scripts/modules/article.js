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
      Dionysus.request('article:instances').done(function(resources) {
        var articles = resources.embedded('articles');
        Dionysus.mainRegion.show(new ArticlesView({ collection: articles }));
      });
    },
    showArticle: function(id) {
      Dionysus.request('article:instance', id).done(function(article) {
        Dionysus.mainRegion.show(new ArticleDetailView({ model: article}));
      });
    },

    showArticlesByAuthor: function(userid){
      var articleFetching = Dionysus.request('articles:createdby', userid);
      $.when(articleFetching).done(function(articles) {
        Dionysus.mainRegion.show(new ArticlesView({ collection: articles}));
      });
    }
  });

  Dionysus.addInitializer(function() {
    new Marionette.AppRouter({
      appRoutes : {
        'app/articles/createdBy/:id' : 'showArticlesByAuthor',
        'app/articles(/)': 'showArticles',
        'app/articles/:id(/)': 'showArticle'

      },
      controller: new ArticleController()
    });
  });
});
