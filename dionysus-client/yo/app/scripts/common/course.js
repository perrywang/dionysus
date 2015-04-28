Dionysus.module('Entities', function(Entities, Dionysus, Backbone, Marionette, $) {
  'use strict';

  var Course = Backbone.RelationalHalResource.extend({
    url: function(){
      return this.id ? '/api/v1/courses/' + this.id : '/api/v1/courses';
    },
    isNew: function(){
      return this.id == null || this.id == undefined;
    },
    initialize: function(options){
      if(options && options.id){
        this.id = options.id;
      }
    },
    getCategory: function(){
      var category = new Backbone.Model();
      category.url = this.link('category').get('href');
      var defer = $.Deferred();
      category.fetch({
        error: function(){
          category.set('name','');
          defer.resolve(category);
        }
      }).then(function(){
        defer.resolve(category);
      });
      return defer.promise(category);
    },
    getConsultant: function(){
      var consultant = new Backbone.Model();
      consultant.url = this.link('consultant').get('href');
      var defer = $.Deferred();
      consultant.fetch({
        error: function(){
          consultant.set('username','');
          defer.resolve(consultant);
        }
      }).then(function(){
        defer.resolve(consultant);
      });
      return defer.promise(consultant);
    }
  });

  var CourseCollection = Backbone.RelationalHalResource.extend({
    url: '/api/v1/courses',
    halEmbedded: {
      courses: {
        type: Backbone.HasMany,
        relatedModel: Course
      }
    }
  });

  var CourseCategory = Backbone.RelationalHalResource.extend({
    url: '/api/v1/courseCategories'

  });

  var CourseCategoryCollection = Backbone.RelationalHalResource.extend({
    url: '/api/v1/courseCategories',
    halEmbedded: {
      courseCategories: {
        type: Backbone.HasMany,
        relatedModel: CourseCategory
      }
    },
    toSelection : function() {
      var categories = this.embedded('courseCategories');
      return categories.map(function(category) {
        return {
          name : category.get('name'),
          link : category.link('self').href()
        }
      });
    }
  });

  Dionysus.reqres.setHandler('course:entity', function(id) {

    var course = Course.find({id:id});
    if(course == null){
      course = new Course({id:id});
      var defer = $.Deferred();
       course.fetch().then(function() {
       defer.resolve(course);
       });
       return defer.promise();
    }
    return course;
  });

  Dionysus.reqres.setHandler('course:entities', function(id) {
    var courses = new CourseCollection();
    var defer = $.Deferred();
    courses.fetch().then(function() {
      defer.resolve(courses);
    });
    return defer.promise();
  });

  Dionysus.reqres.setHandler('course:new', function() {
    return new Course();
  });

  Dionysus.reqres.setHandler('course:category', function(id) {
    var category = new CourseCategory(id);
    var defer = $.Deferred();
    category.fetch().then(function() {
      defer.resolve(category);
    });
    return defer.promise();
  });

  Dionysus.reqres.setHandler('course:categories', function() {
    var resources = new CourseCategoryCollection(), defer = $.Deferred();
    resources.fetch().then(function() {
      defer.resolve(resources);
    });
    return defer.promise();
  });

  Dionysus.reqres.setHandler('course:bookedby', function(userid) {
    var courses = new Entities.UserCourseCollection({appendUrl:'/' + userid + '/courses'});
    var defer = $.Deferred();
    courses.fetch().then(function() {
      defer.resolve(courses);
    });
    return defer.promise();
  });
});

