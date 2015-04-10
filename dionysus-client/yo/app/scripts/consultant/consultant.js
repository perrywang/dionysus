Dionysus.module('Entities', function(Entities, Dionysus, Backbone, Marionette, $) {
  'use strict';

  Entities.Consultant = Backbone.Model.extend({
    urlRoot: '/api/v1/consultants',
  });


  Entities.ConsultantCollection = Backbone.Collection.extend({
    model: Entities.Consultant,
    url: '/api/v1/consultants',
    parse: function(response) {
      var embedded = response._embedded;
      return embedded ? embedded.consultants : [];
    },
    state: {
      firstPage: 0
    },
    queryParams: {
      currentPage: 'page',
      pageSize: 'size'
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

  Dionysus.reqres.setHandler('consultant:entity', function(id) {
    var consultant = new Entities.Consultant({id: id});
    var defer = $.Deferred();
    consultant.fetch().then(function() {
      defer.resolve(consultant);
    });
    return defer.promise();
  });

});

