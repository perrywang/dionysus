Dionysus.module('Profile', function(Profile, Dionysus, Backbone, Marionette) {
  'use strict';

  var PofileLayoutView = Marionette.LayoutView.extend({
    template: '#profile-layout-tpl'
  });

  var ProfileView = Marionette.ItemView.extend({ 
    template: '#profile-info-tpl',
    className: 'ui page',
    ui: {
      submit: '.submit'
    },
    events: {
      'click @ui.submit': 'update'
    },
    update: function(e) {
      this.trigger('profile:update', this.model);	  
      var user = this.$el.form('get values'/*, ['username', 'password', 'email', 'gender', 'age', 'address', 'mobile', 'landline','qq','qqAddress']*/);
	  user['username'] = this.model.get('username');
      user['password'] = this.model.get('password');
	  var url = '/api/v1/updateprofile';
      $.ajax({
        url: url,
        method: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(user)
      }).done(function() {
        //window.alert('update success');
        Dionysus.navigate('/site',{trigger:true});
      }).fail(function() {
        window.alert('update failure');
      }); 
    },
    onRender:function(){
      this.$('select.dropdown').dropdown();
      this.$el.form();
      this.$el.form('set values', this.model.toJSON());
    }
  });

  var ProfileController = Marionette.Controller.extend({
    
    showProfile: function(id){

      $.when(Dionysus.request('user:entity', id)).done(function(user){
        Dionysus.mainRegion.show(new PofileLayoutView({ model: user}));
      })
    },

    showProfile_old: function (id) {
      var userFetching = Dionysus.request('user:entity', id);
      $.when(userFetching).done(function(user) {
	    var profileview = new ProfileView({ model: user});
        profileview.on("profile:update", function(data){
          //alert("update Called!");
        })
        Dionysus.mainRegion.show(profileview);
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
