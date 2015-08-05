Dionysus.module('Entities', function(Entities, Dionysus, Backbone, Marionette, $) {
  'use strict';

  var baseUrl = '/api/v1/organizations';

  Dionysus.reqres.setHandler('organization:entities', function(options) {
    var options = options || {page:0,size:6,status:'APPROVED'};
    var page = options.page || 0;
    var size = options.size || 6;
    var status = options.status || 'APPROVED';
    var organizations = $.Deferred();
    $.getJSON(baseUrl+"/search/findByStatus?status=" + status + "&page=" + page + "&size=" + size).done(function(data){
      organizations.resolve(data._embedded.organizations);
    });
    return organizations.promise();
  });

  Dionysus.reqres.setHandler('organization:entity', function(id) {
    var organization = $.Deferred();
    $.getJSON(baseUrl+"/"+id+"?projection=detailOfOrganization").done(function(data){
      organizations.resolve(data);
    });
    return organization.promise();
  });

});

