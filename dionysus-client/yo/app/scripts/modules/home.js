Dionysus.module('DionysusApp.Home', function(Home, Dionysus, Backbone, Marionette, $) {
  'use strict';

  var Module = Backbone.Model.extend({
    urlRoot: '/api/v1/modules'
  });

  var ModuleCollection = Backbone.Collection.extend({
    url: '/api/v1/modules',
    parse: function(response) {
      var embedded = response._embedded;
      return embedded ? embedded.modules : [];
    },
    model: Module
  });

  var SliderView = Marionette.ItemView.extend({
    template: '#module-tpl',
    className: 'col s12 m6 l4'
  });

  var SlidersView = Marionette.CompositeView.extend({
    template: '#modules-tpl',
    childView: SliderView,
    childViewContainer: 'div.container',
    className: 'row'
  });

  var HeaderView = Marionette.ItemView.extend({
    template: '#header-tpl',
    tagName: 'nav'
  });

  var modules = new ModuleCollection();
  var sliders = new SlidersView({ collection: modules });

  var HomeController = Marionette.Controller.extend({
    showHome: function() {
      Dionysus.mainRegion.show(sliders);
      Dionysus.headerRegion.show(new HeaderView());
      $('.dropdown-button').dropdown({
        inDuration: 300,
        outDuration: 225,
        constrain_width: false,
        alignment: 'right'
      });
      modules.fetch();
    }
  });

  Dionysus.addInitializer(function() {
    new Marionette.AppRouter({
      appRoutes : { "": "showHome" },
      controller: new HomeController()
    });
  });
});