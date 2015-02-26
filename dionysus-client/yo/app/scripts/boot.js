Dionysus.addInitializer(function() {
  var header = new Dionysus.HeaderView(),
      main   = new Dionysus.MainView(),
      footer = new Dionysus.FooterView();
  Dionysus.headerRegion.show(header);
  Dionysus.mainRegion.show(main);
  Dionysus.footerRegion.show(footer);
});

Dionysus.start();