Dionysus.module('Entities', function(Entities, Dionysus, Backbone, Marionette, $) {
  'use strict';

  Entities.User = Backbone.Model.extend({
    urlRoot: '/api/v1/users'
  });

  Entities.UserCollection = Backbone.Collection.extend({
    model: Entities.User,
    url: '/api/v1/users',
    parse: function(response) {
      var embedded = response._embedded;
      return embedded ? embedded.users : [];
    },
    state: {
      firstPage: 0
    },
    queryParams: {
      currentPage: 'page',
      pageSize: 'size'
    }
  });
  
  Entities.UserCourseCollection = Backbone.Collection.extend({
    model: Entities.User,
    url: '/api/v1/users',
    parse: function(response) {
      var embedded = response._embedded;
      return embedded ? embedded.users : [];
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

  Dionysus.reqres.setHandler('user:entities', function() {
    var users = new Entities.UserCollection();
    var defer = $.Deferred();
    users.fetch().then(function() {
      defer.resolve(users);
    });
    return defer.promise();
  });

  Dionysus.reqres.setHandler('user:entity', function(id) {
    var user = new Entities.User({id: id});
    var defer = $.Deferred();
    user.fetch().then(function() {
      defer.resolve(user);
    });
    return defer.promise();
  });

});

