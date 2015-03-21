Dionysus.module('DionysusApp.Account', function(Account, Dionysus, Backbone, Marionette, $, _) {
  'use strict';

  var LoginView = Marionette.ItemView.extend({ 
    template: '#account-login-tpl',
    className: 'modal'
  });

  var RegisterView = Marionette.ItemView.extend({ 
    template: '#account-register-tpl',
    className: 'modal'
  });

  var AccountController = Marionette.Controller.extend({
    login: function() {
      var dialog = Dionysus.dialogRegion.show(new LoginView());
      dialog.$el.find('.modal').openModal();
    },
    register: function() {
      var dialog = Dionysus.dialogRegion.show(new RegisterView());
      dialog.$el.find('.modal').openModal();
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