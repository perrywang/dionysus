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
    className: 'item'
  });

  var ArticlesView = Marionette.CompositeView.extend({
    template: '#admin-articles-tpl',
    childView: ArticleView,
    childViewContainer: '.items',
    className: 'container'
  });

  var ArticleDetailView = Marionette.ItemView.extend({
    template: '#admin-article-detail-tpl',
    tagName: 'article'
  });

  var ArticleEditView = Marionette.ItemView.extend({
    template: '#admin-article-detail-edit-tpl',
    tagName: 'form',
    className: 'ui form'
  });

  var ArticleCreateView = Marionette.ItemView.extend({
    template: '#admin-article-create-tpl',
    tagName: 'form',
    className: 'ui form'
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
        var viewer = new ArticleDetailView({ model: article});
        Dionysus.mainRegion.show(viewer);
        viewer.$el.find('.editor').editable({inlineMode: false});
        viewer.$el.find('select.dropdown').dropdown();
      });
    },
    createArticle: function() {
      var article = new ArticleModel({});
      var editor = new ArticleCreateView({model: article});
      Dionysus.mainRegion.show(editor);
      // make sure all js code has been loaded.
      // TODO: should fire event to update ui
      $(function() {
        editor.$el.find('.editor').editable({inlineMode: false});
        editor.$el.find('select.dropdown').dropdown();
      });
    },
    editArticle: function(id) {
      var article = new ArticleModel({id: id});
      article.fetch({ data: { projection: 'detail' }}).then(function() {
        var editor = new ArticleEditView({ model: article});
        Dionysus.mainRegion.show(editor);
        editor.$el.find('.editor').editable({inlineMode: false});
        editor.$el.find('select.dropdown').dropdown();
      });
    }
  });

  Dionysus.addInitializer(function() {
    new Marionette.AppRouter({
      appRoutes : {
        'admin/articles(/)': 'showArticles',
        'admin/articles/create(/)': 'createArticle',
        'admin/articles/:id(/)': 'showArticle',
        'admin/articles/:id/edit': 'editArticle'
      },
      controller: new ArticleController()
    });
  });
});
