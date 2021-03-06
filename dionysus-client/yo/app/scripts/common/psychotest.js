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
  
  Entities.PsychoTestUserCollection = Backbone.Model.extend({
    model: Entities.User,
    url: '/api/v1/psychtestresults',
	initialize : function(options){
      if(options && options.appendUrl){
        this.url += options.appendUrl;
      }
    }
  });

  var PsychTestResultPageCollection = Backbone.PageableCollection.extend({
    url: '/controllers/psychtestresults',
    model: Entities.PsychoTest,
    state: {
      firstPage : 0,
      currentPage: 0, 
      pageSize:50
    },
    queryParams: {
      currentPage: "page",
      pageSize: "size",
      totalPages: null,
      totalRecords: null
    },

    parseRecords: function(resp){
      return resp.content;
    },

    parseState: function(resp) {
      return {
        currentPage: resp.number,
        pageSize: resp.size,
        totalPages: resp.totalPages,
        totalRecords: resp.totalElements
      }
    }

  });

  var PsychTestResultDto = Backbone.Model.extend({
    urlRoot: '/controllers/psychtestresults'
  });

  var PsychTestAnswer = Backbone.Model.extend({
    urlRoot:'/api/v1/psychtestanswers'
  });

  var PsychoTestAnswerCollection = Backbone.Collection.extend({
    url: '/api/v1/psychtestanswers',
    model: PsychTestAnswer,
    initialize : function(options){
      if(options && options.appendUrl){
        this.url += options.appendUrl;
      }
    },
    parse: function(response) {
      var embedded = response._embedded;
      return embedded ? embedded.psychtestanswers : [];
    },
  });

  var PsychoTestEvaluationResult = Backbone.Model.extend({
    urlRoot: '/controllers/psychtestresults/calcu/'
  });

  var PsychoTestDetailDto = Backbone.Model.extend({
    urlRoot: '/controllers/psychtest'
  });




  Dionysus.reqres.setHandler('psychotest:dto:detail', function(id){
    var test = new PsychoTestDetailDto({id:id});
    var defer = $.Deferred();

    test.fetch().done(function(){
      defer.resolve(test);
    });

    return defer.promise();

  });

  Dionysus.reqres.setHandler('psychtestresult:evaluate', function(id){
    var result = new PsychoTestEvaluationResult({id:id});
    var defer = $.Deferred();
    result.fetch().done(function(){
      defer.resolve(result);
    });
    return defer.promise();
  });

  Dionysus.reqres.setHandler('psychtestresult:dto:instance', function(id){
    var result = new PsychTestResultDto({id:id});
    var defer = $.Deferred();
    result.fetch().done(function(){
      defer.resolve(result);
    });
    return defer.promise();
  });

  Dionysus.reqres.setHandler('psychtestanswers:by:result', function(rid){
    var appendUrl = '/search/findByResult?result='+rid;
    var psychtestanswers = new PsychoTestAnswerCollection({appendUrl:appendUrl});
    var defer = $.Deferred();

    psychtestanswers.fetch().then(function(){
      defer.resolve(psychtestanswers);
    });
    return defer.promise();
  });

  Dionysus.reqres.setHandler('psychtestresult:all:pageable', function(){
    var psychTestResults = new PsychTestResultPageCollection(), defer = $.Deferred();
    psychTestResults.fetch().then(function(){
      defer.resolve(psychTestResults);
    });
    return defer.promise();
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
  
  Dionysus.reqres.setHandler('psychotest:finduser', function(id) {
    var user = new Entities.PsychoTestUserCollection({appendUrl: '/' + id + '/createdBy'});
    var defer = $.Deferred();
    user.fetch().then(function() {
      defer.resolve(user);
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
  
  Dionysus.reqres.setHandler('psychotest:findallByUser', function(id) {
    var psychotests = new Entities.PsychoTestCollection({appendUrl: '/search/findAll'});
    var defer = $.Deferred();
    psychotests.fetch().then(function() {
      defer.resolve(psychotests);
    });
    return defer.promise();
  });
  
  Dionysus.reqres.setHandler('psychotest:instances', function() {
    var psychotests = new Entities.PsychoTestCollection({appendUrl: '?projection=summary'});
    var defer = $.Deferred();
    psychotests.fetch().then(function() {
      defer.resolve(psychotests);
    });
    return defer.promise();
  });

});

