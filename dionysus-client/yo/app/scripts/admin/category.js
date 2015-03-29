Dionysus.module('DionysusApp.AdminCategory', function(Category, Dionysus, Backbone, Marionette) {
  'use strict';

  var CategoryView = Marionette.ItemView.extend({
    template: '#admin-categories-tpl',
    className: 'container'
  });

  var CategoryController = Marionette.Controller.extend({
    showCategories: function() {
      Dionysus.mainRegion.show(new CategoryView());
    }
  });

  Dionysus.addInitializer(function() {
    new Marionette.AppRouter({
      appRoutes : { 
        'admin/categories(/)': 'showCategories' 
      },
      controller: new CategoryController()
    });
  });
});