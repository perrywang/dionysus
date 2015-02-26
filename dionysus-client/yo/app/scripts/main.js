var Dionysus = new Marionette.Application();

Dionysus.addRegions({
  headerRegion: 'header',
  mainRegion: 'main',
  footerRegion: 'footer'
});

Dionysus.HeaderView = Marionette.ItemView.extend({
  template: '#header-template'
});

Dionysus.MainView = Marionette.ItemView.extend({
  template: '#main-template'
});

Dionysus.FooterView = Marionette.ItemView.extend({
  template: '#footer-template'
});

Dionysus.addInitializer(function() {
  var header = new Dionysus.HeaderView(),
      main   = new Dionysus.MainView(),
      footer = new Dionysus.FooterView();
  Dionysus.headerRegion.show(header);
  Dionysus.mainRegion.show(main);
  Dionysus.footerRegion.show(footer);
});

Dionysus.start();

