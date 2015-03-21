Dionysus.module('DionysusApp.Header', function(Header, Dionysus, Backbone, Marionette, $) {
  var HeaderView = Marionette.ItemView.extend({
    template: '#header-tpl',
    tagName: 'nav'
  });

  Dionysus.addInitializer(function() {
    var header = Dionysus.headerRegion.show(new HeaderView());
    header.$el.find('.dropdown-button').dropdown({
      constrain_width: false,
      alignment: 'right'
    });
  });
});

Dionysus.start();