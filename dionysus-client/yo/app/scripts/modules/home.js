Dionysus.module('Home.Show', function(Home, Dionysus, Backbone, Marionette, $, _) {
  var Page = Backbone.Model.extend({
    urlRoot: "/api/v1/pages"
  });

  var PageCollection = Backbone.Collection.extend({
    url: "/api/v1/pages",
    parse: function(response) {
      var embedded = response._embedded;
      return embedded ? embedded.pages : [];
    },
    model: Page
  });

  var SliderView = Marionette.ItemView.extend({
    template: '#slide-template',
    tagName: 'li'
  });

  var SlidersView = Marionette.CompositeView.extend({
    template: '#slides-template',
    childView: SliderView,
    childViewContainer: 'ul.slides',
    className: 'slider'
  });

  Dionysus.addInitializer(function(options) {
    var pages = new PageCollection();
    var sliders = new SlidersView({ collection: pages });

    pages.fetch().then(function() {
      $('.slider').slider({full_width: true});
    });

    Dionysus.mainRegion.show(sliders);
  });
});