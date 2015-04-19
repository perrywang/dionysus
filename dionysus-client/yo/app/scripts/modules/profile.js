Dionysus.module('Profile', function(Profile, Dionysus, Backbone, Marionette) {
  'use strict';

  var ProfileView = Marionette.ItemView.extend({ 
    template: '#profile-tpl',
    tagName: 'profile',
    className: 'ui page'
  });

  var ProfileController = Marionette.Controller.extend({
    showProfile: function (id) {
      var userFetching = Dionysus.request('user:entity', id);
      $.when(userFetching).done(function(user) {
        Dionysus.mainRegion.show(new ProfileView({ model: user}));
      }).fail(function(){
        alert("fail");
      });
    }
  });

  Dionysus.addInitializer(function() {
    new Marionette.AppRouter({
      appRoutes : {
        'profile/:id(/)': 'showProfile'
      },
      controller: new ProfileController()
    });
  });
});
