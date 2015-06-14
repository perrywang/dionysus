Dionysus.module('Article', function(Article, Dionysus, Backbone, Marionette){

	'use strict';
	/*
		Layout: Article Home
	*/
	var Layout = Marionette.LayoutView.extend({
		//template:?
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
		//template:?,

		events:{
			"gotoPage #paging": "gotoPage"
		},
		gotoPage: function(event, page){
			this.collection.getPage(page);
		},
		onRender: function(){
			var state = this.collection.state;
			this.$('#page').twbsPagination({
				totalPages: state['totalPages'],
				startPage: state['firstPage'],
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

			var layoutView = new LayoutView();

			//get list
			Dionysus.request('article:list:pageable','findByCategoryAndType', {
				category: category,
				type: type,
				sort: 'lastModifiedDate,desc'
			}).done(function(articles){
				
				var list = new ListView({
					collection: articles
				});

				layoutView.getRegion('list').show(list);
			});

			//get latest
			Dionysus.request('articles:list:pageable', null, {
				sort: 'lastModifiedDate,desc',
				size: 5
			}).done(function(articles){

				var latest = new Dionysus.Article.RegionSummaryView({
					//TODO template:?
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
				'articles/list/cat:category/type:type': 'showArticleList'
			}
		});
	});

});