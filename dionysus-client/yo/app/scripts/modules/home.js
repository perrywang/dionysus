Dionysus.module('Home', function(Home, Dionysus, Backbone, Marionette) {
  'use strict';

  var ModuleView = Marionette.ItemView.extend({
    template: '#module-tpl',
    className: 'card fluid'
  });

  var ModulesView = Marionette.CompositeView.extend({
    template: '#modules-tpl',
    childView: ModuleView,
    childViewContainer: '.cards',
    className: 'ui segment'
  });

  var HomeController = Marionette.Controller.extend({
    showHome: function() {
      var fetching = Dionysus.request('module:entities');
      $.when(fetching).done(function(modules) {
        Dionysus.mainRegion.show(new ModulesView({ collection: modules }));
      });
    }
  });

  var HeaderloginView = Marionette.ItemView.extend({
    template: '#headerlogin-tpl',
    tagName: 'nav',
    className: 'ui menu'
  });
  
  var HeaderView = Marionette.ItemView.extend({
    template: '#header-tpl',
    tagName: 'nav',
    className: 'ui menu'
  });

  var FooterView = Marionette.ItemView.extend({
    template: '#footer-tpl'
  });

  Dionysus.addInitializer(function() {
    if(sessionStorage.getItem("authorized") == "enabled") {
      Dionysus.mainNavRegion.show(new HeaderloginView());
      Dionysus.footerRegion.show(new FooterView());
	}
	else {
	  Dionysus.mainNavRegion.show(new HeaderView());
      Dionysus.footerRegion.show(new FooterView());
	}
  });


  Dionysus.addInitializer(function() {
    new Marionette.AppRouter({
      appRoutes : { 
        '(/)': 'showHome'
      },
      controller: new HomeController()
    });
  });
});
