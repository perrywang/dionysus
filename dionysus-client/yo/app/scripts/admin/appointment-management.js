Dionysus.module('AdminAppointment', function (Course, Dionysus, Backbone, Marionette, $) {
  'use strict';

  var AppointmentItemView = Marionette.ItemView.extend({
    template: JST["templates/admin/appointments/appointmentitem"],
    tagName: 'tr',
    onRender:function(){
      var that = this;
      var model =this.model;
      var dropdown = this.$el.find('.ui.dropdown');
      dropdown.dropdown('set selected',model.get('state'));
      this.$el.on('click.save','.save.button',function(){
        var dropdown = that.$el.find('.ui.dropdown');
        var selected = dropdown.dropdown('get value');
        var appointment = new Backbone.Model();
        appointment.set('id',model.id);
        appointment.set('state',selected);
        appointment.set('user',model.get('user'));
        appointment.set('consultant',model.get('consultant'));
        appointment.set('date',model.get('date'));
        appointment.url = '/controllers/appointments/' + model.id;
        appointment.save().done(function(){alert('保存成功')});
      });
    },
	triggers: {
      'click .input.button':'input:profile'
    }
  });

  var PsychoProfileEditorView = Marionette.ItemView.extend({
    template: JST["templates/admin/psychoprofile/psychoprofile"],
    tagName: 'form',
    className: 'ui form',
    initialize: function (options) {
      this.username = this.model.model.toJSON().user.username;
	  this.consultantname = this.model.model.toJSON().consultant.username;
	  this.id = this.model.model.toJSON().user.id;
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
	  profileitem.module = "心理预约";
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

  
  var AppointmentListView = Marionette.CompositeView.extend({
    template: JST["templates/admin/appointments/appointmentlist"],
    childView: AppointmentItemView,
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
          Dionysus.navigate('/admin/appointments?page=' + page,{trigger:true});
        }
      });
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

  var AppointmentController = Marionette.Controller.extend({

    editPsychoProfile: function(){
      //show loading before get any data
      
    },
	
    showAppointments: function (queryString) {
      var params = parseQueryString(queryString);
      var page = 1;
      if(params.page){
        page = parseInt(params.page);
      }
      Dionysus.mainRegion.show(new Dionysus.Common.Views.Loading());
      $.when(Dionysus.request('appointment:entities',page)).done(function (pagedAppointments) {
        var appointments = new Backbone.Collection(pagedAppointments.get('content'));
        var totalPages = pagedAppointments.get('totalPages');
        var listView = new AppointmentListView({collection:appointments,current:page,totalPages:totalPages});
        listView.on('childview:input:profile', function(childView, model){
		  var editor = new PsychoProfileEditorView({model:model});
		  Dionysus.mainRegion.show(editor);          	  
		});
        Dionysus.mainRegion.show(listView);
      });
	}
  });

  Dionysus.addInitializer(function () {
    new Marionette.AppRouter({
      appRoutes: {
        'admin/appointments(?*querystring)': 'showAppointments',
		'admin/appointments/psychoprofile': 'editPsychoProfile'
      },
      controller: new AppointmentController()
    });
  });
});
