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
      myInfo: '#myinfo',
	  myProfile: '#myprofiles'
    },
    childEvents:{
      "blog:open": 'editBlog',
      "blog:new": 'editBlog',
      "appointment:feedBack": 'editFeedBack'
    },

    editBlog: function(childView, id){
      var region = this.getRegion('myContent');
      if(id){
        Dionysus.request("blog:item", id).done(function(blog){
          region.show(new BlogEditorView({model:blog}));
        });
      }
      else{
        var blog = new Dionysus.Domain.BlogModel();
        region.show(new BlogEditorView({model:blog}))
      }
    },

    editFeedBack: function(childView, model){
      if(model){
        var region = this.getRegion('myContent');
        var view = new ProfileAppointmentFeedbackView({model: model});
        region.show(view);
      }
    },

    events: {
      'click @ui.myArticles': 'showMyArticles',
      'click @ui.myAppointments': 'showMyAppointments',
      'click @ui.myCourses': 'showMyCourses',
      'click @ui.myTests': 'showMyTests',
      'click @ui.myInfo' : 'updateInfo',
      'click @ui.myProfile' : 'showProfiles',
    },
    showMyArticles: function(){
      var region = this.getRegion('myContent');
      var user = sessionStorage.getItem('user');
      if(!user || user==="") {
        Dionysus.trigger('login');
        return
      }
      Dionysus.request("blog:my:pageable", user).done(function(blogs){
        var view = new ProfileBlogListView({
          collection: blogs
        });
        region.show(view);
      });


      this.getRegion('myContent').show(new Marionette.ItemView({
        template : JST["templates/home/profile/articles"]
      }));
    },
    showMyAppointments: function(){
      var region = this.getRegion('myContent');
      Dionysus.request("appointments:search:pageable", "findByUser", {
        user: sessionStorage.getItem('user'),
        projection: "myappointment"
      }).done(function(appointments) {
        region.show(new ProfileAppointmentView({collection: appointments}));

      });

    },
    showMyCourses: function(){
      alert("功能开发中");
    },
    showProfiles: function(){
      var region = this.getRegion('myContent');
	  var user = sessionStorage.getItem('user');
	  if(!user || user==="") {
        Dionysus.trigger('login');
        return
      }
	  var username = this.model.toJSON().realName;
      Dionysus.request("psychoprofile:findbyUser", user).done(function(profiles){
        region.show(new ProfilePsychoProfileView({collection: profiles, name: username}));
      });      
    },	
    showMyTests: function(){
      alert("功能开发中")
    },
    updateInfo:function(){
      this.getRegion('myContent').show(new ProfileView({model:this.model}));
    }
  });


  var BlogEditorView = Marionette.ItemView.extend({
    template: JST['templates/home/profile/blogEditor'],
    tagName: "form",
    className: "ui form",
    initialize: function(options){
      var x;
    },

    onRender: function(){
      
      this.$el.form('set values', this.model.toJSON());

      var validate = {
        title: {
          identifier: 'title',
          rules: [{
            type: 'empty',
            prompt: '还差标题哦！'
          }]
        }
      };

      this.$el.form(validate);

      this.$('.editor').editable({
        buttons: ['bold', 'italic', 'underline', 'strikeThrough', 'fontSize', 'fontFamily', 'color', 'sep',
          'formatBlock', 'blockStyle','inlineStyle', 'align', 'insertOrderedList', 'insertUnorderedList', 'table', 'outdent', 'indent', 'sep',
          'createLink', 'insertImage', 'insertHorizontalRule', 'undo', 'redo', 'html', 'uploadFile'
        ],
        inlineMode: false,
        language: 'zh_cn',
        imageUploadURL: '/api/v1/upload',
        fileUploadURL: '/api/v1/upload'
      });
    },

    events: {
      'click .button': function(){

        var data = Backbone.Syphon.serialize(this);
        if(data.title!=="" && data.body!==""){
          this.model.set('title',data.title);
          this.model.set('body',data.body);
          this.model.save().then(function(resp){
          alert('文章保存成功');
        });
        }
      }
    }
  });

  var ProfileBlogListView = Marionette.ItemView.extend({
    template:JST['templates/home/profile/blogs'],
    initialize: function(options){
      if(this.collection) this.listenTo(this.collection, 'add', this.render, this);
    },
    
    events:{
      "gotoPage #paging": "gotoPage",
      "click a": "openBlog",
      "click #newBlog": "newBlog"
    },

    newBlog:function(e){
      e.preventDefault();
      this.triggerMethod("blog:new");
    },

    openBlog: function(e){
      e.preventDefault();
      var id = $(e.currentTarget).data("id");
      this.triggerMethod("blog:open", id);
    },

    gotoPage: function(event, page){
      this.collection.getPage(page-1);
    },
    onRender: function() {
      var state = this.collection.state;
      var currentPage = state['currentPage'] + 1;
      var total = state['totalPages'] == 0 ? 1 : state['totalPages'];
      this.$('#paging').twbsPagination({
        totalPages: total,
        startPage: currentPage,
        visiblePages: 6,
        first: '第一页',
        prev: '前一页',
        next: '后一页',
        last: '最后一页',
        loop: true,
        onPageClick: function(event, page) {
          $(this).trigger("gotoPage", page);
        }
      });
    }
  });


  var ProfileAppointmentFeedbackView = Marionette.ItemView.extend({
    template: JST['templates/home/profile/appointmentFeedback'],
    className: 'ui form',
    events: {
      'click .submit': function() {
        var ori_value = this.model.get('feedBack');
        var data = Backbone.Syphon.serialize(this);

        if (ori_value !== data.feedBack) {
          this.model.set('feedBack', data.feedBack);
          var json = this.model.toJSON();
          //json.consultant = '/api/v1/' + json.consultant.id;
          json = _.omit(json, 'consultant');

          $.ajax({
            url: this.model.urlRoot+'/'+this.model.id,
            method: 'PUT',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(json)
          }).done(function(response) {
            window.alert('提交成功');
          }).fail(function(response) {
            window.alert('提交失败');
          });

        };

      }
    },
    onRender: function(){
      var data = this.model.toJSON();
      this.$el.form('set values', data);
    }
  });

  var ProfileAppointmentView = Marionette.ItemView.extend({
    template: JST["templates/home/profile/appointments"],

    events: {
      'click .feedback': 'feedBack'
    },

    feedBack: function(e){
      e.preventDefault();
      var id = $(e.currentTarget).data("id");
      var model = this.collection.get(id);
      this.triggerMethod("appointment:feedBack", model);
    },

    serializeData: function(){
      var dataCollection = this.collection.toJSON();
      
      var state_const = {'WAITING':'等待咨询师响应', 'ACCEPTED':'咨询师已接受', 'DECLINED':'咨询师已拒绝', 'FINISHED':'完成'};
      var state_color = {'WAITING':'', 'ACCEPTED':'green', 'DECLINED':'red', 'FINISHED':'teal'};
      var approach_const = {'ONLINE':'在线', 'OFFLINE':'面对面', 'BY_PHONE':'电话'};

      for (var i = dataCollection.length - 1; i >= 0; i--) {
        var data = dataCollection[i];
        data.state_value = data.state;
        data.state_color = state_color[data.state];
        data.state = state_const[data.state];
        data.approach_value = data.approach;
        data.approach_online = data.approach=="ONLINE"?true:false;
        data.approach = approach_const[data.approach];
        data.consultant_qqAddress = data.consultant_qqAddress?data.consultant_qqAddress:"#"; 
        
      }
      return {items:dataCollection};
    },
  });
  
  var ProfilePsychoProfileView = Marionette.ItemView.extend({
    template: JST["templates/home/profile/psychoprofiles"],
    initialize: function (options) {
      this.username = options.name;
    },
    serializeData: function(){
      var dataCollection = this.collection.toJSON();
	  for (var i = dataCollection.length - 1; i >= 0; i--){
          var data = dataCollection[i];
		  data.username = this.username;
	  }
      return {profileItems:dataCollection};
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
      var user = this.$el.form('get values');
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
      if(sessionStorage.getItem('user')!==id) return;
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
