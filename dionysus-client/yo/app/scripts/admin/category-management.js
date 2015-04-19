Dionysus.module('AdminCategory', function(Category, Dionysus, Backbone, Marionette) {
  'use strict';

  var validationRules = {
    identifier: 'name',
    rules: [{
      type: 'empty',
      prompt: 'Please enter category name'
    }]
  };

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
      this.trigger('category:save', json);
    }
  });

  var CategoryController = Marionette.Controller.extend({
    showCategories: function() {
      Dionysus.request('category:instances').then(function(categories) {
        var collection = categories.embedded('categories');
        Dionysus.mainRegion.show(new CategoryListView({ collection: collection }));
      });
    },
    createCategory: function() {
      var category = Dionysus.request('category:new');
      var editor = new CategoryEditorView({model: category});
      editor.on('category:save', function(json) {
        category.save(json).done(function() {
          toastr.info('Category has been created');
        });
      });
      Dionysus.mainRegion.show(editor);
    },
    editCategory: function(id) {
      Dionysus.request('category:instance', id).then(function(category) {
        var editor = new CategoryEditorView({model: category});
        editor.on('category:save', function(json) {
          category.save(json).done(function() {
            toastr.info('Category has been updated');
          })
        });
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