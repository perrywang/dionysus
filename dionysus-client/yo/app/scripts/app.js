Dionysus = new Marionette.Application();

Dionysus.addRegions({
  headerRegion: '#header',
  mainRegion: '#main'
});

Dionysus.on('start', function() {
  Backbone.history.start({ pushState: true });
  Backbone.Intercept.start();
});
