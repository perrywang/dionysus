Dionysus.module('Account', function(Account, Dionysus, Backbone, Marionette) {
  'use strict';

  var LoginView = Marionette.ItemView.extend({ 
    template: '#account-login-tpl',
    tagName: 'form',
    className: 'ui form compact segment',
    onRender: function() {
      this.$el.form({
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
        }
      });
    },
    ui: {
      submit: '.submit'
    },
    events: {
      'click @ui.submit': 'login'
    },
    login: function() {
      var user = this.$el.form('get values', ['username', 'password']);
      $.ajax({
        url: '/api/v1/login',
        method: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(user)
      }).done(function() {
        window.location.href = "/app/profile/3";
      }).fail(function() {
        window.alert('login failure');
      });
    }
  });

  var RegisterView = Marionette.ItemView.extend({ 
    template: '#account-register-tpl',
    tagName: 'form',
    className: 'ui form compact segment',
    onRender: function() {
      this.$('.ui.checkbox').checkbox();
      this.$el.form({
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
        },
	consultant: {
          identifier : 'consultant',
          rules: [{
            //type   : 'checked',
            //prompt : 'Select if you are a consultant'
          }]
        }
      });
    },
    ui: {
      submit: '.submit',
      consultant: '.consultant'
    },
    events: {
      'click @ui.submit': 'register',
      'click @ui.consultant': 'consultant'
    },
    
    register: function() {
      var user = this.$el.form('get values', ['username', 'password', 'email']);
      $.ajax({
        url: '/api/v1/register',
        method: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(user)
      }).done(function() {
        window.alert('register success');
		window.location.href = "/app/login";
      }).fail(function() {
        window.alert('register failure');
      });  
    },
    consultant: function() {
      var user = this.$el.form('get values', ['username', 'password', 'email']);
      $.ajax({
        url: '/api/v1/consultant',
        method: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(user)
      }).done(function() {
        window.alert('send the validation to admin');
		window.location.href = "/app/site";
      }).fail(function() {
        window.alert('fail to send the validation to admin');
      });  
    }
  });

  var AccountController = Marionette.Controller.extend({
    login: function() {
      Dionysus.mainRegion.show(new LoginView());
    },
    register: function() {
      Dionysus.mainRegion.show(new RegisterView());
    },
    logout: function() {
      
    }
  });

  Dionysus.addInitializer(function() {
    new Marionette.AppRouter({
      appRoutes: {
        'app/login(/)': 'login',
        'app/logout(/)': 'logout',
        'app/register(/)': 'register'
      },
      controller: new AccountController()
    });
  });
});