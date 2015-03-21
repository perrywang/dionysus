Dionysus.module('DionysusApp.About', function(Articles, Dionysus, Backbone, Marionette, $, _) {
  var AboutController = Marionette.Controller.extend({
    showAbout: function() {
      alert('show about page');
    }
  });

  Dionysus.addInitializer(function() {
    new Marionette.AppRouter({
      appRoutes: {
        'app/about': 'showAbout'
      },
      controller: new AboutController()
    })
  });
});

