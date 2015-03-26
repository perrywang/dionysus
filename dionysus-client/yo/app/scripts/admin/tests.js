Dionysus.module('DionysusApp.AdminTest', function(Test, Dionysus, Backbone, Marionette, $) {

  var TestView = Marionette.ItemView.extend({
    template: '#admin-tests-tpl',
    className: 'container'
  });

  var TestController = Marionette.Controller.extend({
    showTests: function() {
      Dionysus.mainRegion.show(new TestView());
    }
  });

  Dionysus.addInitializer(function() {
    new Marionette.AppRouter({
      appRoutes : { 
        "admin/tests(/)": "showTests" 
      },
      controller: new TestController()
    });
  });
});