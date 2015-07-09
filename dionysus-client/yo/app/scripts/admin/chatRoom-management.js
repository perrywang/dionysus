Dionysus.module('Admin.ChatRoom', function(ChatRoom, Dionysus, Backbone, Marionette) {

	/**
	VIEW VIEW VIEW
	**/
	var RoomItemView = Marionette.ItemView.extend({
		template: JST['templates/admin/chatRoom/roomItem'],
		tagName: 'tr',
		events: {
			'click .close': function() {
				if (this.model.get('open')) this.model.set('open', false);
				else this.model.set('open', true);
				this.model.save();
			}
		},
		modelEvents: {
			'change': 'render'
		}
	});

	var RoomListView = Marionette.CompositeView.extend({

		template: JST["templates/admin/chatRoom/roomList"],
		childView: RoomItemView,
		childViewContainer: "tbody",

		initialize: function(options) {
			if (this.collection) {
				this.listenTo(this.collection, 'add', this.render, this);
			}
		},
		events: {

			"gotoPage #paging": "gotoPage",
		},
		gotoPage: function(event, page) {
			this.collection.getPage(page - 1);
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

	var RoomEditor = Marionette.ItemView.extend({
		
		template: JST['templates/admin/chatRoom/roomDetail'],
		
		initialize: function(options){
 			this.uploadedFileName="";
		},

		/*modelEvents:{
			'change':'render'
		},*/

		events: {
			'click #pic': function() {
				// This function uses pure HTML5 fileupload capability
				var model = this.model;
				var thisView = this;

				var progressing = function(evt) {
					if (evt.lengthComputable) {
						var percentComplete = Math.round(evt.loaded * 100 / evt.total);
						$('#progress').progress({
							percent: percentComplete
						});
					}
				};


				var files = $('#fileupload')[0].files;
				if (files.length == 0) {
					alert('你还没有选择文件');
					return;
				};
				var file = files[0];
				
				if (file.name === thisView.uploadedFileName) {
					alert('请不要重复提交');
					return;
				}
				var url = "/api/v1/upload";
				var xhr = new XMLHttpRequest();
				var fd = new FormData();
				xhr.upload.addEventListener('progress', progressing, false);
				xhr.open('POST', url, true);
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4 && xhr.status == 200) {
						var json = JSON.parse(xhr.responseText);
						model.set('cover', json.link);
						thisView.uploadedFileName = file.name;
						$('#cover').attr('src',json.link);
					};
				};
				fd.append('file', file);
				xhr.send(fd);

			},

			'click #detail': function(){
				var data = Backbone.Syphon.serialize(this);
				this.model.set(data);
				this.model.save().done(function(resp){
					toastr.info('保存成功');
				});

			}

		},

		onRender: function(){
			this.$el.form('set values', this.model.toJSON());
		}

	})

	/*
	CONTROLLER CONTROLLER CONTROLLER
	*/

	var Controller = Marionette.Object.extend({
		showRooms: function() {
			var criteria = {
				size: 10
			};
			var searchMethod = null;

			Dionysus.request('rooms:list:pageable', searchMethod, criteria).done(function(rooms) {
				var list = new RoomListView({
					collection: rooms
				});
				Dionysus.mainRegion.show(list);
			});
		},

		showRoomDetail: function(id) {
			Dionysus.request('rooms:findOne', id).done(function(room) {
				var roomView = new RoomEditor({
					model: room
				});
				Dionysus.mainRegion.show(roomView);
			});
		},

		showMessages: function(id) {

		}
	});


	Dionysus.on("before:start", function() {
		new Marionette.AppRouter({
			appRoutes: {
				'admin/chatrooms(/)': 'showRooms',
				'admin/chatrooms/:id': 'showRoomDetail',
				'admin/chatrooms/msg/:id': 'showMessages'
			},
			controller: new Controller()
		});
	});
});