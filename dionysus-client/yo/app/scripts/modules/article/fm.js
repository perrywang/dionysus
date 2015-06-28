Dionysus.module('Article', function(Article, Dionysus, Backbone, Marionette) {

	/*
		View
	*/

	var Layout = Marionette.LayoutView.extend({
		template: JST['templates/home/article/fm'],
		tagName: 'div',
		className: 'ui centered grid',
		regions: {
			list: "#list"
		},

		onBeforeShow: function() {
			var thisView = this;
			_.each(this.regions, function(regionId, regionName) {
				thisView.getRegion(regionName).show(new Dionysus.Common.Views.Loading());
			});
		},

		childEvents:{
			"fm:change": function(childView, id){
				alert(id);
			}
		},

		onDomRefresh: function() {
				$('.player-1').jPlayer({
					ready: function() {
						$(this).jPlayer("setMedia", {
							title: "Bubble",
							mp3: "/public/images/tune.mp3"
						});
					},
					solution: 'html',
					supplied: 'MP3, M4A',
					preload: 'auto',
					muted: false,
					volume: 0.8,
					cssSelectorAncestor: '.player-container',
					cssSelector: {
						title: '#title',
						play: '.play.icon',
						pause: '.pause.icon',
						stop: '.stop.icon',
						seekBar: '.player-seekbar',
						playBar: '.player-playbar',
						smoothPlayBar:true,
						currentTime: '.player-current',
						duration: '.player-duration'

					}
				});
		}

	});

	var ListView = Marionette.ItemView.extend({
		template: JST['templates/home/article/fmlist'],
		tagName: 'div',
		className: 'ui centered stackable grid',

		initialize: function(options){
			if(this.collection) this.listenTo(this.collection, 'add', this.render, this);
		},

		events:{
			"gotoPage #paging": "gotoPage",
			'click a': 'clicked'
		},
		gotoPage: function(event, page){
			this.collection.getPage(page-1);
		},
		onRender: function() {
			var state = this.collection.state;
			var currentPage = state['currentPage'] + 1;
			var total = state['totalPages'] == 0 ? 1 : state['totalPages'];
			this.$('#paging').twbsPagination({
				totalPages: total,
				startPage: currentPage,
				visiblePages: 6,
				first: '第一页',
				prev: '前一页',
				next: '后一页',
				last: '最后一页',
				loop: true,
				onPageClick: function(event, page) {
					$(this).trigger("gotoPage", page);
				}
			});
		},

		clicked: function(e){
			e.preventDefault();
			var id = $(e.currentTarget).data("id");
			this.triggerMethod('fm:change', id);
		}

	});


	/*
		Controller
	*/

	var Controller = Marionette.Object.extend({

		showFM: function() {
			var layoutView = new Layout();
			Dionysus.mainRegion.show(layoutView);

			Dionysus.request('article:list:pageable', "findByType", {
				type: 'AUDIO',
				size: 6,
				projection: 'excerpt',
				sort: 'id,desc'
			}).done(function(fms) {
				var list = new ListView({
					collection: fms
				});

				layoutView.getRegion('list').show(list);

			});
		}
	});

	/*
		Router
	*/

	Dionysus.addInitializer(function() {
    new Marionette.AppRouter({
      appRoutes : {
        'fms(/)': 'showFM'
      },
      controller: new Controller()
    });
  });


});