Dionysus.module('DionysusApp.Account', function(Account, Dionysus, Backbone, Marionette, $, _) {
  'use strict';

  var LoginView = Marionette.ItemView.extend({ 
    template: '#account-login-tpl',
    tagName: 'form',
    className: 'ui form'
  });

  var RegisterView = Marionette.ItemView.extend({ 
    template: '#account-register-tpl',
    tagName: 'form',
    className: 'ui form'
  });

  var AccountController = Marionette.Controller.extend({
    login: function() {
      var dialog = Dionysus.mainRegion.show(new LoginView());
    },
    register: function() {
      var dialog = Dionysus.mainRegion.show(new RegisterView());
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