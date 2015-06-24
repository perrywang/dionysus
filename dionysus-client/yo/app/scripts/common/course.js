Dionysus.module('Entities', function (Entities, Dionysus, Backbone, Marionette, $) {
  'use strict';

  var baseUrl = '/controllers/courses';
  var Course = Backbone.Model.extend({
    url: function () {
      return this.id ? baseUrl+ '/' + this.id : '/controllers/courses';
    },
    isNew: function () {
      return this.id == null || this.id == undefined;
    },
    initialize: function (options) {
      if (options && options.id) {
        this.id = options.id;
      }
    }
  });

  var CourseCollection = Backbone.Collection.extend({
    url: baseUrl,
    model: Course,
    parse: function (response) {
      return response.content;
    }
  });

  var PageCourseModel = Backbone.Model.extend({
    url :function(){
      return baseUrl+'?page='+this.page;
    },
    initialize : function(page){
      this.page = page;
    }
  });

  var CourseCategory = Backbone.Model.extend({
    url: function () {
      return this.id ? baseUrl+'/categories/' + this.id : baseUrl+'/categories';
    },
    isNew: function () {
      return this.id == null || this.id == undefined;
    },
    initialize: function (options) {
      if (options && options.id) {
        this.id = options.id;
      }
    }
  });

  var CourseCategoryCollection = Backbone.Collection.extend({
    url: baseUrl+'/categories',
    model: CourseCategory
  });

  var CourseConsultant = Backbone.Model.extend({
    url: function () {
      return this.id ? baseUrl+'/consultants/' + this.id : baseUrl+'/consultants';
    },
    isNew: function () {
      return this.id == null || this.id == undefined;
    },
    initialize: function (options) {
      if (options && options.id) {
        this.id = options.id;
      }
    }
  });

  var CourseConsultantCollection = Backbone.Collection.extend({
    url: baseUrl+'/consultants',
    model: CourseConsultant
  });

  Dionysus.reqres.setHandler('course:entity', function (id) {
    var course = new Course({id: id});
    var defer = $.Deferred();
    course.fetch().then(function () {
      defer.resolve(course);
    });
    return defer.promise();
  });

  Dionysus.reqres.setHandler('course:entities', function (page) {

    var courses = new PageCourseModel(page - 1);
    var defer = $.Deferred();
    courses.fetch().then(function () {
      defer.resolve(courses);
    });
    return defer.promise();
  });

  Dionysus.reqres.setHandler('course:new', function () {
    return new Course();
  });

  Dionysus.reqres.setHandler('course:category:new', function () {
    return new CourseCategory();
  });

  Dionysus.reqres.setHandler('course:categories', function () {
    var resources = new CourseCategoryCollection(), defer = $.Deferred();
    resources.fetch().then(function () {
      defer.resolve(resources);
    });
    return defer.promise();
  });

  Dionysus.reqres.setHandler('course:categories:tree', function () {
    var resources = new CourseCategoryCollection();
    resources.url = baseUrl+'/categories/tree';
    var defer = $.Deferred();
    resources.fetch().then(function () {
      defer.resolve(resources);
    });
    return defer.promise();
  });

  Dionysus.reqres.setHandler('course:category', function (id) {
    var resource = new CourseCategory({id : id}), defer = $.Deferred();
    resource.fetch().then(function () {
      defer.resolve(resource);
    });
    return defer.promise();
  });

  Dionysus.reqres.setHandler('course:consultants', function () {
    var resources = new CourseConsultantCollection(), defer = $.Deferred();
    resources.fetch().then(function () {
      defer.resolve(resources);
    });
    return defer.promise();
  });

  Dionysus.reqres.setHandler('course:bookedby', function (userid) {
    var courses = new Entities.UserCourseCollection({appendUrl: '/' + userid + '/courses'});
    var defer = $.Deferred();
    courses.fetch().then(function () {
      defer.resolve(courses);
    });
    return defer.promise();
  });

  Dionysus.reqres.setHandler('course:home:categories',function(){
    var categories = $.Deferred();
    $.getJSON(baseUrl+"/categories/tree").done(function(data){
      categories.resolve(data);
    });
    return categories.promise();
  });

  Dionysus.reqres.setHandler('course:home:videos',function(cid,page){
    var courses = $.Deferred();
    if(page == undefined){
      page = 0;
    }
    $.getJSON(baseUrl+"/category/"+cid+"?approach=VIDEO&page="+page+"&size=6").done(function(data){
      courses.resolve(data);
    });
    return courses.promise();
  });



  Dionysus.reqres.setHandler('course:home:room',function(cid,page){
    var courses = $.Deferred();
    if(page == undefined){
      page = 0;
    }
    $.getJSON(baseUrl+"/category/"+cid+"?approach=ONE2MANY&page="+page+"&size=4").done(function(data){
      courses.resolve(data);
    });
    return courses.promise();
  });

  Dionysus.reqres.setHandler('course:home:offline',function(cid,page){
    var courses = $.Deferred();
    if(page == undefined){
      page = 0;
    }
    $.getJSON(baseUrl+"/category/"+cid+"?approach=OFFLINE&page="+page+"&size=4").done(function(data){
      courses.resolve(data);
    });
    return courses.promise();
  });

  Dionysus.reqres.setHandler('course:home:search',function(cid,approach,options){
    var courses = $.Deferred();
    var page = options.page || 0;
    var size = options.size || 6;
    $.getJSON(baseUrl+"/category/" + cid + "?approach=" + approach + "&page="+page+"&size=" + size).done(function(data){
      courses.resolve(data);
    });
    return courses.promise();
  });

  Dionysus.reqres.setHandler('course:home:slider',function(){
    var courses = $.Deferred();
    $.getJSON(baseUrl+"/slider").done(function(data){
      courses.resolve(data);
    });
    return courses.promise();
  });

  Dionysus.reqres.setHandler('course:home:feedback',function(id){
    var feedbacks = $.Deferred();
    $.getJSON(baseUrl+ "/" + id + "/feedbacks").done(function(data){
      feedbacks.resolve(data);
    });
    return feedbacks.promise();
  });

  Dionysus.reqres.setHandler('course:home:detail',function(id){
    var course = $.Deferred();
    $.getJSON(baseUrl+ "/" + id).done(function(data){
      course.resolve(data);
    });
    return course.promise();
  });

  Dionysus.reqres.setHandler('course:home:detail:courses',function(){
    var courses = $.Deferred();
    $.getJSON(baseUrl+ "/top?N=6").done(function(data){
      courses.resolve(data);
    });
    return courses.promise();
  });

  Dionysus.reqres.setHandler('course:home:detail:comments',function(id){
    var feedbacks = $.Deferred();
    $.getJSON(baseUrl+ "/" + id + "/feedbacks").done(function(data){
      feedbacks.resolve(data);
    });
    return feedbacks.promise();
  });




});

