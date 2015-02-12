
ArticleModel = Backbone.Model.extend({});
ArticleCollection = Backbone.Collection.extend({
	model : ArticleModel
});

ArticleView = Marionette.ItemView.extend({
  template: _.template("<span><%= name %></span>"),
  tagName: 'li'
});

ArticleCollectionView = Marionette.CollectionView.extend({
  tagName: "ul",
  childView: ArticleView
});

var Dionysus = new Marionette.Application();

Dionysus.addRegions({
	headerRegion : 'header',
	mainRegion : 'main',
	footerRegion : 'footer'
});

Dionysus.addInitializer(function(options){
	var articlesView = new ArticleCollectionView({
    collection: options.articles
  });
  Dionysus.mainRegion.show(articlesView);
});

var articles = new ArticleCollection([
  { name: 'Test 1' },
  { name: 'Test 2' },
  { name: 'Test 3' }
]);
                                   
$(document).ready(function() {
	Dionysus.start({ articles : articles });
});
