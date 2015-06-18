Dionysus.module('Profile', function(Profile, Dionysus, Backbone, Marionette) {
  'use strict';

  var PofileLayoutView = Marionette.LayoutView.extend({
    template: JST["templates/home/profile/menu"],
    className: 'layout-view',
    regions: {
      'myContent': '#mycontent',
    },
    ui: {
      myArticles: '#myarticles',
      myAppointments: '#myappointments',
      myCourses: '#mycourses',
      myTests: '#mytests',
      myInfo: '#myinfo'
    },
    events: {
      'click @ui.myArticles': 'showMyArticles',
      'click @ui.myAppointments': 'showMyAppointments',
      'click @ui.myCourses': 'showMyCourses',
      'click @ui.myTests': 'showMyTests',
      'click @ui.myInfo' : 'updateInfo'
    },
    showMyArticles: function(){
      this.getRegion('myContent').show(new Marionette.ItemView({
        template : JST["templates/home/profile/articles"]
      }));
    },
    showMyAppointments: function(){
      var region = this.getRegion('myContent');
      $.when(Dionysus.request('appointment:appointedby', sessionStorage.getItem("user"),5))
        .done(function(appointments){
          region.show(new ProfileAppointmentView({collection: appointments}))
        });
    },
    showMyCourses: function(){
      alert("you click myCourses")
    },
    showMyTests: function(){
      alert("you click myTests")
    },

    updateInfo:function(){
      this.getRegion('myContent').show(new ProfileView({model:this.model}));
    }
  });

  var ProfileAppointmentView = Marionette.ItemView.extend({
    template: JST["templates/home/profile/appointments"],
    serializeData: function(){
      var dataCollection = this.collection.toJSON();
      
      var state_const = {'WAITING':'等待咨询师响应', 'ACCEPTED':'咨询师已接受', 'DECLINED':'咨询师已拒绝', 'FINISHED':'完成'};
      var approach_const = {'ONLINE':'在线', 'OFFLINE':'面对面', 'BY_PHONE':'电话'};

      for (var i = dataCollection.length - 1; i >= 0; i--) {
        var data = dataCollection[i];
        data.state = state_const[data.state];
        data.approach = approach_const[data.approach];
        data.consultant_qqAddress = data.consultant_qqAddress?data.consultant_qqAddress:"#"; 
        
      }
      return {items:dataCollection};
    },
  });

  var ProfileCourseView = Marionette.ItemView.extend({
    template: '',
  });

  var ProfileView = Marionette.ItemView.extend({
    template: JST["templates/home/profile/personal"],
    className: 'ui page',
    ui: {
      submit: '.submit'
    },
    events: {
      'click @ui.submit': 'update'
    },
    update: function(e) {
      this.trigger('profile:update', this.model);
      var user = this.$el.form('get values', ['username', 'email', 'gender', 'age', 'address', 'mobile', 'landline', 'qq', 'qqAddress'] );
      user['username'] = this.model.get('username');
      //user['password'] = this.model.get('password');
      var url = '/api/v1/updateprofile';
      $.ajax({
        url: url,
        method: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(user)
      }).done(function(response) {
        window.alert('更新成功');
        //Dionysus.navigate('/site',{trigger:true});
      }).fail(function(response) {
        window.alert('更新失败');
      });
    },
    onRender: function() {
      this.$('select.dropdown').dropdown();
      this.$el.form('set values', this.model.toJSON());
    }
  });

  var ProfileController = Marionette.Controller.extend({
    showProfile: function(id){

      $.when(Dionysus.request('user:entity', id)).done(function(user){
        var layoutView = new PofileLayoutView({ model: user})
        Dionysus.mainRegion.show(layoutView);
      })
    },

    // XXX: should not expose user id, otherwise user id can be guess by hackers !
    showInfo: function (id) {
      var fetching = Dionysus.request('user:entity', id);
      $.when(fetching).done(function(user) {
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
