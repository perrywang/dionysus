Dionysus.module('Entities', function(Entities, Dionysus, Backbone, Marionette, $) {
  'use strict';

  Entities.Consultant = Backbone.RelationalHalResource.extend({
    url: '/api/v1/consultants'
  });

  Entities.ConsultantSelection = Backbone.Model.extend({
    urlRoot: '/api/v1/consultants'
  });
  
  Entities.ConsultantCollection = Backbone.RelationalHalResource.extend({
    url: '/api/v1/consultants',
    halEmbedded: {
      consultants: {
        type: Backbone.HasMany,
        relatedModel: Entities.Consultant
      }
    },
    toSelection : function() {
      var consultants = this.embedded('consultants');
      return consultants.map(function(consultant) {
        return {
          username : consultant.get('username'),
          link : consultant.link('self').href()
        }
      });
    }
  });

  Entities.ConsultantSelectionCollection = Backbone.Collection.extend({
    model: Entities.ConsultantSelection,
    url: '/api/v1/consultants',
    parse: function(response) {
      var embedded = response._embedded;
      return embedded ? embedded.consultants : [];
    },

    initialize : function(options){
      if(options && options.appendUrl){
        this.url += options.appendUrl;
      }
    }
  });


  /*

  Consultant Home Page Used Entity, Can Be Used in Other Places as Well.

  */

  Entities.ExpertiseCollection = Backbone.Collection.extend({
    url: '/api/v1/consExpertises',
    model: Backbone.Model,
    parse: function(response) {
      var embedded = response._embedded;
      return embedded ? embedded.consExpertises : [];
    }
  });

  Entities.AppointmentSelectionCollection = Backbone.Collection.extend({
    url: '/api/v1/consultants',
    model: Entities.Appointment,
    parse: function(response) {
      var embedded = response._embedded;
      return embedded ? embedded.appointments : [];
    },	
	initialize : function(options){
      if(options && options.appendUrl){
        this.url += options.appendUrl;
      }
    }
  });
  
  Entities.ConsultantModel = Backbone.Model.extend({
    url: '/api/v1/consultants',
    initialize: function(options){
      if(options && options.id) this.url = this.url + "/" + options.id;
    }
  });

  Entities.ConsultantPageableCollection = Backbone.PageableCollection.extend({
    url: '/api/v1/consultants',

    initialize: function(options){
      if(options && options.searchMethod) this.url += '/search/'+options.searchMethod;
      _.extend(this.queryParams, options.criteria);
    },

    model: Entities.ConsultantModel,
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
      return embedded ? embedded.consultants : [];
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

  Dionysus.reqres.setHandler("consultant:detail", function(id) {
    var consultant = new Entities.ConsultantModel({
        id: id
      }),
      defer = $.Deferred();
    consultant.fetch({
      data: {
        projection: "excerpt"
      }
    }).then(function() {
      defer.resolve(consultant);
    });
    return defer.promise();
  });

  Dionysus.reqres.setHandler('consultant:expertises', function() {
    var resources = new Entities.ExpertiseCollection(),
      defer = $.Deferred();
    resources.fetch().then(function() {
      defer.resolve(resources);
    });
    return defer.promise();

  });

  Dionysus.reqres.setHandler('consultant:search:pageable', function(searchMethod, criteria){
    
    if(!criteria) criteria={};

    var resources = new Entities.ConsultantPageableCollection({
      searchMethod : searchMethod,
      criteria:criteria
    }),
      defer = $.Deferred();

    resources.fetch().then(function() {
      defer.resolve(resources);
    });

    return defer.promise();
  });

  Dionysus.reqres.setHandler('consultant:entities', function() {
    var consultants = new Entities.ConsultantCollection();
    var defer = $.Deferred();
    consultants.fetch().then(function() {
      defer.resolve(consultants);
    });
    return defer.promise();
  });
  
  Dionysus.reqres.setHandler('consultant:finddisabled', function() {
    var consultants = new Entities.ConsultantSelectionCollection({appendUrl:'/search/findConsultantsDisabled'});
    var defer = $.Deferred();
    consultants.fetch().then(function() {
      defer.resolve(consultants);
    });
    return defer.promise();
  });
  
  Dionysus.reqres.setHandler('consultant:findappointment', function(id) {
    var appointments = new Entities.AppointmentSelectionCollection({appendUrl:'/' + id +'/appointments'});
    var defer = $.Deferred();
    appointments.fetch().then(function() {
      defer.resolve(appointments);
    });
    return defer.promise();
  });
  
  Dionysus.reqres.setHandler('consultant:simplelist', function() {
    var consultants = new Entities.ConsultantSelectionCollection({appendUrl:'/'});
    var defer = $.Deferred();
    consultants.fetch().then(function() {
      defer.resolve(consultants);
    });
    return defer.promise();
  });
  
  Dionysus.reqres.setHandler('consultant:entity', function(id) {
    var consultant = new Entities.ConsultantSelection({id: id});
    var defer = $.Deferred();
    consultant.fetch().then(function() {
      defer.resolve(consultant);
    });
    return defer.promise();
  });
});
