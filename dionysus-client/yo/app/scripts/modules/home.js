Dionysus.module('DionysusApp.Home', function(Home, Dionysus, Backbone, Marionette) {
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

  Dionysus.addInitializer(function() {
    new Marionette.AppRouter({
      appRoutes : { 
        '(/)': 'showHome',
        'app(/)': 'showHome'
      },
      controller: new HomeController()
    });
  });
});