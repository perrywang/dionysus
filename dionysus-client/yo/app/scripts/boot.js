Dionysus.module('DionysusApp.Header', function(Header, Dionysus, Backbone, Marionette, $) {
  var HeaderView = Marionette.ItemView.extend({
    template: '#header-tpl',
    tagName: 'nav'
  });

  var FooterView = Marionette.ItemView.extend({
    template: '#footer-tpl'
  });

  Dionysus.addInitializer(function() {
    Dionysus.headerRegion.show(new HeaderView());
    Dionysus.footerRegion.show(new FooterView());
  });
});

Dionysus.start();