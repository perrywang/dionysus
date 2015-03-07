$(function() {
  var stompClient = null;
  var room = "greetings";


  var connect = $('#connect');
  var disconnect = $('#disconnect');
  var input = $('#message');
  var messages = $('#messages');

  function setConnected(connected) {
    connect.toggleClass('disabled');
    disconnect.toggleClass('disabled');
  }

  connect.on('click', function() {
    var socket = new SockJS('/chat');
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function() {
      setConnected(true);
      stompClient.subscribe('/topic/chat/' + room + '/messages', function(response){
        var json = JSON.parse(response.body);
        messages.append('<li class="collection-item">' + json.content + '</li>');
      });
    });
  });

  disconnect.on('click', function() {
    stompClient.disconnect();
    setConnected(false);
    console.log("Disconnected");
  });

  input.on('change', function(e) {
    if (!stompClient) {
      window.alert('click "connect" first');
      e.preventDefault();
    }
    var name = document.getElementById('message').value;
    stompClient.send("/dionysus/chat/" + room, {}, JSON.stringify({ 'content': name }));
    $(this).val('');
  });
});