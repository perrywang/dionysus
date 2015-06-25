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

  var AppointmentModel = Backbone.Model.extend({
    urlRoot:"/api/v1/appointments"
  });

  var AppointmentPageableCollection = Backbone.PageableCollection.extend({
    url: '/api/v1/appointments',

    initialize: function(options){
      if(options && options.searchMethod) this.url += '/search/'+options.searchMethod;
      _.extend(this.queryParams, options.criteria);
    },

    model: AppointmentModel,
    state: {
      firstPage : 0,
      currentPage: 0, 
      pageSize:10
    },
    queryParams: {
      currentPage: "page",
      pageSize: "size",
      totalPages: null,
      totalRecords: null
    },

    parseRecords: function(resp){
      var embedded = resp._embedded;
      return embedded ? embedded.appointments : [];
    },

    parseState: function(resp) {
      var page = resp.page;
      return {
        currentPage: page.number,
        pageSize: page.size,
        totalPages: page.totalPages,
        totalRecords: page.totalElements
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

  Dionysus.reqres.setHandler("appointments:search:pageable", function(searchMethod, criteria){
    if(!criteria) criteria={};

    var resources = new AppointmentPageableCollection({
      searchMethod : searchMethod,
      criteria:criteria
    }),
      defer = $.Deferred();

    resources.fetch().then(function() {
      defer.resolve(resources);
    });

    return defer.promise();
    
  });

});

