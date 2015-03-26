Dionysus.module('DionysusApp.AdminHeader', function(Header, Dionysus, Backbone, Marionette, $) {
  var HeaderView = Marionette.ItemView.extend({
    template: '#header-tpl',
    tagName: 'nav'
  });

  Dionysus.addInitializer(function() {
    Dionysus.headerRegion.show(new HeaderView());
  });
});

Dionysus.start();