Dionysus.module('Entities', function(Entities, Dionysus, Backbone, Marionette, $) {
  'use strict';

  var Course = Backbone.RelationalHalResource.extend({
    url: '/api/v1/courses'
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
    var course = new Course(id);
    var defer = $.Deferred();
    course.fetch().then(function() {
      defer.resolve(course);
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

