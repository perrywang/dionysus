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
      this.$el.on('click.enableMe','.button.delete',function(){
		window.alert('添加成功');
		Dionysus.navigate('admin', {trigger: true});
      });
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
	
    showConsultant: function(id){
      Dionysus.mainRegion.show(new Dionysus.Common.Views.Loading());
      Dionysus.request('consultant:item', id).then(function(consultant){
      });
    }
  });

  Dionysus.addInitializer(function() {
    new Marionette.AppRouter({
      appRoutes: {
        'admin/consultants': 'showConsultantList',
		'admin/consultantexpertise': 'showConsultantExpertiseList',
        'admin/consultants/:id': 'showConsultant'
      },
      controller: new ConsultantController()
    });
  });
});