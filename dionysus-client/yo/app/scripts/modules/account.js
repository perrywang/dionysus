Dionysus.module('Account', function(Account, Dionysus, Backbone, Marionette) {
  'use strict';

  var ACCOUNT_RULES = {
    username: {
      identifier: 'username',
      rules: [{
        type: 'empty',
        prompt: 'Please enter a username'
      }]
    },
    password: {
      identifier: 'password',
      rules: [{
        type: 'empty',
        prompt: 'Please enter a password'
      }]
    }, 
    password1: {
      identifier: 'password1',
      rules: [{
        type: 'empty',
        prompt: 'Please retype your password'
      }, {
        type: 'match[password]',
        prompt: 'Password should match'
      }]
    },
    email: {
      identifier: 'email',
      rules: [{
        type: 'email',
        prompt: 'Please enter an valid email'
      }]
    },
    terms: {
      identifier : 'terms',
      rules: [{
        type   : 'checked',
        prompt : 'You must agree to the terms and conditions'
      }]
    }
  };
  
  var LogoutView = Marionette.ItemView.extend({ 
    template: '#logout-tpl',
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

  var RegisterView = Marionette.ItemView.extend({ 
    template: '#account-register-tpl',
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
      Dionysus.trigger("login");
    }
  });

  var AccountController = Marionette.Controller.extend({
    register: function() {
      var view = new RegisterView();
      view.on('user:register', function(user) {
        var consultant = user.consultant;
        var url = consultant ? '/api/v1/consultant' : '/api/v1/register';
        $.ajax({
          url: url,
          method: 'POST',
          contentType: 'application/json; charset=utf-8',
          data: JSON.stringify(user)
        }).done(function() {
          window.alert('注册成功！');
          Dionysus.mainNavRegion.show(new Dionysus.Home.HeaderloginView());
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
          success: function(response) {
            sessionStorage.setItem("authorized", "disabled");
            sessionStorage.removeItem("user");
            Dionysus.navigate('/site',{trigger:true});
            Dionysus.mainNavRegion.show(new Dionysus.Home.HeaderView());
          }
        });
      })
      Dionysus.mainRegion.show(view);
    }
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