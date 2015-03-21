Dionysus = new Marionette.Application();

Dionysus.addRegions({
  headerRegion: '#header',
  mainRegion: '#main',
  dialogRegion: '#dialog'
});

Dionysus.on('start', function() {
  Backbone.history.start({ pushState: true });
  Backbone.Intercept.start();
});
