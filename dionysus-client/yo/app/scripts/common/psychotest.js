Dionysus.module('PsychoTest', function(Entities, Dionysus, Backbone, Marionette, $) {
  'use strict';

  Entities.PsychoTest = Backbone.Model.extend({
    urlRoot: '/api/v1/psychtestresults'
  });

  Entities.PsychoTestCollection = Backbone.Collection.extend({
    model: Entities.PsychoTest,
    url: '/api/v1/psychtestresults',
    parse: function(response) {
      var embedded = response._embedded;
      return embedded ? embedded.psychtestresults : [];
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
  
  Dionysus.reqres.setHandler('psychotest:entities', function() {
    var psychotests = new Entities.PsychoTestCollection();
    var defer = $.Deferred();
    psychotests.fetch().then(function() {
      defer.resolve(psychotests);
    });
    return defer.promise();
  });

  Dionysus.reqres.setHandler('psychotest:entity', function(id) {
    var psychotest = new Entities.PsychoTest({id: id});
    var defer = $.Deferred();
    psychotest.fetch().then(function() {
      defer.resolve(psychotest);
    });
    return defer.promise();
  });
  
  Dionysus.reqres.setHandler('psychotest:findByUser', function(id) {
    var psychotests = new Entities.PsychoProfileCollection({appendUrl: '/' + id + '/items'});
    var defer = $.Deferred();
    psychotests.fetch().then(function() {
      defer.resolve(psychotests);
    });
    return defer.promise();
  });

});

