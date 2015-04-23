Dionysus.module('Entities', function(Entities, Dionysus, Backbone, Marionette, $) {
  'use strict';

  Entities.Appointment = Backbone.Model.extend({
    urlRoot: '/api/v1/appointments',
  });


  Entities.AppointmentCollection = Backbone.Collection.extend({
    model: Entities.Appointment,
    url: '/api/v1/appointments',
    parse: function(response) {
      var embedded = response._embedded;
      return embedded ? embedded.appointments : [];
    },
	initialize : function(options){
      if(options && options.appendUrl){
        this.url += options.appendUrl;
      }
    },
    state: {
      firstPage: 0
    },
    queryParams: {
      currentPage: 'page',
      pageSize: 'size'
    }
  });

  Dionysus.reqres.setHandler('appointment:entities', function() {
    var appointments = new Entities.AppointmentCollection();
    var defer = $.Deferred();
    appointments.fetch().then(function() {
      defer.resolve(appointments);
    });
    return defer.promise();
  });

  Dionysus.reqres.setHandler('appointment:entity', function(id) {
    var appointment = new Entities.Consultant({id: id});
    var defer = $.Deferred();
    appointment.fetch().then(function() {
      defer.resolve(appointment);
    });
    return defer.promise();
  });

  Dionysus.reqres.setHandler('appointment:new', function(){
    return new Entities.Appointment();
  });

  Dionysus.reqres.setHandler('appointment:appointedby', function(userid) {
    var appointments = new Entities.AppointmentCollection({appendUrl:'/search/findByUser'});
    var defer = $.Deferred();
    appointments.fetch({ data: { user:userid }}).then(function() {
      defer.resolve(appointments);
    });
    return defer.promise();
  });
});

