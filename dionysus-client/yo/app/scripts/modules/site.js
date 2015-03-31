Dionysus.module('Site', function(Site, Dionysus, Backbone, Marionette) {
  'use strict';

  var MenuView = Marionette.CollectionView.extend({

  });
 
  var SiteController = Marionette.Controller.extend({
    showSiteMenu: function() {
      var fetching = Dionysus.request('menu:entities');
      $.when(fetching).done(function(menus) {
        Dionysus.subNavRegion.show(new Dionysus.Common.HeaderView({
          collection: menus,
          className: 'ui secondary menu'
        }));
        Dionysus.mainRegion.empty();
      });
    }
  });


  Dionysus.addInitializer(function() {
    new Marionette.AppRouter({
      appRoutes : { 
        'app/site(/)': 'showSiteMenu'
      },
      controller: new SiteController()
    });
  });
});
