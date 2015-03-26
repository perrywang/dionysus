/*
 * TODO: should remove duplicate model definition
 */
Dionysus.module('DionysusApp.AdminArticle', function(Article, Dionysus, Backbone, Marionette, $, _) {
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
    template: '#admin-article-tpl',
    tagName: 'li',
    className: 'collection-item'
  });

  var ArticlesView = Marionette.CompositeView.extend({
    template: '#admin-articles-tpl',
    childView: ArticleView,
    childViewContainer: 'ul.collection',
    className: 'container'
  });

  var ArticleDetailView = Marionette.ItemView.extend({
    template: '#admin-article-detail-tpl',
    tagName: 'article'
  });

  var articles = new ArticleCollection();

  var ArticleController = Marionette.Controller.extend({
    showArticles: function () {
      console.log('show articles in admin page');
      Dionysus.mainRegion.show(new ArticlesView({ collection: articles }));
      articles.fetch({ data: { projection: 'summary' }});
    },
    showArticle: function(id) {
      var article = new ArticleModel({id: id});
      article.fetch({ data: { projection: 'detail' }}).then(function() {
        var viewer = new ArticleDetailView({ model: article});
        Dionysus.mainRegion.show(viewer);
        viewer.$el.find('.editor').editable({inlineMode: false});
        viewer.$el.find('select').material_select();
      });
    } 
  });

  Dionysus.addInitializer(function() {
    new Marionette.AppRouter({
      appRoutes : {
        'admin/articles(/)': 'showArticles',
        'admin/articles/:id(/)': 'showArticle'
      },
      controller: new ArticleController()
    });
  });
});
