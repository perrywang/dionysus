Dionysus.module('ChatRoom', function(ChatRoom, Dionysus, Backbone, Marionette) {

	/*
		View
	*/
	var Layout = Marionette.LayoutView.extend({
		//template:?,

	});

	var Room = Marionette.LayoutView.extend({
		template:JST['templates/home/chat/room'],

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

		appendMessage: function(message) {
			var template = JST['templates/home/chat/message'];
			var html = template(message);
			this.ui.feed.append(html);
		},

		enterMessage: function(e){
			if(e.keyCode == "13") this.sendMessage();
		},

		sendMessage: function() {
			var data = this.ui.message.val();
			if(!data || data === '') return;
			this.triggerMethod('send:message', data);
			this.ui.message.val('');
		},

		connected: function() {

		},

		disconnected: function() {

		},

	});


	/*
		Controller
	*/
	var Controller = Marionette.Object.extend({
		showRooms: function() {

		},

		enterRoom: function(id) {
			var room = new Room({
				id: id
			});
			Dionysus.mainRegion.show(room);

			//chat logic goes here
			//establish the connection
			var socket = new SockJS('/chat');
			var stompClient = Stomp.over(socket);

			stompClient.connect({}, function() {
				room.connected(true);
				stompClient.subscribe('/topic/chat/' + id + '/messages', function(response) {
					var json = JSON.parse(response.body);
					room.appendMessage(json);
				});
			});

			room.on('send:message', function(message){
				stompClient.send('/dionysus/chat/' + id, {}, JSON.stringify({ 'content': message }))
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