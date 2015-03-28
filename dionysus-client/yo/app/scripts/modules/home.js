Dionysus.module('DionysusApp.Home', function(Home, Dionysus, Backbone, Marionette, $) {
  'use strict';

  var ModuleModel = Backbone.Model.extend({
    urlRoot: '/api/v1/modules'
  });

  var ModuleCollection = Backbone.Collection.extend({
    url: '/api/v1/modules',
    parse: function(response) {
      var embedded = response._embedded;
      return embedded ? embedded.modules : [];
    },
    model: ModuleModel
  });

  var ModuleView = Marionette.ItemView.extend({
    template: '#module-tpl',
    className: 'card'
  });

  var ModulesView = Marionette.CompositeView.extend({
    template: '#modules-tpl',
    childView: ModuleView,
    childViewContainer: '.cards',
    className: 'ui segment'
  });

  var modules = new ModuleCollection();

  var HomeController = Marionette.Controller.extend({
    showHome: function() {
      Dionysus.mainRegion.show(new ModulesView({ collection: modules }));
      modules.fetch();
    }
  });

  Dionysus.addInitializer(function() {
    new Marionette.AppRouter({
      appRoutes : { 
        "(/)": "showHome" 
      },
      controller: new HomeController()
    });
  });
});