var Dionysus = new Marionette.Application();

Dionysus.addRegions({
	headerRegion : 'header',
	mainRegion : 'main',
	footerRegion : 'footer'
});

ArticleModel = Backbone.Model.extend({});
ArticleCollection = Backbone.Collection.extend({
	model : ArticleModel,
	url: '/articles'
});

ArticleView = Marionette.ItemView.extend({
  template: _.template("<span><%= title %></span>"),
  tagName: 'li'
});

ArticleCollectionView = Marionette.CollectionView.extend({
  tagName: "ul",
  childView: ArticleView,
  collectionEvents: {
    "sync": "render"
  }
});

Dionysus.addInitializer(function(options){
	var articlesView = new ArticleCollectionView({
    collection: options.articles
  });
  Dionysus.mainRegion.show(articlesView);
});

var articles = new ArticleCollection();
                                   
$(document).ready(function() {
	Dionysus.start({ articles : articles });
	articles.fetch().fail(function() {
		console.log('fetch articles failed');
	}).done(function() {
		console.log('fetch success');
	});
});
