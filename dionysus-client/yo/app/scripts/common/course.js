Dionysus.module('Entities', function(Entities, Dionysus, Backbone, Marionette, $) {
  'use strict';

  var Course = Backbone.RelationalHalResource.extend({
    url: function(){
      return this.id ? '/api/v1/courses/' + this.id : '/api/v1/courses';
    },
    initialize: function(options){
      if(options && options.id){
        this.id = options.id;
      }
    },
    getCategory: function(){
      var category = new CourseCategory();
      category.url = this.link('category').get('href');
      var defer = $.Deferred();
      category.fetch().then(function(){
        defer.resolve(category);
      });
      return defer.promise(category);
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
    var course = new Course({id:id});
    var defer = $.Deferred();
    course.fetch().then(function() {
      defer.resolve(course);
    });
    return defer.promise();
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

});

