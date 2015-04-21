Dionysus.module('Entities', function(Entities, Dionysus, Backbone, Marionette, $) {
  'use strict';

  Entities.Consultant = Backbone.RelationalHalResource.extend({
    url: '/api/v1/consultants'
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

  Dionysus.reqres.setHandler('consultant:entities', function() {
    var consultants = new Entities.ConsultantCollection();
    var defer = $.Deferred();
    consultants.fetch().then(function() {
      defer.resolve(consultants);
    });
    return defer.promise();
  });

});
