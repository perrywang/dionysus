Dionysus.module('AdminPsychTest', function (PsychTest, Dionysus, Backbone, Marionette, $) {
  'use strict';

  var PsychTestItemView = Marionette.ItemView.extend({
    template: JST["templates/admin/psychtests/psychtestitem"],
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
          Dionysus.navigate('/admin/psychotests?page=' + page,{trigger:true});
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

  var PsychTestController = Marionette.Controller.extend({

    showPsychtests: function (queryString) {
      var params = parseQueryString(queryString);
      var page = 1;
      if(params.page){
        page = parseInt(params.page);
      }
      Dionysus.mainRegion.show(new Dionysus.Common.Views.Loading());
      $.when(Dionysus.request('appointment:entities',page)).done(function (pagedPsychtests) {
        var psychtests = new Backbone.Collection(pagedPsychtests.get('content'));
        var totalPages = pagedPsychtests.get('totalPages');
        var listView = new PsychTestListView({collection:psychtests,current:page,totalPages:totalPages});
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
        'admin/psychotests(?*querystring)': 'showPsychtests'
      },
      controller: new PsychTestController()
    });
  });
});
