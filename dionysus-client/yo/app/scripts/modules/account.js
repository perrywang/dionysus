Dionysus.module('DionysusApp.Account', function(Account, Dionysus, Backbone, Marionette, $, _) {
  'use strict';

  var LoginView = Marionette.ItemView.extend({ 
    template: '#account-login-tpl',
    tagName: 'form',
    className: 'ui form compact segment'
  });

  var RegisterView = Marionette.ItemView.extend({ 
    template: '#account-register-tpl',
    tagName: 'form',
    className: 'ui form compact segment'
  });

  var AccountController = Marionette.Controller.extend({
    login: function() {
      var form = Dionysus.mainRegion.show(new LoginView());
      form.$el.find('.ui.form').form({
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
    register: function() {
      var form = Dionysus.mainRegion.show(new RegisterView());
      form.$el.find('.ui.checkbox').checkbox();
      form.$el.find('.ui.form').form({
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
        terms: {
          identifier : 'terms',
          rules: [{
            type   : 'checked',
            prompt : 'You must agree to the terms and conditions'
          }]
        }
      });
    },
    logout: function() {
      alert('logout')
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
    })
  });
});