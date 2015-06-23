Dionysus.module('Site', function(Site, Dionysus, Backbone, Marionette) {
  'use strict';

  var SiteView = Marionette.ItemView.extend({
    template : JST['templates/home/site']
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
        '(/)': 'showSiteMenu'
      },
      controller: new SiteController()
    });
  });
});
