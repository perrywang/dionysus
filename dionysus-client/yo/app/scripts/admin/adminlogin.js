
$('form').form({
    username: {
        identifier: 'username',
        rules: [{
            type: 'empty',
            prompt: '输入用户名'
        }]
    },
    password: {
        identifier: 'password',
        rules: [{
            type: 'empty',
            prompt: '输入密码'
        }]
    }
});


$('#loginbutton').on('click', function() {
    var user = {
        username: $('#name').val(),
        password: $('#pass').val()
    };

    if (!user.username || !user.password) return;

    $.ajax({
        url: '/api/v1/login',
        method: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(user)
    }).done(function(response) {
        window.location.href = "/admin";
    }).fail(function(response) {
        alert(response.responseJSON.message);
    });
})