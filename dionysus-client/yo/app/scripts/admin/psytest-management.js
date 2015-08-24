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
      this.username = this.model.model.toJSON().createdBy.username;
	  //this.consultantname = this.model.model.toJSON().consultant.username;
	  this.id = this.model.model.toJSON().createdBy.id;
    },
	serializeData: function() {
      var data = {};
      data.username = this.username;
	  //data.consultantname = this.consultantname;
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
	  profileitem.consultantname = json.consultantname;
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
    },
    gotoPage: function(event, page){
      this.collection.getPage(page-1);
    }
  });

  var PsychTestAnswersView = Marionette.ItemView.extend({
    template: JST["templates/admin/psychtests/answers"],
    serializeData: function() {
      
      //拼装meta信息
      var meta = this.model.toJSON();

      //拼装答案
      var answers = this.collection.toJSON();
      var items = [];
      _.each(answers, function(answer) {

        var type = answer.type;

        //拼装问题描述和选项
        var question = answer._embedded.question;
        var questionString = '<p>' + question.description + '</p>';
        if(type == 'SINGLE_CHOICE' || type == 'MULTIPLE_CHOICE'){
          var optionString = ''
          _.each(question.options, function(option){
            optionString += option.identity + ': ' + option.description + ' ';
          })
          questionString += '<p>' + optionString + '</p>';
        }

        //转换答案
        var answerString = answer.value;
        if(type == 'SINGLE_CHOICE' || type == 'MULTIPLE_CHOICE'){
          answerString = answer._embedded.option.identity;
        }
        else if(type == 'YES_NO'){
          answerString = answer.value? 是:否;
        }

        items.push({
          id: answer.qid,
          question: questionString,
          answer: answerString
        });

      });

      return {items:items, meta: meta};
    }
  });


  var PsychTestController = Marionette.Controller.extend({

    showPsychtests: function () {
      Dionysus.mainRegion.show(new Dionysus.Common.Views.Loading());
      $.when(Dionysus.request('psychtestresult:all:pageable')).done(function (psychtests) {  
        var listView = new PsychTestListView({collection:psychtests});
        listView.on('childview:input:profile', function(childView, model){
		  var editor = new PsychoProfileEditorView({model:model});
		  Dionysus.mainRegion.show(editor); 
		});
        Dionysus.mainRegion.show(listView);
      });
	},

    showPsychtestResult: function(tid, rid){
      Dionysus.mainRegion.show(new Dionysus.Common.Views.Loading());

      var fetcResult = Dionysus.request('psychtestresult:dto:instance', rid);
      var fetchAnswers = Dionysus.request('psychtestanswers:by:result', rid);

      $.when(fetcResult, fetchAnswers).done(function(result, answers){
        Dionysus.mainRegion.show(new PsychTestAnswersView({collection:answers, model: result}));
      });
  },

  calcResult: function(id){
    alert(id);
  }
  });

  Dionysus.addInitializer(function () {
    new Marionette.AppRouter({
      appRoutes: {
        'admin/psychotests': 'showPsychtests',
        'admin/psychotestresult/tid=:tid&rid=:rid': 'showPsychtestResult',
        'admin/psychotestresult/calc/:id': 'calcResult'
      },
      controller: new PsychTestController()
    });
  });
});
