Dionysus.module('AdminConsultant', function(Consultant, Dionysus, Backbone, Marionette, $) {
  'use strict';

  var ConsultantListItemView = Marionette.ItemView.extend({
    template: JST["templates/admin/consultants/consultantlistitem"],
    className: "item"
  });

  var ConsultantListView = Marionette.CompositeView.extend({
    template: JST["templates/admin/consultants/consultantlist"],
    childView: ConsultantListItemView,
    childViewContainer: '.items'
  });

  var ConsultantController = Marionette.Controller.extend({
    
    showConsultantList: function(page){
      //show loading before get any data
      Dionysus.mainRegion.show(new Dionysus.Common.Views.Loading());

      Dionysus.request('consultant:entities', page).then(function(consultants){
        var consultantlist = new ConsultantListView({
          collection: consultants.embedded('consultants')
        });

        Dionysus.mainRegion.show(consultantlist);
      });

    },

    showConsultant: function(id){
      //show loading before get any data
      Dionysus.mainRegion.show(new Dionysus.Common.Views.Loading());

      Dionysus.request('consultant:item', id).then(function(consultant){

      });
    }
  });

  Dionysus.addInitializer(function() {
    new Marionette.AppRouter({
      appRoutes: {
        'admin/consultants(/p:page)': 'showConsultantList',
        'admin/consultants/:id': 'showConsultant'
      },
      controller: new ConsultantController()
    });
  });
});