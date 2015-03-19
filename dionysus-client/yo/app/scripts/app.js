

Dionysus.addRegions({
  headerRegion: '#header',
  mainRegion: '#main'
});

Dionysus.HeaderView = Marionette.ItemView.extend({
  template: '#header-template'
});

Dionysus.on('start', function() {
  Backbone.history.start();
});

Dionysus.start();