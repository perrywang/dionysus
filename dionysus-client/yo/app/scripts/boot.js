Dionysus.module('DionysusApp.Header', function(Header, Dionysus, Backbone, Marionette, $) {
  var HeaderView = Marionette.ItemView.extend({
    template: '#header-tpl',
    tagName: 'nav'
  });

  var FooterView = Marionette.ItemView.extend({
    template: '#footer-tpl'
  });

  Dionysus.addInitializer(function() {
    var header = Dionysus.headerRegion.show(new HeaderView());
    var footer = Dionysus.footerRegion.show(new FooterView());
    header.$el.find('.dropdown-button').dropdown({
      constrain_width: false,
      alignment: 'right'
    });
  });
});

Dionysus.start();