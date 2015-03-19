Dionysus.Page = Backbone.Model.extend({
  urlRoot: "api/v1/pages"
});

Dionysus.PageCollection = Backbone.Collection.extend({
  url: "api/v1/pages",
  parse: function(response) {
    return response._embedded.pages;
  },
  model: Dionysus.Page
});

