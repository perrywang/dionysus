Dionysus.module('AdminCourseSummary', function (Course, Dionysus, Backbone, Marionette, $) {
  'use strict';

  var CourseItemView = Marionette.ItemView.extend({
    template: JST["templates/admin/courses/courseitem"],
    tagName: 'tr'
  });

  var CourseUserItemView = Marionette.ItemView.extend({
    template: JST["templates/admin/courses/courseuseritem"],
    tagName: 'tr',
	triggers: {
      'click .input.button':'input:profile'
    }
  });
  
  var PsychoProfileEditorView = Marionette.ItemView.extend({
    template: JST["templates/admin/psychoprofile/psychoprofile"],
    tagName: 'form',
    className: 'ui form',
	initialize: function (options) {
      this.username = this.model.model.toJSON().username;
	  this.id = this.model.model.toJSON().id;
      this.consultantname = this.options.course.toJSON().consultant.username;	  
    },
	serializeData: function() {
      var data = {};
      data.username = this.username;
	  data.consultantname = this.consultantname;
	  data.id = this.id;
      return data;
    },
    ui: {
      save: '.button.submit'
    },
    events: {
      'click @ui.save': 'saveProfile'
    },
    saveProfile: function() {
      var profileitem = {};
	  var json = this.$el.form('get values');
	  profileitem.consultantname = this.consultantname;
	  profileitem.summary = json.summary;
	  profileitem.module = "心理课程";
	  profileitem.datetime = new Date().toDateString();
	  
	  Dionysus.request('psychoprofile:entity', this.id).done(function(profile){
          profileitem.profile = '/api/v1/profiles/' + profile.id;  
		  var url = '/api/v1/profileItems/';  
          $.ajax({
            url: url,
            method: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(profileitem)
          }).done(function(response) {
            window.alert('提交成功');
            Dionysus.navigate('/admin', {trigger: true});
          }).fail(function() {
            window.alert('提交失败');
          });
	  });
    }
  });

  
  var CourseListView = Marionette.CompositeView.extend({
    template: JST["templates/admin/courses/courselist"],
    childView: CourseItemView,
    tagName: 'table',
    className: 'ui inverted purple table',
    childViewContainer: 'tbody',
    initialize: function(options){
      if (options && options.totalPages){
        this.totalPages =options.totalPages;
      }
      if(options && options.current){
        this.current =options.current;
      }
    },
    onDomRefresh:function(){
      this.$el.parent().append($('<div id="pagging"></div>'));
      $('#pagging').twbsPagination({
        totalPages: this.totalPages,
        startPage: this.current,
        visiblePages: 6,
        first: '第一页',
        prev: '前一页',
        next: '后一页',
        last: '最后一页',
        loop:true,
        onPageClick: function(event,page){
          Dionysus.navigate('/admin/coursesummary?page=' + page,{trigger:true});
        }
      });
    }
  });
  
  var CourseUserListView = Marionette.CompositeView.extend({
    template: JST["templates/admin/courses/courseuserlist"],
    childView: CourseUserItemView,
    tagName: 'table',
    className: 'ui inverted purple table',
    childViewContainer: 'tbody',
    initialize: function(options){
      if (options && options.totalPages){
        this.totalPages =options.totalPages;
      }
      if(options && options.current){
        this.current =options.current;
      }
    }
  });

  function parseQueryString(queryString){
    var params = {};
    if(queryString){
      _.each(
          _.map(decodeURI(queryString).split(/&/g),function(el,i){
            var aux = el.split('='), o = {};
            if(aux.length >= 1){
              var val = undefined;
              if(aux.length == 2)
                val = aux[1];
              o[aux[0]] = val;
            }
            return o;
          }),
          function(o){
            _.extend(params,o);
          }
      );
    }
    return params;
  }

  var CourseSummaryController = Marionette.Controller.extend({

    showCourses: function (queryString) {
      var params = parseQueryString(queryString);
      var page = 1;
      if(params.page){
        page = parseInt(params.page);
      }
      Dionysus.mainRegion.show(new Dionysus.Common.Views.Loading());
      $.when(Dionysus.request('course:entities',page)).done(function (pagedCourses) {
        var courses = new Backbone.Collection(pagedCourses.get('content'));
        var totalPages = pagedCourses.get('totalPages');
        var listView = new CourseListView({collection:courses,current:page,totalPages:totalPages});
        Dionysus.mainRegion.show(listView);
      });
	},
	
	showUsers: function (id){
      Dionysus.request('course:users', id).done(function(users){
		var listview = new CourseUserListView({collection:users});
		listview.on('childview:input:profile', function(childView, model){
		  Dionysus.request('course:entity', id).done(function(course){
		    var editor = new PsychoProfileEditorView({model:model, id:id, course:course});
		    Dionysus.mainRegion.show(editor); 
	      });	           	  
		});
		Dionysus.mainRegion.show(listview);          	  
	  });		
	}
  });

  Dionysus.addInitializer(function () {
    new Marionette.AppRouter({
      appRoutes: {
        'admin/coursesummary(?*querystring)': 'showCourses',
		'admin/courseuserlist/:id(/)': 'showUsers'
      },
      controller: new CourseSummaryController()
    });
  });
});
