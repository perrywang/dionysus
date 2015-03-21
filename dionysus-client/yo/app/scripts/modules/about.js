Dionysus.module('DionysusApp.About', function(About, Dionysus, Backbone, Marionette, $, _) {
  'use strict';

  var Page = Backbone.Model.extend({
    urlRoot: '/api/v1/pages'
  });

  var AboutView = Marionette.ItemView.extend({ 
    template: '#about-tpl',
    tagName: 'article'
  });

  var HeaderView = Marionette.ItemView.extend({
    template: '#header-tpl',
    tagName: 'nav'
  });

  // TODO: should use 'name' to search page
  var about = new Page({id : 1});
  var AboutController = Marionette.Controller.extend({
    showAbout: function() {
      // TODO: should use LayoutView to render header
      Dionysus.headerRegion.show(new HeaderView());

      about.fetch().then(function() {
        Dionysus.mainRegion.show(new AboutView({model : about}));
      });
    }
  });


  Dionysus.addInitializer(function() {
    new Marionette.AppRouter({
      appRoutes: {
        'app/about(/)': 'showAbout'
      },
      controller: new AboutController()
    });
  });
});

