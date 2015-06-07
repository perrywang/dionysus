Dionysus.module('Entities', function(Entities, Dionysus, Backbone, Marionette, $) {
  'use strict';

  var Appointment = Backbone.Model.extend({
    url: function () {
      return this.id ? '/controllers/appointments/' + this.id : '/controllers/appointments';
    },
    initialize: function (options) {
      if (options && options.id) {
        this.id = options.id;
      }
    }
  });


  var PageAppointmentModel = Backbone.Model.extend({
    url :function(){
      return '/controllers/appointments?page='+this.page;
    },
    initialize : function(page){
      this.page = page;
    }
  });

  Dionysus.reqres.setHandler('appointment:entities', function(page) {
    var appintments = new PageAppointmentModel(page - 1);
    var defer = $.Deferred();
    appintments.fetch().then(function () {
      defer.resolve(appintments);
    });
    return defer.promise();
  });

  Dionysus.reqres.setHandler('appointment:entity', function(id) {
    var appointment = new Appointment({id: id});
    var defer = $.Deferred();
    appointment.fetch().then(function() {
      defer.resolve(appointment);
    });
    return defer.promise();
  });

  Dionysus.reqres.setHandler('appointment:new', function(){
    return new Appointment();
  });

  Dionysus.reqres.setHandler('appointment:appointedby', function(userid,page) {

    var appointments = new PageAppointmentModel(page);
    appointments.url = '/controllers/appointments/user/'+userid;
    var defer = $.Deferred();
    appointments.fetch().then(function() {
      defer.resolve(appointments);
    });
    return defer.promise();
  });

});

