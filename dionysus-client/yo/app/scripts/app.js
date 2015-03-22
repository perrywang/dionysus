Dionysus = new Marionette.Application();

Dionysus.addRegions({
  headerRegion: '#header',
  mainRegion: '#main',
  footerRegion: '#footer',
  dialogRegion: '#dialog'
});

Dionysus.on('start', function() {
  Backbone.history.start({ pushState: true });
  Backbone.Intercept.start();
});
