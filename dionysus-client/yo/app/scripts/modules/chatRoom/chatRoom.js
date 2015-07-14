Dionysus.module('ChatRoom', function(ChatRoom, Dionysus, Backbone, Marionette) {

	var MAX_LENGTH = 300;

	/*
		View
	*/
	var Layout = Marionette.LayoutView.extend({
		//template:?,

	});

	var RoomsView = Marionette.LayoutView.extend({
		template: JST['templates/home/chat/rooms'],
		className: 'ui stackable centered grid',

		initialize: function(options) {
			this.listenTo(this.collection, 'add', this.render, this);
		},

		events: {
			"gotoPage": function(e, page) {
				this.collection.getPage(page - 1);
			}
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

		onDomRefresh: function() {
			$('.segment.chatroom').dimmer({
				on: 'hover'
			});
		},

		serializeData: function() {
			//split the list to three column list
			var array = this.collection.toJSON();
			var column1 = [];
			var column2 = [];
			var column3 = [];
			//cloumn1:
			for (var i = 0; i < array.length; i += 3) {
				column1.push(array[i]);
			}
			//column2:
			for (var i = 1; i < array.length; i += 3) {
				column2.push(array[i]);
			}
			//column3
			for (var i = 2; i < array.length; i += 3) {
				column3.push(array[i]);
			}

			return {
				items: array,
				column1: column1,
				column2: column2,
				column3: column3
			}
		}

	});

	var AttendeeListView = Marionette.ItemView.extend({
		template: JST['templates/home/chat/attendeeList'],
		className: 'ui list',

		initialize: function(options) {
			this.listenTo(this.collection, 'reset', this.render, this);
		}
	});

	var Room = Marionette.LayoutView.extend({
		template: JST['templates/home/chat/room'],
		className: 'ui stackable centered grid',

		regions: {
			attendeeList: '#attendee'
		},

		events: {
			'click .submit': 'sendMessage',
			'keypress #message': 'enterMessage',
		},

		ui: {
			'feed': '#feed',
			//'participants': '#participants',
			'message': '#message',
			//'notify':'#notify'
		},

		onBeforeShow: function() {
			var attendeeList = new AttendeeListView({
				collection: new Backbone.Collection()
			})
			this.getRegion('attendeeList').show(attendeeList);
		},

		appendMessage: function(message) {
			var template = JST['templates/home/chat/message'];
			var html = template(message);
			this.ui.feed.append(html);
		},

		enterMessage: function(e) {
			if (e.keyCode == "13") this.sendMessage();
		},

		sendMessage: function() {
			var data = this.ui.message.val();
			if (!data || data === '') return;
			if (data.length > MAX_LENGTH) return;
			this.triggerMethod('send:message', data);
			this.ui.message.val('');
		},

		connected: function() {

		},

		disconnected: function() {

		},

		onRender: function() {
			var validationRules = {
				name: {
					identifier: 'msg',
					rules: [{
						type: 'maxLength[' + MAX_LENGTH + ']',
						prompt: '长度不能超过' + MAX_LENGTH + '字符'
					}]
				},
			};

			this.$('.ui.form').form(validationRules, {
				inline: true,
				on: 'blur'
			});
		}

	});


	/*
		Controller
	*/
	var Controller = Marionette.Object.extend({
		showRooms: function() {

			Dionysus.mainRegion.show(new Dionysus.Common.Views.Loading());

			var criteria = {
				size: 50,
				sort: 'attendeeCount,desc'
			};

			Dionysus.request('rooms:list:pageable', 'findByOpenTrue', criteria).done(function(rooms) {
				var list = new RoomsView({
					collection: rooms
				});
				Dionysus.mainRegion.show(list);
			});

		},

		enterRoom: function(id) {

			Dionysus.request('rooms:findOne', id).done(function(roomModel) {
				var room = new Room({
					id: id,
					model: roomModel
				});
				Dionysus.mainRegion.show(room);
				var attendeeCollection = room.getRegion('attendeeList').currentView.collection;

				//chat logic goes here
				//establish the connection
				var socket = new SockJS('/chat');
				var stompClient = Stomp.over(socket);
				var me = null;

				stompClient.connect({}, function(frame) {

					me = frame.headers['user-name'];

					room.connected(true);
					//initial tell server that I am alive
					stompClient.send('/dionysus/activeUsers/' + id, {}, '');

					stompClient.subscribe('/topic/chat/' + id + '/messages', function(response) {
						//disconnect if page is not in the chat room
						if (location.pathname.indexOf('rooms/' + id) == -1) {
							stompClient.disconnect();
							console.log("Disconnect server for not in the room now!");
							return;
						};
						var json = JSON.parse(response.body);
						room.appendMessage(json);
					});
					stompClient.subscribe('/topic/chat/' + id + '/active', function(response) {
						//disconnect if page is not in the chat room
						if (location.pathname.indexOf('rooms/' + id) == -1) {
							stompClient.disconnect();
							console.log("Disconnect server for not in the room now!");
							return;
						};
						var json = JSON.parse(response.body);

						//wrap each active user object to backbone model
						var modelList = [];
						_.each(json, function(user) {
							var model = new Backbone.Model();
							model.set(user);
							modelList.push(model);
						});
						//reset attendee collection of attendee list view to trigger re-render
						attendeeCollection.reset(modelList);


						stompClient.send('/dionysus/activeUsers/' + id, {}, '');
					})
				});

				room.on('send:message', function(message) {
					stompClient.send('/dionysus/chat/' + id, {}, JSON.stringify({
						'content': message
					}))
				});
			});



		}
	});


	/*
		Route
	*/

	Dionysus.on("before:start", function() {
		new Marionette.AppRouter({
			appRoutes: {
				'rooms(/)': 'showRooms',
				'rooms/:id': 'enterRoom'
			},
			controller: new Controller()
		});
	});



});