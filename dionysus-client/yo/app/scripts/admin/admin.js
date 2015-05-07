Dionysus.module('Admin.Home', function(Home, Dionysus, Backbone, Marionette) {
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

  var links = new Dionysus.Entities.LinkCollection([
    { name: 'Home',       href: '/admin',             icon: 'home'  },
    { name: 'Articles',   href: '/admin/articles',    icon: 'edit'  },
    { name: 'Categories', href: '/admin/categories',  icon: 'inbox' },
    { name: 'Tests',      href: '/admin/tests',       icon: 'lab'   },
    { name: 'Courses',    href: '/admin/courses',     icon: 'edit'  }
  ]);

  Dionysus.addInitializer(function() {
    Dionysus.mainNavRegion.show(new Dionysus.Common.HeaderView({collection: links}));
    new Marionette.AppRouter({
      appRoutes : { 
        'admin(/)': 'showHome' 
      },
      controller: new AdminHomeController()
    });
  });
});