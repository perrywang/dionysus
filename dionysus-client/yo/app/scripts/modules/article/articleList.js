Dionysus.module('Article', function(Article, Dionysus, Backbone, Marionette){

	'use strict';
	var baseTemplatePath = 'templates/home/article/';
	/*
		Layout: Article Home
	*/
	var LayoutView = Marionette.LayoutView.extend({
		tagName: 'div',
		className: 'layout-view',
		template: JST[baseTemplatePath+'listPage/articleList'],
		regions: {
			list: "#list",
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
		Region View
	*/

	var ListView = Dionysus.Article.RegionSummaryView.extend({
		template:JST[baseTemplatePath+'listPage/articleListItems'],

		initialize: function() {
			if(this.collection) this.listenTo(this.collection, 'add', this.render, this);
			this.typeMapping = {
				'DOC': "心理文章",
				'VIDEO': "心理视频",
				'AUDIO': "心理FM",
				'BLOG': "心理博客"
			};
		},
		serializeData:function(){
			var items = [];
			var typeMapping = this.typeMapping;
			if(this.collection){
				_.each(this.collection.models, function(model){
					var json = model.toJSON();
					json.summary = json.summary.slice(0,50)+"...";
					json.type = typeMapping[json.type];
					items.push(json);
				});
			}
			return {items:items};
		},

		events:{
			"gotoPage #paging": "gotoPage"
		},
		gotoPage: function(event, page){
			this.collection.getPage(page-1);
		},
		onRender: function(){
			var state = this.collection.state;
			this.$('#paging').twbsPagination({
				totalPages: state['totalPages'],
				startPage: state['currentPage']+1,
				visiblePages: 6,
				first: '第一页',
        		prev: '前一页',
        		next: '后一页',
        		last: '最后一页',
        		loop:true,
        		onPageClick: function(event, page){
        			$(this).trigger("gotoPage", page);
        		}
			});
		}

	});


	/*
		Controller
	*/
	var ArticleListController = Marionette.Object.extend({
		showArticleList: function(category, type){

			category = category?category:1;
			type = type?type:"DOC";
			
			var layoutView = new LayoutView();
			Dionysus.mainRegion.show(layoutView);

			//get list
			Dionysus.request('article:list:pageable','findByCategoryAndType', {
				category: category,
				type: type,
				sort: 'id,desc'//TODO update sql to add datatime info, to sort
			}).done(function(articles){
				
				var list = new ListView({
					collection: articles
				});

				layoutView.getRegion('list').show(list);
			});

			//get latest
			Dionysus.request('article:list:pageable', null, {
				sort: 'lastModifiedDate,desc',
				size: 5
			}).done(function(articles){

				var latest = new Dionysus.Article.RegionSummaryView({
					template:JST[baseTemplatePath+'articleLatest'],
					collection: articles
				});
				layoutView.getRegion('latest').show(latest);
			});

			//TODO get tags

		}
	});

	/*
		Router
	*/
	Dionysus.on("before:start", function(){
		new Marionette.AppRouter({
			appRoutes: {
				'articles/list/(cat:category/type:type)': 'showArticleList',
			},
			controller: new ArticleListController()
		});
	});

});