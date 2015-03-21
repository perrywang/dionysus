Dionysus.module('DionysusApp.Account', function(Articles, Dionysus, Backbone, Marionette, $, _) {
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
      Dionysus.dialogRegion.show(new LoginView());
      $('#dialog .modal').openModal();
    },
    register: function() {
      Dionysus.dialogRegion.show(new RegisterView());
      $('#dialog .modal').openModal();
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