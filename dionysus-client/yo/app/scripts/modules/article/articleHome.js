Dionysus.module('Article', function(Article, Dionysus, Backbone, Marionette){

	'use strict';
	/*
		Layout: Article Home
	*/
	var Layout = Marionette.LayoutView.extend({
		template:JST['templates/home/article/articleHome'],
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
			if(this.collection) this.listenTo(this.collection, 'reset', this.render, this);
		},

		changeCategory: function(category) {

			var articleType = this.articleType ? this.articleType : this.options.articleType;
			var thisView = this;
			var criteria = {
				category: category,
				type: articleType,
				size: 10,
				sort: 'lastModifiedDate,desc'
			};

			Dionysus.request('article:search:summary', 'findByCategoryAndType', criteria).done(function(data) {
				var models = data.embedded("officialArticles").models;
				thisView.collection.reset(models);
			});
		}
	});
	//make this view public
	Article.RegionSummaryView = RegionSummaryView;

	var SliderView = Marionette.ItemView.extend({
		template:JST['templates/home/article/articleSlider']
	});

	var CategoryView = Marionette.ItemView.extend({
		template: JST['templates/home/article/articleCategory'],
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
		template: JST['templates/home/article/articleDocSummary'],
		articleType : "DOC"
	});

	var VideoSummaryView = RegionSummaryView.extend({
		template:JST['templates/home/article/articleVideoSummary'],
		articleType : "VIDEO"
	});

	var BlogSummaryView = RegionSummaryView.extend({
		template:JST['templates/home/article/articleBlogSummary'],
		articleType: "BLOG"
	});

	var TagView = RegionSummaryView.extend({
		template: JST['templates/home/article/articleTag']
	});

	var LatestView = RegionSummaryView.extend({
		template: JST['templates/home/article/articleLatest']
	});



	/*
		Controller
	*/

	var ArticleController = Marionette.Object.extend({
		showArticleHome: function(category){
			if (!category) category = 1;

			//step 1 show the fucking layout view in-advance
			var layout = new Layout({
				model: new Backbone.Model({
					category: category
				})
			});
			Dionysus.mainRegion.show(layout);

			//step 2 get slider data and show the sider view
			Dionysus.request('article:search:summary', "findByLocation", {
				//category: category,
				location: "slider",
				size: 5,
				sort: 'lastModifiedDate,desc'
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
				size: 10,
				sort: 'lastModifiedDate,desc'
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
				size: 10,
				sort: 'lastModifiedDate,desc'
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
				size: 10,
				sort: 'lastModifiedDate,desc'
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
				//'articles/list/cat:category/type:type': 'showArticleList'
				/*'articles/list/cat:category': 'showArticlesByCategoryAndType',
				'articles(/p:page)': 'showArticles',*/
				//'articles/:id(/)': 'showArticle',
			},
			controller: new ArticleController()
		});
	});


} );