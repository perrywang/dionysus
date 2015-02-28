Dionysus.Category = Backbone.Model.extend({
  urlRoot: "api/v1/categories"
});

Dionysus.CategoryCollection = Backbone.Collection.extend({
  url: "api/v1/categories",
  parse: function(response) {
    return response._embedded.categories;
  },
  model: Dionysus.Category
});

