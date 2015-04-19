Dionysus.module('AdminCategory', function(Category, Dionysus, Backbone, Marionette) {
  'use strict';

  var validationRules = {
    identifier: 'name',
    rules: [{
      type: 'empty',
      prompt: 'Please enter category name'
    }]
  }

  var CategoryLineView = Marionette.ItemView.extend({
    tagName: "li",
    template: "#admin-category-tpl"
  });

  var CategoryListView = Marionette.CompositeView.extend({
    template: '#admin-categories-tpl',
    childViewContainer: 'ul',
    childView: CategoryLineView
  });

  var CategoryEditorView = Marionette.ItemView.extend({
    template: '#admin-category-editor-tpl',
    tagName: 'form',
    className: 'ui form',
    onRender: function() {
      this.$el.form(validationRules);
      this.$el.form('set values', this.model.toJSON());
    },
    ui: {
      save : '.button.submit'
    },
    events: {
      'click @ui.save' : 'saveCategory'
    },
    saveCategory : function() {
      var json = this.$el.form('get values');
      this.model.set(json);
      this.model.save();
      // this.model.save();
    }
  });

  var CategoryController = Marionette.Controller.extend({
    showCategories: function() {
      Dionysus.request('category:instances').then(function(categories) {
        Dionysus.mainRegion.show(new CategoryListView({ collection: categories }));
      });
    },
    createCategory: function() {
      var category = Dionysus.request('category:new');
      var editor = new CategoryEditorView({model: category});
      Dionysus.mainRegion.show(editor);
    },
    editCategory: function(id) {
      Dionysus.request('category:instance', id).then(function(category) {
        var editor = new CategoryEditorView({model: category});
        Dionysus.mainRegion.show(editor);
      });
    }
  });


  Dionysus.addInitializer(function() {
    new Marionette.AppRouter({
      appRoutes : { 
        'admin/categories(/)': 'showCategories',
        'admin/categories/create(/)': 'createCategory',
        'admin/categories/:id': 'editCategory'
      },
      controller: new CategoryController()
    });
  });
});