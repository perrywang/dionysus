Dionysus.module('DionysusApp.AdminHeader', function(Header, Dionysus, Backbone, Marionette, $) {
  var HeaderView = Marionette.ItemView.extend({
    template: '#admin-header-tpl',
    tagName: 'nav',
    className: 'ui menu'
  });

  Dionysus.addInitializer(function() {
    Dionysus.headerRegion.show(new HeaderView());
  });
});

Dionysus.start();