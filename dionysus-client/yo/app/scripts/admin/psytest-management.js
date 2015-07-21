Dionysus.module('AdminPsychTest', function (PsychTest, Dionysus, Backbone, Marionette, $) {
  'use strict';

  var PsychTestItemView = Marionette.ItemView.extend({
    template: JST["templates/admin/psychtests/psychtestitem"],
    tagName: 'tr',	
	initialize: function (options) {
      this.id = this.model.toJSON().id;
      this.title = this.model.toJSON().test.title;
      this.username = this.model.toJSON().createdBy.username;	  
    },	
    serializeData: function() {
      var data = {};
      data.username = this.username;	  
	  data.title = this.title;
      return data;
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
      //this.username = this.model.model.toJSON().user.username;
	  //this.consultantname = this.model.model.toJSON().consultant.username;
	  //this.id = this.model.model.toJSON().user.id;
    },
	serializeData: function() {
      var data = {};
      //data.username = this.username;
	  //data.consultantname = this.consultantname;
	  //data.id = this.id;
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
	  profileitem.module = "心理测试";
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

  
  var PsychTestListView = Marionette.CompositeView.extend({
    template: JST["templates/admin/psychtests/psychtestlist"],
    childView: PsychTestItemView,
    tagName: 'table',
    className: 'ui celled striped table',
    childViewContainer: 'tbody',
    initialize: function(options){
    },
    onDomRefresh:function(){
    }
  });


  var PsychTestController = Marionette.Controller.extend({

    showPsychtests: function () {
      Dionysus.mainRegion.show(new Dionysus.Common.Views.Loading());
      $.when(Dionysus.request('psychotest:instances')).done(function (psychtests) {  
        var listView = new PsychTestListView({collection:psychtests});
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
        'admin/psychotests': 'showPsychtests'
      },
      controller: new PsychTestController()
    });
  });
});
