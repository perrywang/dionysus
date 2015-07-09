Dionysus.module('Admin.ChatRoom', function(ChatRoom, Dionysus, Backbone, Marionette){

	/**
	VIEW VIEW VIEW
	**/
	var RoomItemView = Marionette.ItemView.extend({
		template: JST['templates/admin/chatRoom/roomItem'],
		tagName: 'tr'
	});

	var RoomListView = Marionette.CompositeView.extend({
		
		template:JST["templates/admin/chatRoom/roomList"],
		childView: RoomItemView,
		childViewContainer: "tbody",

		initialize: function(options){
			if(this.collection){
				this.listenTo(this.collection, 'add', this.render, this);
			}
		},
		events:{

			"gotoPage #paging": "gotoPage",
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
	});

	/*
	CONTROLLER CONTROLLER CONTROLLER
	*/

	var Controller = Marionette.Object.extend({
		showRooms: function(){
			var criteria = {
				size: 10
			};
			var searchMethod = null;

			Dionysus.request('rooms:list:pageable',searchMethod,criteria).done(function(rooms){
				var list = new RoomListView({collection: rooms});
				Dionysus.mainRegion.show(list);
			});
		},

		showRoomDetail: function(id){

		},
	});


	Dionysus.on("before:start", function() {
		new Marionette.AppRouter({
			appRoutes: {
				'admin/chatrooms(/)': 'showRooms',
				'admin/chatrooms/:id': 'showRoomDetail'
			},
			controller: new Controller()
		});
	});
});