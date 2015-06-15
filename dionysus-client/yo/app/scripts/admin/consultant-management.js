Dionysus.module('AdminConsultant', function(Consultant, Dionysus, Backbone, Marionette, $) {
  'use strict';

  var ConsultantListItemView = Marionette.ItemView.extend({
    template: JST["templates/admin/consultants/consultantlistitem"],
    className: "item"
    ui: {
      enableMe: '.button.delete'
    },
    events: {
      'click @ui.enableMe': 'enableConsultant'
    },
    enableConsultant: function(e) {
      e.stopPropagation();
      this.trigger('consultant:enable', this.model);
    }
  });

  var ConsultantListView = Marionette.CompositeView.extend({
    template: JST["templates/admin/consultants/consultantlist"],
    childView: ConsultantListItemView,
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
        'admin/consultants/:id': 'showConsultant'
      },
      controller: new ConsultantController()
    });
  });
});