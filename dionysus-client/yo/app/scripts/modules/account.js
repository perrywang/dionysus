Dionysus.module('Account', function(Account, Dionysus, Backbone, Marionette) {
  'use strict';

  var ACCOUNT_RULES = {
    username: {
      identifier: 'username',
      rules: [{ type: 'empty', prompt: '请输入用户名' }]
    },
    password: {
      identifier: 'password',
      rules: [{ type: 'empty', prompt: '请输入密码' }]
    }, 
    password1: {
      identifier: 'password1',
      rules: [
        { type: 'empty', prompt: '请再次输入密码' }, 
        { type: 'match[password]', prompt: '两次输入的密码不匹配' }
      ]
    },
    email: {
      identifier: 'email',
      rules: [{ type: 'email', prompt: '请输入您的电子邮件地址' }]
    },
    terms: {
      identifier : 'terms',
      rules: [{ type : 'checked', prompt : '还没有同意用户协议' }]
    }
  };
  
  var LogoutView = Marionette.ItemView.extend({ 
    template: JST['templates/home/logout'],
    tagName: 'form',
    className: 'ui form',
    onRender: function() {
      this.$el.form({
        feedback: {
          identifier: 'feedback',
          rules: [{
            type: 'empty',
            prompt: 'Please share the feedback'
          }]
        }
      });
    },
    ui: {
      logout: '.logout'
    },
    events: {
      'click @ui.logout': 'logout'
    },
    logout: function() {
      this.trigger('user:logout');
    }
  });

  Account.RegisterModalView = Marionette.ItemView.extend({
    template: JST['templates/home/header/register'],
    className: 'ui modal',
    events : {
      //'click #register-me' : 'register',
      'register:me': 'register',
      'click #login-me' : 'login'
    },

    register: function() {
      var dialog = this;

      var user = this.$el.form('get values', ['username', 'password', 'email', 'consultant']);
      var validated = true;

      if (validated) {
        var consultant = user.consultant;
        var url = consultant ? '/api/v1/registerconsultant' : '/api/v1/register';
        $.ajax({
          url: url,
          method: 'POST',
          contentType: 'application/json; charset=utf-8',
          data: JSON.stringify(user)
        }).done(function(response) {
          window.alert('注册成功！');
          sessionStorage.setItem('authorized', 'enabled');
          sessionStorage.setItem('user', response.id);
          sessionStorage.setItem('username', response.username);
          sessionStorage.setItem('avatar', response.avatar);

          dialog.$el.modal('hide');

          Dionysus.navigate('/', {
            trigger: true
          });
        }).fail(function() {
          window.alert('注册失败，用户已存在...');
        });
      }

    },

    login: function(){
      this.$el.modal('hide');
      Dionysus.trigger('login');
    },

    onRender: function(){

      var dialog = this;

      this.$('.ui.checkbox').checkbox();

      this.$el.form(ACCOUNT_RULES, {
        onSuccess: function(e) {
          e.preventDefault();
          $(this).trigger('register:me');
        }
      });

      this.$el
        .modal('setting', 'transition', 'horizontal flip')
        .modal('show');
    }


  });

  var RegisterView = Marionette.ItemView.extend({ 
    template: JST['templates/home/account'],
    tagName: 'form',
    className: 'ui form compact segment',
    onRender: function() {
      this.$('.ui.checkbox').checkbox();
      this.$el.form(ACCOUNT_RULES);
    },
    ui: {
      submit: '.submit',
      consultant: '.consultant',
      login: '#login'
    },
    events: {
      'click @ui.submit': 'register',
      'click @ui.login' : 'triggerLogin'
    },
    register: function() {
      var user = this.$el.form('get values', ['username', 'password', 'email', 'consultant']);
      this.trigger('user:register', user); 
    },
    triggerLogin: function(){
      Dionysus.trigger('login');
    }
  });

  var AccountController = Marionette.Controller.extend({
    register: function() {
      var view = new RegisterView();
      view.on('user:register', function(user) {
        var consultant = user.consultant;
        var url = consultant ? '/api/v1/registerconsultant' : '/api/v1/register';
        $.ajax({
          url: url,
          method: 'POST',
          contentType: 'application/json; charset=utf-8',
          data: JSON.stringify(user)
        }).done(function(response) {
          window.alert('注册成功！');
          sessionStorage.setItem('authorized', 'enabled');
          sessionStorage.setItem('user', response.id);
          sessionStorage.setItem('username', response.username);
          sessionStorage.setItem('avatar', response.avatar);
          Dionysus.navigate('/site',{trigger:true});
        }).fail(function() {
          window.alert('注册失败，用户已存在...');
        }); 
      });
      Dionysus.mainRegion.show(view);
    },
    logout: function() {
      var view = new LogoutView();
      view.on('user:logout', function() {
        $.ajax({
          url: '/api/v1/logout',
          cache: false,
          success: function() {
            sessionStorage.setItem('authorized', 'disabled');
            sessionStorage.removeItem('user');
            sessionStorage.removeItem('role');
            Dionysus.navigate('/',{trigger:true});
            Dionysus.mainNavRegion.show(new Dionysus.Home.HeaderView());
          }
        });
      });
      Dionysus.mainRegion.show(view);
    }
  });

  Dionysus.addInitializer(function() {
    Dionysus.on('register',function(){
      Dionysus.registerRegion.show(new Dionysus.Account.RegisterModalView());
    });
  });

  Dionysus.addInitializer(function() {
    new Marionette.AppRouter({
      appRoutes: {
        'logout(/)': 'logout',
        'register(/)': 'register'
      },
      controller: new AccountController()
    });
  });
});