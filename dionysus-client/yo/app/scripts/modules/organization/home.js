Dionysus.module('Organization', function(Organization, Dionysus, Backbone, Marionette){

  var OrganizationController = Marionette.Controller.extend({
    showOrganizationHome: function(){
      Dionysus.mainRegion.show(new Dionysus.Common.Views.Loading());
    },
    showOrganization:function(id){
    }
  });
  Dionysus.addInitializer(function () {
    new Marionette.AppRouter({
      appRoutes: {
        'organizations(/)': 'showOrganizationHome',
        'organizations/:id(/)' : 'showOrganization'
      },
      controller: new OrganizationController()
    });
  });
});
