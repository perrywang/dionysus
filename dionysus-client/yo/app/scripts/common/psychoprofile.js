Dionysus.module('Entities', function(Entities, Dionysus, Backbone, Marionette, $) {
  'use strict';

  Entities.PsychoProfile = Backbone.Model.extend({
    urlRoot: '/api/v1/profiles'
  });

  Entities.PsychoProfileCollection = Backbone.Collection.extend({
    model: Entities.PsychoProfile,
    url: '/api/v1/profiles',
    parse: function(response) {
      var embedded = response._embedded;
      return embedded ? embedded.users : [];
    },
	initialize : function(options){
      if(options && options.appendUrl){
        this.url += options.appendUrl;
      }
    }
    state: {
      firstPage: 0
    },
    queryParams: {
      currentPage: 'page',
      pageSize: 'size'
    }
  });

  Dionysus.reqres.setHandler('psychoprofile:entities', function() {
    var profiles = new Entities.PsychoProfileCollection();
    var defer = $.Deferred();
    profiles.fetch().then(function() {
      defer.resolve(profiles);
    });
    return defer.promise();
  });

  Dionysus.reqres.setHandler('psychoprofile:entity', function(id) {
    var profile = new Entities.PsychoProfile({id: id});
    var defer = $.Deferred();
    profile.fetch().then(function() {
      defer.resolve(profile);
    });
    return defer.promise();
  });
  
  Dionysus.reqres.setHandler('psychoprofile:findbyUser', function(id) {
    var profiles = new Entities.PsychoProfileCollection({appendUrl:id});
    var defer = $.Deferred();
    profiles.fetch().then(function() {
      defer.resolve(profiles);
    });
    return defer.promise();
  });

});

