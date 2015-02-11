var Dionysus = Marionette.Application.extend({
  initialize: function(options) {
    console.log(options.container);
  }
});

var app = new Dionysus({container: '#app'});

app.on('before:start', function() {
	console.log('before start event triggered');
});

app.on("start", function(options){
  if (Backbone.history){
    Backbone.history.start();
  }
});

app.start();