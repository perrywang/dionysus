Dionysus.module('Admin.Home', function(Home, Dionysus, Backbone, Marionette) {
  'use strict';

  var HomeView = Marionette.ItemView.extend({
    template: JST["templates/admin/home"],
    className: 'container'
  });

  var AdminHomeController = Marionette.Controller.extend({
    showHome: function() {
      Dionysus.mainRegion.show(new HomeView());
    }
  });

  var links = new Dionysus.Entities.LinkCollection([
    { name: '管理首页', href: '/admin',             icon: 'home'  },
    { name: '文章列表', href: '/admin/articles',    icon: 'edit'  },
    { name: '文章类别', href: '/admin/categories',  icon: 'inbox' },
    { name: '心理测试', href: '/admin/tests',       icon: 'lab'   },
    { name: '心理课程', href: '/admin/courses',     icon: 'edit'  }
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