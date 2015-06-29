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

		initialize: function(options){
			this.currentSong = 0;
			this.playList = [];
		},

		onBeforeShow: function() {
			var thisView = this;
			_.each(this.regions, function(regionId, regionName) {
				thisView.getRegion(regionName).show(new Dionysus.Common.Views.Loading());
			});
		},

		childEvents:{
			"fm:change": function(childView, id, fmData){
				//alert(id);
				//get the index of fm in current playlist
				var index = -1;
				for (var i = this.playList.length - 1; i >= 0; i--) {
					if(this.playList[i].id === id){
						index = i;
						break;
					}
				};

				this.currentSong = index;

				if(index >=0 ) this.playfm(this.playList[index]);
				else this.playfm(fmData);	
				
			},
			"fm:page:change": function(childView, fmList){
				this.playList = fmList;
				this.currentSong = -1;
			}
		},

		events: {
			
			'click .fast.forward.icon': function(){
				var index = this.currentSong + 1;
				if(index > this.playList,length) return;
				else if(this.playList[index]){
					this.currentSong++;
					this.playfm(this.playList[this.currentSong]);	
				} 

			},

			'click .fast.backward.icon': function(){
				var index = this.currentSong - 1;
				if(index < 0) return;
				else if(this.playList[index]){
					this.currentSong--;
					this.playfm(this.playList[this.currentSong]);
				}
			}
		},

		playfm: function(fmData){
			var title = fmData.title;
			var url;
			var dom = $(fmData.body);
			if (dom.is('a')) url=dom.attr('href');
			else url = dom.find('.fr-file').attr('href');
			var summary = fmData.summary.slice(0,20)+"...";

			$('.player-scripts').text(summary);

			if(!url) alert('没找到音频文件');

			$('.player-1').jPlayer("setMedia",{
				title: title,
				mp3: url
			}).jPlayer("play");

		},

		onDomRefresh: function() {

				$('.player-1').jPlayer({
					/*ready: function() {
						$(this).jPlayer("setMedia", {
							title: "Bubble",
							mp3: "/public/images/tune.mp3"
						});
					},*/
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
			'click .fmitem': 'clicked'
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
			this.triggerMethod('fm:change', id, this.collection.get(id).toJSON());
		},

		onDomRefresh: function(){
			//push play list of current page to parent layout view - player
			this.triggerMethod('fm:page:change', this.collection.toJSON());
		},

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