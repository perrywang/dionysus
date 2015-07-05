Dionysus.module('Article', function(Article, Dionysus, Backbone, Marionette){

	'use strict';
	var baseTemplatePath = 'templates/home/article/';
	/*
		Layout: Article Home
	*/
	var Layout = Marionette.LayoutView.extend({
		template:JST[baseTemplatePath+'homePage/articleHome'],
		tagName:"div",
		className:"ui centered stackable grid",
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
			"category:change": function(childView, id) {
				//user clicked a category, refresh the regions` data
				var docView = this.getRegion("docSummary").currentView.changeCategory(id);
				var videoView = this.getRegion("videoSummary").currentView.changeCategory(id);
				var blogView = this.getRegion("blogSummary").currentView.changeCategory(id);
			}
		},
	});

	/*
		Region Sub-Views
	*/

	var RegionSummaryView = Marionette.ItemView.extend({
		tagName: "div",
		className: "region-summary",
		initialize: function() {
			if(this.collection) this.listenTo(this.collection, 'reset', this.render, this);
		},

		changeCategory: function(category) {

			var articleType = this.articleType ? this.articleType : this.options.articleType;
			var thisView = this;
			var criteria = {
				category: category,
				type: articleType,
				location: "normal",
				size: 10,
				sort: 'lastModifiedDate,desc'
			};

			Dionysus.request('article:search:summary', 'findByCategoryAndTypeAndLocation', criteria).done(function(data) {
				if (data.embedded("officialArticles")) {
					var models = data.embedded("officialArticles").models;
					models = models ? models : [];
					thisView.collection.reset(models);
				}
				else{
					thisView.collection.reset([]);
				}
			});
		}
	});
	//make this view public
	Article.RegionSummaryView = RegionSummaryView;

	var SliderView = Marionette.ItemView.extend({
		template:JST[baseTemplatePath+'homePage/articleSlider'],
		tagName: "div",
		className: "flexslider",
		onDomRefresh: function(){
			$('.flexslider').flexslider();
		}

	});

	var CategoryView = Marionette.ItemView.extend({
		template: JST[baseTemplatePath+'homePage/articleCategory'],
		events: {
			'click a': "clicked"
		},

		clicked: function(e){
			e.preventDefault();
			var id = $(e.currentTarget).data("id");
			this.triggerMethod("category:change", id);
		}
	});

	Article.CategoryView = CategoryView;

	var DocSummaryView = RegionSummaryView.extend({
		template: JST[baseTemplatePath+'homePage/articleDocSummary'],
		articleType : "DOC"
	});

	var VideoSummaryView = RegionSummaryView.extend({
		template:JST[baseTemplatePath+'homePage/articleVideoSummary'],
		articleType : "VIDEO"
	});

	var BlogSummaryView = RegionSummaryView.extend({
		template:JST[baseTemplatePath+'homePage/articleBlogSummary'],
		articleType: "BLOG"
	});

	var TagView = RegionSummaryView.extend({
		template: JST[baseTemplatePath+'articleTag']
	});

	Article.TagView = TagView;

	var LatestView = RegionSummaryView.extend({
		template: JST[baseTemplatePath+'articleLatest']
	});

	Article.LatestView = LatestView;


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
					collection: sliders?sliders:new Backbone.Collection()
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
			Dionysus.request('article:search:summary', 'findByCategoryAndTypeAndLocation', {
				category: category,
				type: 'DOC',
				location: 'normal',
				size: 10,
				sort: 'lastModifiedDate,desc'
			}).done(function(data) {
				var docs = data.embedded('officialArticles');
				var docView = new DocSummaryView({
					collection: docs?docs:new Backbone.Collection()
				});

				layout.getRegion('docSummary').show(docView);
			});

			//step 5 get videos
			Dionysus.request('article:search:summary', 'findByCategoryAndTypeAndLocation', {
				category: category,
				type: 'VIDEO',
				location: 'normal',
				size: 10,
				sort: 'lastModifiedDate,desc'
			}).done(function(data) {
				var videos = data.embedded('officialArticles');
				var videoView = new VideoSummaryView({
					collection: videos?videos:new Backbone.Collection()
				});

				layout.getRegion('videoSummary').show(videoView);
			});

			//step 6 get blogs
			Dionysus.request('article:search:summary', 'findByCategoryAndTypeAndLocation', {
				category: category,
				type: 'BLOG',
				location: 'normal',
				size: 10,
				sort: 'lastModifiedDate,desc'
			}).done(function(data) {
				var blogs = data.embedded('officialArticles');
				var blogView = new BlogSummaryView({
					collection: blogs?blogs:new Backbone.Collection()
				});

				layout.getRegion('blogSummary').show(blogView);
			});

			//step 7 get latest articles
			Dionysus.request('article:list:pageable', null, {
				sort: 'lastModifiedDate,desc',
				size: 5
			}).done(function(articles){

				var latest = new Dionysus.Article.RegionSummaryView({
					template:JST[baseTemplatePath+'articleLatest'],
					collection: articles
				});
				layout.getRegion('latest').show(latest);
			});


			//step 8 get hot tags
			var tags = new Dionysus.Article.RegionSummaryView({
					template:JST[baseTemplatePath+'articleTag'],
				});
			layout.getRegion('tag').show(tags);



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
			},
			controller: new ArticleController()
		});
	});


} );