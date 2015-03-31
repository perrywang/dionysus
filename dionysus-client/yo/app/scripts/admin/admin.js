Dionysus.module('AdminHome', function(AdminHome, Dionysus, Backbone, Marionette) {
  'use strict';

  var HomeView = Marionette.ItemView.extend({
    template: '#admin-home-tpl',
    className: 'container'
  });

  var AdminHomeController = Marionette.Controller.extend({
    showHome: function() {
      Dionysus.mainRegion.show(new HomeView());
    }
  });

  Dionysus.addInitializer(function() {
    new Marionette.AppRouter({
      appRoutes : { 
        'admin(/)': 'showHome' 
      },
      controller: new AdminHomeController()
    });
  });
});