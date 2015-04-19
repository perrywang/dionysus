Dionysus.module('Site', function(Site, Dionysus, Backbone, Marionette) {
  'use strict';

  var MenuView = Marionette.CollectionView.extend(
    {
      template: '#site-tpl'
    }
  );

  var SiteView = Marionette.ItemView.extend({
    template : '#site-tpl'
  });
 
  var SiteController = Marionette.Controller.extend({
    showSiteMenu: function() {
      var fetching = Dionysus.request('menu:entities');
      $.when(fetching).done(function(menus) {
        Dionysus.mainRegion.show(new SiteView({
          //collection: menus,
          //tagName: 'div',
          //className: 'ui inverted page grid masthead segment'
        }));
        //Dionysus.mainRegion.empty();
      });
    }
  });


  Dionysus.addInitializer(function() {
    new Marionette.AppRouter({
      appRoutes : { 
        'site(/)': 'showSiteMenu'
      },
      controller: new SiteController()
    });
  });
});
