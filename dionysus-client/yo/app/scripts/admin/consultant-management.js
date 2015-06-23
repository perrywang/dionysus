Dionysus.module('AdminConsultant', function(Consultant, Dionysus, Backbone, Marionette, $) {
  'use strict';

  var ConsultantListItemView = Marionette.ItemView.extend({
    template: JST["templates/admin/consultants/consultantlistitem"],
    className: "item",
	onRender:function(){
      var consultant =this.model;
      this.$el.on('click.enableMe','.button.delete',function(){
        consultant.set('enabled',true);
        consultant.save();
		window.alert('审核成功');
		Dionysus.navigate('admin', {trigger: true});
      });
    }
  });

  var ConsultantExpertiseListItemView = Marionette.ItemView.extend({
    template: JST["templates/admin/consultants/consultantexpertiselistitem"],
    className: "item",
	onRender:function(){
      var consultant =this.model;
      this.$el.on('click.enableMe','.save.button',function(){
        Dionysus.navigate('admin/consultants/' + consultant.id, {trigger: true});
      });
    }
  });
  
  var AddExpertiseListItemView = Marionette.ItemView.extend({
    template: JST["templates/admin/consultants/expertiselistitem"],
    className: "item",
	triggers: {
      'click .save.button':'add:expertise'
    }
  });
  
  var ConsultantListView = Marionette.CompositeView.extend({
    template: JST["templates/admin/consultants/consultantlist"],
    childView: ConsultantListItemView,
    childViewContainer: '.items'
  });
  
  var ConsultantExpertiseListView = Marionette.CompositeView.extend({
    template: JST["templates/admin/consultants/consultantexpertiselist"],
    childView: ConsultantExpertiseListItemView,
    childViewContainer: '.items'
  });
  
  var AddExpertiseListView = Marionette.CompositeView.extend({
    template: JST["templates/admin/consultants/expertiselist"],
    childView: AddExpertiseListItemView,
    childViewContainer: '.items',	
	ui: {
      save: '.submit.button'
    },
    events: {
      'click @ui.save': 'saveExpertise'
    },
    saveExpertise: function() {
      this.trigger('expertise:save');
    },
  });

  var ConsultantController = Marionette.Controller.extend({
    
    showConsultantList: function(){
      Dionysus.mainRegion.show(new Dionysus.Common.Views.Loading());
      Dionysus.request('consultant:finddisabled').then(function(consultants){
        var consultantlist = new ConsultantListView({
          collection: consultants
        });
        Dionysus.mainRegion.show(consultantlist);
      });
    },

    showConsultantExpertiseList: function(){
      Dionysus.mainRegion.show(new Dionysus.Common.Views.Loading());
      Dionysus.request('consultant:simplelist').then(function(consultants){
        var consultantlist = new ConsultantExpertiseListView({
          collection: consultants
        });
        Dionysus.mainRegion.show(consultantlist);
      });
    },
	
    showExpertises: function(id){
      Dionysus.mainRegion.show(new Dionysus.Common.Views.Loading());    	  
	  $.when(Dionysus.request('consultant:entity', id), Dionysus.request('consultant:expertises')).done(function (consultant, expertises){
        var expertiselist = new AddExpertiseListView({
          collection: expertises, consultant: consultant
        });
		var consultant_put = {};
		var initconsultant = {};
		//var expertises_put = {expertises:[]};
		var expertises_put = [];
        expertiselist.on('childview:add:expertise', function(childView, model){
		  initconsultant = this.options.consultant.toJSON();
          var jsonstring = model.model.id;		  
          expertises_put.push('/api/v1/consExpertises/' + jsonstring);
		  window.alert('添加成功');
		});
        expertiselist.on('expertise:save', function(){
          //var initconsultant = this.options.consultant.toJSON();
		  consultant_put = initconsultant;
		  consultant_put.expertises = [];
		  consultant_put.expertises = expertises_put;
          var url = '/api/v1/consultants/' + consultant_put.id;		  
          $.ajax({
            url: url,
            method: 'PUT',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(consultant_put)
          }).done(function(response) {
            window.alert('提交成功');
          }).fail(function() {
            window.alert('提交失败');
          }); 
		});
        Dionysus.mainRegion.show(expertiselist);	  
	  });	  
    }
  });

  Dionysus.addInitializer(function() {
    new Marionette.AppRouter({
      appRoutes: {
        'admin/consultants': 'showConsultantList',
		'admin/consultantexpertise': 'showConsultantExpertiseList',
        'admin/consultants/:id': 'showExpertises'
      },
      controller: new ConsultantController()
    });
  });
});