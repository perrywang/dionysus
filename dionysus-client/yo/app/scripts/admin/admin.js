Dionysus.module('Admin.Home', function (Home, Dionysus, Backbone, Marionette) {
    'use strict';

    var HomeView = Marionette.ItemView.extend({
        template: JST["templates/admin/home"],
        className: 'container'
    });

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
        showHome: function () {
            Dionysus.mainNavRegion.show(new Dionysus.Common.HeaderView({collection: links}));
            Dionysus.mainRegion.show(new HomeView());
        },
        adminlogin: function(){
            Dionysus.mainRegion.show(new LoginView());
        }
    });

    var links = new Dionysus.Entities.LinkCollection([
        {name: '管理首页', href: '/admin', icon: 'home'},
        {name: '文章列表', href: '/admin/articles', icon: 'edit'},
        {name: '文章类别', href: '/admin/categories', icon: 'inbox'},
        {name: '个人博客', href: '/admin/blogs', icon: 'edit'},
        {name: '心理测试', href: '/admin/tests', icon: 'lab'},
        {name: '课程列表', href: '/admin/courses', icon: 'edit'},
        {name: '课程汇总', href: '/admin/coursesummary', icon: 'edit'},
        {name: '咨询师审核', href: '/admin/consultants', icon: 'edit'},
        {name: '机构用户审核', href: '/admin/organizations', icon: 'edit'},
        {name: '心理预约', href: '/admin/appointments', icon: 'edit'},
        {name: '咨询师特长', href: '/admin/consultantexpertise', icon: 'edit'},
        {name: '聊天室', href: '/admin/chatrooms', icon: 'edit'},
        {name: '心理测试', href: '/admin/psychotests', icon: 'edit'}
    ]);

    Dionysus.addInitializer(function () {
        
        new Marionette.AppRouter({
            appRoutes: {
                'admin(/)': 'showHome',
                'adminlogin(/)':"adminlogin"
            },
            controller: new AdminHomeController()
        });
    });
});