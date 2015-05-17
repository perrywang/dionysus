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

  var ArticleLayoutView = Dionysus.Common.Views.Page2Layout.extend({
    regions:{
      'doc': '#docsegment',
      'video': '#videosegment',
      'audio': '#audiosegment',
      'original': '#originalsegment'
    }
  });

  var ArticleItemView = Marionette.ItemView.extend({
    template: '#article-item-tpl',
    tagName: 'div',
    className: 'item'
  });

  var ArticleSegmentView = Marionette.ItemView.extend({
    template: '#article-doc-tpl',
    onRender: function(){
      var x;
    }
  });


  var ArticleController = Marionette.Controller.extend({
    showArticles: function (pageId) {
      
      //show loading before get any data
      Dionysus.mainRegion.show(new Dionysus.Common.Views.Loading());
      //show layout view in main block
      var layout = new ArticleLayoutView();
      Dionysus.mainRegion.show(layout);

      //get the data and show sections in layout view
      Dionysus.request('article:instances', pageId, 8).done(function(resources) {
        var articles = resources.embedded('articles');
        //shorten the summay if it`s too long
        for (var i = articles.models.length - 1; i >= 0; i--) {
          var model = articles.models[i];
          model.set('summary2',model.get('summary').slice(0,30) + '...');
        };
        
        var pageObj = new Backbone.Model(resources.get('page'));
        //Dionysus.mainRegion.show(new ArticlesView({ collection: articles, model: pageObj }));      

        var docsegment = new Dionysus.Common.Views.Page2Segment({collection:articles});    
        layout.getRegion('doc').show(docsegment);

      });
    },
    showArticlesByCategoryAndType: function( category, type){

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
        'articles/:id(/)': 'showArticle',

      },
      controller: new ArticleController()
    });
  });
});
