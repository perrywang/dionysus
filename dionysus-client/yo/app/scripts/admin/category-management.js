Dionysus.module('AdminCategory', function(Category, Dionysus, Backbone, Marionette) {
  'use strict';

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
      this.$el.form({
        identifier: 'name',
        rules: [{
          type: 'empty',
          prompt: 'Please enter category name'
        }]
      });
      this.$el.form('set values', this.model.toJSON());
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
      Dionysus.request('category:instance').then(function(category) {
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