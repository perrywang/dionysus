Dionysus.module('Article', function(Article, Dionysus, Backbone, Marionette){

	'use strict';
	/*
		Layout: Article Home
	*/
	var Layout = Marionette.LayoutView.extend({
		//TODO template:"?"
		regions: {
			slider: "#slider",
			category: "#category",
			docSummary: "#doc",
			videoSummary: "#video",
			blogSummary: "#blog",
			tag: "#tag",
			latest: "#latest"
		},

		onBeforeShow: function(){
			var thisView = this;
			_.each(this.regions, function(regionId, regionName){
				thisView.getRegion(regionName).show(new Dionysus.Common.Views.Loading());
			});
		},

	});

	/*
		Region Sub-Views
	*/
	var SliderView = Marionette.ItemView.extend();

	var CategoryView = Marionette.ItemView.extend();

	var DocSummaryView = Marionette.ItemView.extend();

	var VideoSummaryView = Marionette.ItemView.extend();

	var BlogSummaryView = Marionette.ItemView.extend();

	var TagView = Marionette.ItemView.extend();

	var LatestView = Marionette.ItemView.extend();


	/*
		Controller
	*/

	ArticleController = Marionette.Object.extend({
		showArticleHome: function(category){
			if (!category) category = 1;

			//step 1 show the funcking layout view in-advance
			var layout = new Layout();
			Dionysus.mainRegion.show(layout);

			//step 2 get slider data and show the sider view
			Dionysus.request('article:search:summary', "findByLocation", {
				category: category,
				location: "slider",
				size: 5
			}).done(function(data) {
				var sliders = data.embedded('officialArticles');
				var sliderView = new SliderView({
					collection: sliders
				});

				layout.getRegion("slider").show(sliderView);
			});

			//step 3 get categories and show them
			Dionysus.request('category:instances').done(function(data) {
				var categories = data.embedded('categories');
				var categoryView = new CategoryView({
					collection: categories
				});

				layout.getRegion('category').show(categoryView);
			});

			//step 4 get doc articles and show them
			Dionysus.request('article:search:summary', 'findByCategoryAndType', {
				category: category,
				type: 'DOC',
				size: 10
			}).done(function(data) {
				var docs = data.embedded('officialArticles');
				var docView = new DocSummaryView({
					collection: docs
				});

				layout.getRegion('docSummary').show(docView);
			});

			//step 5 get videos
			Dionysus.request('article:search:summary', 'findByCategoryAndType', {
				category: category,
				type: 'VIDEO',
				size: 10
			}).done(function(data) {
				var videos = data.embedded('officialArticles');
				var videoView = new VideoSummaryView({
					collection: videos
				});

				layout.getRegion('videoSummary').show(videoView);
			});

			//step 6 get blogs
			Dionysus.request('article:search:summary', 'findByCategoryAndType', {
				category: category,
				type: 'BLOG',
				size: 10
			}).done(function(data) {
				var blogs = data.embedded('officialArticles');
				var blogView = new BlogSummaryView({
					collection: blogs
				});

				layout.getRegion('blogSummary').show(blogView);
			});

			//step 7 get latest articles

			//step 8 get hot tags



		},

		showArticleList: function(category, type){
			
		}

	});

	/*
		Register router
	*/

	Dionysus.on("before:start", function() {
		new Marionette.AppRouter({
			appRoutes: {
				'articles(/cat:category)': 'showArticleHome',
				'articles/list/cat:category/type:type': 'showArticleList'
				/*'articles/list/cat:category': 'showArticlesByCategoryAndType',
				'articles(/p:page)': 'showArticles',*/
				'articles/:id(/)': 'showArticle',
			},
			controller: new ArticleController()
		});
	});


} );