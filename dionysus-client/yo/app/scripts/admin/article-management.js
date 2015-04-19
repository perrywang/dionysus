Dionysus.module('AdminArticle', function(Article, Dionysus, Backbone, Marionette, $) {
  'use strict';

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

  var ArticleEditorView = Marionette.ItemView.extend({
    template: '#admin-article-editor-tpl',
    tagName: 'form',
    className: 'ui form',
    initialize: function(options) {
      this.model = options.model;
      this.categories = options.categories;
    },
    serializeData: function(){
      var data = this.model.toJSON();
      data.categories = this.categories;
      return data;
    },
    onRender: function() {
      this.$('select.dropdown').dropdown();
      this.$el.form({
        title: {
          identifier: 'title',
          rules: [{
            type: 'empty',
            prompt: 'Please enter a title'
          }]
        },
        categoryId: {
          identifier: 'categoryId',
          rules: [{
            type: 'empty',
            prompt: 'Please enter a category'
          }]
        },
        summary: {
          identifier: 'summary',
          rules: [{
            type: 'empty',
            prompt: 'Please enter a summary'
          }]
        },
        body: {
          identifier: 'body',
          rules: [{
            type: 'empty',
            prompt: 'Please enter article body'
          }]
        }
      });

      this.$el.form('set values', this.model.toJSON());
      this.$('.editor').editable({
        inlineMode: false, 
        language: 'zh_cn',
        imageUploadURL: '/api/v1/upload',
        fileUploadURL: '/api/v1/upload'
      });
    },
    ui : {
      save : '.button.submit'
    },
    events: {
      'click @ui.save' : 'saveArticle'
    },
    saveArticle: function() {
      var json = this.$el.form('get values');
      this.model.set(json);
      this.model.save();
    }
  });

  var ArticleController = Marionette.Controller.extend({
    showArticles: function () {
      Dionysus.request('article:instances').then(function(articles) {
        Dionysus.mainRegion.show(new ArticlesView({ collection: articles }));
      });
    },
    createArticle: function() {
      var article = Dionysus.request('article:new');
      var fetchingCategory = Dionysus.request('category:instances');
      $.when(fetchingCategory).done(function(categories) {
        var editor = new ArticleEditorView({
          model: article, 
          categories: categories
        });
        Dionysus.mainRegion.show(editor);
      });
    },
    editArticle: function(id) {
      Dionysus.request('article:instance', id).then(function(article) {
        var category = article.link('category');
        console.log(category);
        category.fetch();
        var editor = new ArticleEditorView({ model: article, categories: []});
        Dionysus.mainRegion.show(editor);
      });
    }
  });

  Dionysus.addInitializer(function() {
    new Marionette.AppRouter({
      appRoutes : {
        'admin/articles(/)': 'showArticles',
        'admin/articles/create(/)': 'createArticle',
        'admin/articles/:id': 'editArticle'
      },
      controller: new ArticleController()
    });
  });
});
