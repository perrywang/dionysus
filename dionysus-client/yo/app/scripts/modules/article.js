Dionysus.module('Article', function(Article, Dionysus, Backbone, Marionette) {
  'use strict';

  /*
  View
  */

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
    template: JST['templates/home/article/detail'],
    tagName: 'article',
    className: 'ui centered grid article',

    initialize: function(){
      this.listenTo(this.model.get('comments'), 'add', this.render, this);
    },

    onRender: function(){
      var x;
    },

    events: {
      'click .icon.button': function() {
        if (sessionStorage.getItem("user")) {
          var data = Backbone.Syphon.serialize(this);
          if (data.mycomment && data.mycomment != "") {
            this.model.newComment(data);
          }
        }
        else alert("你需要先登录");
      }
    }
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

  var ArticleRailCatView = Marionette.ItemView.extend({
    template: '#category-layout-tpl',
    className: 'ui vertical menu',
    events: {
      "click a": "clicked"
    },
    clicked: function(e) {
     
      e.preventDefault();
      var id = $(e.currentTarget).data("id");
      var item = this.collection.get(id);
      var name = item.get("name");
      //alert(name);
      this.options.parentLayoutView.trigger("change:category", id);
    }
  });

/*
Controller
*/

  var ArticleController = Marionette.Controller.extend({
    showArticles: function (pageId) {
      /*
      //show loading before get any data
      Dionysus.mainRegion.show(new Dionysus.Common.Views.Loading());
      //show layout view in main block
      var layout = new ArticleLayoutView();
      layout.on("change:category", function(id){
        //get doc

      });
      Dionysus.mainRegion.show(layout);

      //get category data, and show them in the rail sticky segment as vertical menu items
      Dionysus.request('category:entities').done(function(categories){
        
        var railcontentView = new ArticleRailCatView({
          collection: categories, 
          parentLayoutView: layout 
        });

        layout.getRegion('railcontent').show(railcontentView);
      });


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
      */
      Dionysus.mainRegion.show(new Dionysus.Common.Views.Layout1());


    },
    showArticlesByCategoryAndType: function( category, type){
      console.log("xxx");
      Dionysus.mainRegion.show(new Dionysus.Common.Views.ItemListLayout());
    },
    showArticlesByCategory: function(category){

    },
    showArticle: function(id) {
      //show loading before get any data
      Dionysus.mainRegion.show(new Dionysus.Common.Views.Loading());
      
      Dionysus.request('article:instance:excerpt', id).done(function(article) {
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
        'articles/list(/)': 'showArticlesByCategoryAndType',
        'articles(/p:page)': 'showArticles',
        'articles/:id(/)': 'showArticle',
      },
      controller: new ArticleController()
    });
  });
});
