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

		childEvents: {
			"category:change": "changeCategory"
		},

		changeCategory: function(childView, id){
			//user clicked a category, refresh the regions` data
			var docView = this.getRegion("docSummary").currentView.changeCategory(id);
			var videoView = this.getRegion("videoSummary").currentView.changeCategory(id);
			var blogView = this.getRegion("blogSummary").currentView.changeCategory(id);
		}

	});

	/*
		Region Sub-Views
	*/

	var RegionSummaryView = Marionette.ItemView.extend({
		//template:?
		initialize: function() {
			this.listenTo(this.collection, 'reset', this.render, this);
		},

		changeCategory: function(category) {

			var articleType = this.articleType ? this.articleType : this.options.articleType;
			var thisView = this;
			var criteria = {
				category: category,
				type: articleType,
				size: 10
			};

			Dionysus.request('article:search:summary', 'findByCategoryAndType', criteria).done(function(data) {
				var models = data.embedded("officialArticles").models;
				thisView.collection.reset(models);
			});
		}
	});

	var SliderView = Marionette.ItemView.extend();

	var CategoryView = Marionette.ItemView.extend({
		//TODO template: ?
		events: {
			'click a': "clicked"
		},

		clicked: function(e){
			e.preventDefault();
			var id = $(e.currentTarget).data("id");
			this.triggerMethod("category:change", id);
		}
	});

	var DocSummaryView = RegionSummaryView.extend({
		//template:?
		articleType : "DOC"
	});

	var VideoSummaryView = RegionSummaryView.extend({
		//template:?,
		articleType : "VIDEO"
	});

	var BlogSummaryView = RegionSummaryView.extend({
		//template:?,
		articleType: "BLOG"
	});

	var TagView = Marionette.ItemView.extend();

	var LatestView = Marionette.ItemView.extend();


	/*
		Controller
	*/

	ArticleController = Marionette.Object.extend({
		showArticleHome: function(category){
			if (!category) category = 1;

			//step 1 show the fucking layout view in-advance
			var layout = new Layout({
				model: {
					category: category
				}
			});
			Dionysus.mainRegion.show(layout);

			//step 2 get slider data and show the sider view
			Dionysus.request('article:search:summary', "findByLocation", {
				//category: category,
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