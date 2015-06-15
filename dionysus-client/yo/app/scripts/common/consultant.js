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
});
