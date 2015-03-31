/*
 * TODO: should remove duplicate model definition
 */
Dionysus.module('AdminArticle', function(Article, Dionysus, Backbone, Marionette, $) {
  'use strict';

  var CategoryCollection = Dionysus.Entities.CategoryCollection;
  var ArticleModel = Dionysus.Entities.Article;
  var categories = new CategoryCollection();

  var categoryTpl = _.template([
    '<% _.each(items, function(item) { %>',
      '<option value="<%= item.id %>" <% if(selected == item.id) {%>selected<%}%>>',
        '<%= item.name %>',
      '</option>',
    '<% }) %>'].join(''));

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

  var ArticleEditorView = Marionette.ItemView.extend({
    template: '#admin-article-editor-tpl',
    tagName: 'form',
    className: 'ui form',
    onRender: function() {
      
      // TODO: should use widget like component
      var html = categoryTpl({ items: categories.toJSON(), selected: this.model.id });
      var select = this.$('select[name="category"]');
      select.append(html);

      this.$('select.dropdown').dropdown();
      this.$el.form({
        title: {
          identifier: 'title',
          rules: [{
            type: 'empty',
            prompt: 'Please enter a title'
          }]
        },
        category: {
          identifier: 'category',
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
        }
      });

      this.$el.form('set values', this.model.toJSON());
      this.$('.editor').editable({inlineMode: false, language: 'zh_cn'});
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
      var fetchingArticles = Dionysus.request('article:entities');
      $.when(fetchingArticles).done(function(articles) {
        Dionysus.mainRegion.show(new ArticlesView({ collection: articles }));
      });
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
      var editor = new ArticleEditorView({model: article});
      categories.fetch().then(function() {
        Dionysus.mainRegion.show(editor);
      });
    },
    editArticle: function(id) {
      var articleFetching = Dionysus.request('article:entity', id);
      $.when(articleFetching).done(function(article) {
        var editor = new ArticleEditorView({ model: article});
        categories.fetch().then(function() {
          Dionysus.mainRegion.show(editor);
        });
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
