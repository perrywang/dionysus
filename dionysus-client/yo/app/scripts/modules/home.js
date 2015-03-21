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
    childViewContainer: 'div.container',
    className: 'row'
  });

  var HeaderView = Marionette.ItemView.extend({
    template: '#header-template'
  });


  Dionysus.addInitializer(function(options) {
    var modules = new ModuleCollection();
    var sliders = new SlidersView({ collection: modules });
    var header = new HeaderView();
    Dionysus.mainRegion.show(sliders);
    Dionysus.headerRegion.show(header);
    modules.fetch();
  });
});