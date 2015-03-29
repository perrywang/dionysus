/*
 * TODO: should remove duplicate model definition
 */
Dionysus.module('DionysusApp.AdminArticle', function(Article, Dionysus, Backbone, Marionette, $, _) {
  'use strict';

  var ArticleModel = Backbone.Model.extend({
    urlRoot: '/api/v1/articles'
  });

  var ArticleCollection = Backbone.PageableCollection.extend({
    model: ArticleModel,
    url: '/api/v1/articles',
    parse: function(response) {
      var embedded = response._embedded;
      return embedded ? embedded.articles : [];
    },
    state: {
      firstPage: 0
    },
    queryParams: {
      currentPage: 'page',
      pageSize: 'size'
    }
  });

  var ArticleView = Marionette.ItemView.extend({ 
    template: '#admin-article-tpl',
    tagName: 'li',
    className: 'item'
  });

  var ArticlesView = Marionette.CompositeView.extend({
    template: '#admin-articles-tpl',
    childView: ArticleView,
    childViewContainer: '.items'
  });

  var ArticleDetailView = Marionette.ItemView.extend({
    template: '#admin-article-detail-tpl',
    tagName: 'article'
  });

  var ArticleEditView = Marionette.ItemView.extend({
    template: '#admin-article-detail-edit-tpl',
    tagName: 'form',
    className: 'ui form',
    onRender: function() {
      this.$('.editor').editable({inlineMode: false});
      this.$('select.dropdown').dropdown();
    }
  });

  var ArticleCreateView = Marionette.ItemView.extend({
    template: '#admin-article-create-tpl',
    tagName: 'form',
    className: 'ui form',
    onRender: function() {
      this.$('.editor').editable({inlineMode: false});
      this.$('select.dropdown').dropdown();
    }
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
      });
    },
    createArticle: function() {
      var article = new ArticleModel({});
      var editor = new ArticleCreateView({model: article});
      Dionysus.mainRegion.show(editor);
    },
    editArticle: function(id) {
      var article = new ArticleModel({id: id});
      article.fetch({ data: { projection: 'detail' }}).then(function() {
        var editor = new ArticleEditView({ model: article});
        Dionysus.mainRegion.show(editor);
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
