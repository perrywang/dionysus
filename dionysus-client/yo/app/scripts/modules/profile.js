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
	    myProfile: '#myprofiles',
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
      'click #uploadAvatar': 'uploadAvatar',
      'click #changePass': 'changePass'
    },

    uploadAvatar: function(){
      this.getRegion('myContent').show(new uploadAvatarView({model:this.model}));
    },

    changePass: function(){
      this.getRegion('myContent').show(new changePassView({model:this.model}));
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
      if(this.model.toJSON().roles[0].name="ROLE_CONSULTANT"){
		region.show(new ProfileConsultantAppointmentView());
	  }else{
        Dionysus.request("appointments:search:pageable", "findByUser", {
        user: sessionStorage.getItem('user'),
        projection: "myappointment"
      }).done(function(appointments) {
        region.show(new ProfileAppointmentView({collection: appointments}));
      });
	  }  
      

    },
    showMyCourses: function(){
      var region = this.getRegion('myContent');
      $.when(Dionysus.request('course:profile:me')).done(function(courses){
        var courseView = new MyCourseView({'courses':courses});
        region.show(courseView);
      });
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
      alert("功能开发中");
    },
    updateInfo:function(){
      this.getRegion('myContent').show(new ProfileView({model:this.model}));
    }
  });


/**
  VIEW VIEW VIEW VIEW VIEW VIEW
**/

  var uploadAvatarView = Marionette.ItemView.extend({
    template:JST['templates/home/profile/uploadAvatar'],
    initialize: function(options){
      this.uploadedFileName = "";
    },
    events:{
      'click .submit': function(){
        // This function uses pure HTML5 fileupload capability
        var model = this.model;
        var thisView = this;

        var progressing = function(evt) {
          if (evt.lengthComputable) {
            var percentComplete = Math.round(evt.loaded * 100 / evt.total);
            $('#progress').progress({
              percent: percentComplete
            });
          }
        };


        var files = $('#fileupload')[0].files;
        if (files.length == 0 ) {alert('你还没有选择文件'); return;};
        var file = files[0];
        if (file.size > (2 * 1024 * 1024)) {alert('图片不能超过2M'); return;}
        if (file.name === thisView.uploadedFileName){alert('请不要重复提交'); return;}
        var url = "/api/v1/upload/avatar";
        var xhr = new XMLHttpRequest();
        var fd = new FormData();
        xhr.upload.addEventListener('progress', progressing, false);
        xhr.open('POST', url, true);
        xhr.onreadystatechange = function(){
          if (xhr.readyState ==4 && xhr.status == 200) {
            var json = JSON.parse(xhr.responseText);
            $('img.mypic').attr('src',json.link);
            model.set('avatar', json.link);
            thisView.uploadedFileName = file.name;
          };
        };
        fd.append('file', file);
        xhr.send(fd);

      }
    }
  });

  var changePassView = Marionette.ItemView.extend({
    template: JST['templates/home/profile/changePass'],
    events: {
      'click .submit': function() {
        var data = Backbone.Syphon.serialize(this);
        
        //validation
        if (!data.oldpass || data.oldpass == '') {
          alert('旧密码不能为空');
          return;
        } else if (!data.newpass || data.newpass == '') {
          alert('新密码不能为空');
          return;
        } else if (data.newpass !== data.newpass2) {
          alert('两次密码输入不一致');
          return;
        }

        //post
        $.ajax({
          //url: 'api/v1/changepass?oldpass='+data.oldpass+'&newpass='+data.newpass,
          url: '/api/v1/changepass',
          method: 'POST',
          contentType: 'application/json; charset=utf-8',
          data: JSON.stringify({
            oldPass: data.oldpass,
            newPass: data.newpass
          })
        }).done(function(data){
          if (data.status === 'fail_pass') alert('原始密码错误');
          else if(data.status === 'success') alert('密码修改成功');  
        }).fail(function(){
          alert('密码修改失败');
        });


      }
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

  var courseState = {
    'OPEN':'开放注册',
    'IN_PROGRESS': '正在进行',
    'FINISHED': '已经结束'
  };

  var courseApproach = {
    'ONE2MANY':'在线课堂',
    'OFFLINE':'离线课程'
  }

  var MyCourseView = Marionette.ItemView.extend({
    initialize : function(options){
      this.courses = options.courses;
    },
    serializeData : function(){
      return {'courses':this.courses};
    },
    template:function(data){
      var template = JST['templates/home/profile/courses'];
      for(var index = 0; index < data.courses.length; index++){
        var course = data.courses[index];
        var state = course.state;
        var approach = course.approach;
        course.state = courseState[state] || '未知';
        course.approach = courseApproach[approach] || '未知';
      }
      var html = template(data);
      return html;
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
  
  var ProfileConsultantAppointmentView = Marionette.ItemView.extend({
    template: JST["templates/home/profile/appointmentsConsultant"],
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

  //Inbox View
  var InboxView = Dionysus.Common.Views.PageableItemView.extend({
    template: JST['templates/home/profile/inbox'],
    className: "ui stackable centered grid"
  });



  /**
  CONTROLLER CONTROLLER CONTROLLER CONTROLLER
  **/

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
    },

    showInbox: function(){

      Dionysus.request('user:notifications',"findMyNotification",{size:50}).done(function(notifications){
        var view = new InboxView({
          collection: notifications
        });
        Dionysus.mainRegion.show(view);
      });

    }
  });

  Dionysus.addInitializer(function() {
    new Marionette.AppRouter({
      appRoutes : {
        'profile/:id(/)': 'showProfile',
        'inbox(/)': 'showInbox'
      },
      controller: new ProfileController()
    });
  });
});
