Dionysus.module('DionysusApp.Header', function(Header, Dionysus, Backbone, Marionette) {
  'use strict';

  var HeaderView = Marionette.ItemView.extend({
    template: '#header-tpl',
    tagName: 'nav',
    className: 'ui menu'
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