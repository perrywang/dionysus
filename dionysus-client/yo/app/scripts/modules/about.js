Dionysus.module('DionysusApp.About', function(About, Dionysus, Backbone, Marionette) {
  'use strict';

  var Page = Backbone.Model.extend({
    urlRoot: '/api/v1/pages'
  });

  var AboutView = Marionette.ItemView.extend({ 
    template: '#about-tpl',
    tagName: 'article'
  });

  // TODO: should use 'name' to search page
  var about = new Page({id : 1});
  var AboutController = Marionette.Controller.extend({
    showAbout: function() {
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

