Dionysus.module('AdminArticle', function(Article, Dionysus, Backbone, Marionette, $) {
  'use strict';

  var validationRules = {
    title:      { identifier: 'title',      rules: [{ type: 'empty', prompt: 'Please enter a title' }] },
    category:   { identifier: 'category',   rules: [{ type: 'empty', prompt: 'Please enter a category' }] },
    summary:    { identifier: 'summary',    rules: [{ type: 'empty', prompt: 'Please enter a summary' }] },
    body:       { identifier: 'body',       rules: [{ type: 'empty', prompt: 'Please enter article body' }] }
  };

  var ArticleView = Marionette.ItemView.extend({ 
    template: '#admin-article-tpl',
    tagName: 'li',
    className: 'item',
    ui: {
      deleteMe: '.button.delete'
    },
    events: {
      'click @ui.deleteMe': 'deleteArticle'
    },
    deleteArticle: function(e){
      e.stopPropagation();
      this.trigger('article:delete', this.model);
    }
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
      data.categories = this.categories.toSelection();
      return data;
    },
    onRender: function() {
      this.$('select.dropdown').dropdown();
      this.$el.form();
      var data = this.model.toJSON();
      var category = data.category;
      this.$el.form('set values', data);
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
      this.trigger('article:save', json);
    }
  });

  var ArticleController = Marionette.Controller.extend({
    showArticles: function () {
      
      //show loading before get any data
      Dionysus.mainRegion.show(new Dionysus.Common.Views.Loading());

      Dionysus.request('article:instances').then(function(articles) {
        var articleList = new ArticlesView({ collection: articles.embedded('articles') })
        articleList.on('childview:article:delete',function(childView, model){
            alert("delete this mode!");
            model.destroy();
        });
        Dionysus.mainRegion.show(articleList);
      });
    },
    createArticle: function() {
      $.when(Dionysus.request('article:new'), Dionysus.request('category:instances'))
        .done(function(article, categories) {
          var editor = new ArticleEditorView({ model: article, categories: categories });
          editor.on('article:save', function(json) {
            article.save(json,{patch:true}).done(function() {
              toastr.info('文章保存成功');
            });
          });
          Dionysus.mainRegion.show(editor);
        });
    },
    editArticle: function(id) {
      $.when(Dionysus.request('article:instance', id), Dionysus.request('category:instances'))
        .done(function(article, categories) {
          var editor = new ArticleEditorView({ model: article, categories: categories});
          editor.on('article:save', function(json) {
            article.save(json,{patch:true}).then(function() {
              toastr.info('文章保存成功');
            });
          });
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
