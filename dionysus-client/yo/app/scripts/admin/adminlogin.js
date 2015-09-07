
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



/*Dionysus = new Marionette.Application();

Dionysus.addRegions({
  mainRegion: '#main',
});

Dionysus.module('Admin.Login', function (Login, Dionysus, Backbone, Marionette) {
    'use strict';

    var LoginView = Marionette.ItemView.extend({
        template: JST['templates/admin/adminlogin'],
        events: {
            'click #loginbutton': function() {
                var user = {
                    username: this.$('#name').val(),
                    password: this.$('#pass').val()
                };

                if(!user.username || !user.password) return;
                
                $.ajax({
                    url: '/api/v1/login',
                    method: 'POST',
                    contentType: 'application/json; charset=utf-8',
                    data: JSON.stringify(user)
                }).done(function(response){
                    window.location.href="/admin";
                }).fail(function(response){
                    alert(response.responseJSON.message);
                });


            }
        },
        onDomRefresh: function() {
            this.$el.form({
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
        }
    });

    var AdminHomeController = Marionette.Controller.extend({
        adminlogin: function(){
            Dionysus.mainRegion.show(new LoginView());
        }
    });

    Dionysus.addInitializer(function () {
        
        new Marionette.AppRouter({
            appRoutes: {
                'adminlogin(/)':"adminlogin"
            },
            controller: new AdminHomeController()
        });
    });
});



*/