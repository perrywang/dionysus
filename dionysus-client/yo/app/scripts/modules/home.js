Dionysus.module('Home.Show', function(Home, Dionysus, Backbone, Marionette, $, _) {
  var Module = Backbone.Model.extend({
    urlRoot: "/api/v1/modules"
  });

  var ModuleCollection = Backbone.Collection.extend({
    url: "/api/v1/modules",
    parse: function(response) {
      var embedded = response._embedded;
      return embedded ? embedded.modules : [];
    },
    model: Module
  });

  var SliderView = Marionette.ItemView.extend({
    template: '#module-tpl',
    className: 'col s12 m6 l4'
  });

  var SlidersView = Marionette.CompositeView.extend({
    template: '#modules-tpl',
    childView: SliderView,
    childViewContainer: 'div',
    className: 'row'
  });

  Dionysus.addInitializer(function(options) {
    var pages = new ModuleCollection();
    var sliders = new SlidersView({ collection: pages });

    pages.fetch().then(function() {
      $('.slider').slider({full_width: true});
    });

    Dionysus.mainRegion.show(sliders);
  });
});