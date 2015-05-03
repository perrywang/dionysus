Dionysus.module('Article', function(Article, Dionysus, Backbone, Marionette) {
  'use strict';

  var ArticleView = Marionette.ItemView.extend({
    template: '#article-cards-tpl',
    tagName: 'div',
    className: 'card'
  });

  var ArticlesView = Marionette.CompositeView.extend({
    template: '#articles-cards-tpl',
    childView: ArticleView,
    childViewContainer: '.ui.cards',
    className: 'ui page',
    onDomRefresh: function(){
      //console.log(this.model);
      var page = this.model;
      if(page.get('number') === 0) this.$('.button.left').hide();
      else if(page.get('number') === page.get('totalPages')-1) this.$('.button.right').hide();
  }});

  var ArticleDetailView = Marionette.ItemView.extend({
    template: '#article-detail-tpl',
    tagName: 'article',
    className: 'ui page'
  });

  var ArticleController = Marionette.Controller.extend({
    showArticles: function (pageId) {
      
      //show loading before get any data
      Dionysus.mainRegion.show(new Dionysus.Common.Views.Loading());

      Dionysus.request('article:instances', pageId).done(function(resources) {
        var articles = resources.embedded('articles');
        var pageObj = new Backbone.Model(resources.get('page'));
        Dionysus.mainRegion.show(new ArticlesView({ collection: articles, model: pageObj }));
      });
    },
    showArticle: function(id) {
      //show loading before get any data
      Dionysus.mainRegion.show(new Dionysus.Common.Views.Loading());
      
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

  Dionysus.on("before:start",function() {
    new Marionette.AppRouter({
      appRoutes : {
        'articles/createdBy/:id' : 'showArticlesByAuthor',
        'articles(/p:page)': 'showArticles',
        'articles/:id(/)': 'showArticle'

      },
      controller: new ArticleController()
    });
  });
});
