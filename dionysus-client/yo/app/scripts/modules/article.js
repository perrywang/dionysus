Dionysus.Article = Backbone.Model.extend({
  urlRoot: "api/v1/articles"
});

Dionysus.ArticleCollection = Backbone.Collection.extend({
  url: "api/v1/articles",
  parse: function(response) {
    return response._embedded.articles;
  },
  model: Dionysus.Article
});

Dionysus.ArticleView = Marionette.ItemView.extend({ 
  template: "#article-template"
});
