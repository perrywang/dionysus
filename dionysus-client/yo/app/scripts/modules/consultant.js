Dionysus.module('Consultant', function(Consultant, Dionysus, Backbone, Marionette) {
  'use strict';

  var ConsultantView = Marionette.ItemView.extend({ 
    template: '#consultant-tpl',
    tagName: 'li',
    className: 'item'
  });

  var ConsultantsView = Marionette.CompositeView.extend({
    template: '#consultants-tpl',
    childView: ConsultantView,
    childViewContainer: '.items',
    className: 'ui page'
  });

  var ConsultantController = Marionette.Controller.extend({
    showConsultants: function () {
      var fetchingConsultants = Dionysus.request('consultant:entities');
      $.when(fetchingConsultants).done(function(consultants) {
        Dionysus.mainRegion.show(new ConsultantsView({ collection: consultants }));
      });
    },
  });

  Dionysus.addInitializer(function() {
    new Marionette.AppRouter({
      appRoutes : {
        'app/consultants(/)': 'showConsultants',
      //  'app/consultants/:id(/)': 'showConsultant'
      },
      controller: new ConsultantController()
    });
  });
});
