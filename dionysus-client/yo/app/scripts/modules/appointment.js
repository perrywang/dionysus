Dionysus.module('Appointment', function(Appointment, Dionysus, Backbone, Marionette) {
  'use strict';

  var AppointmentView = Marionette.ItemView.extend({
    template: JST['templates/home/appointment/appointment'],
    tagName: 'li',
    className: 'item'
  });

  var AppointmentsView = Marionette.CompositeView.extend({
    template: JST['templates/home/appointment/appointments'],
    childView: AppointmentView,
    childViewContainer: '.items',
    className: 'ui page'
  });

  var AppointmentController = Marionette.Controller.extend({
    showAppointments: function () {
      var fetchingAppointments = Dionysus.request('appointment:entities');
      $.when(fetchingAppointments).done(function(appointments) {
        Dionysus.mainRegion.show(new AppointmentsView({ collection: appointments }));
      });
    },

    showAppointmentsByUser: function(userid){
      var appointmentFetching = Dionysus.request('appointment:appointedby', userid);
      $.when(appointmentFetching).done(function(appointments) {
        Dionysus.mainRegion.show(new AppointmentsView({ collection: appointments}));
      });
    }
  });

  Dionysus.addInitializer(function() {
    new Marionette.AppRouter({
      appRoutes : {
        'appointments/appointedBy/:id' : 'showAppointmentsByUser',
        'appointments(/)': 'showAppointments'
      },
      controller: new AppointmentController()
    });
  });
});
