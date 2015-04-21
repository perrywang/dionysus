Dionysus.module('Entities', function(Entities, Dionysus, Backbone, Marionette, $) {
  'use strict';

  Entities.Course = Backbone.RelationalHalResource.extend({
    url: '/api/v1/courses'
  });

  Entities.CourseCategory = Backbone.RelationalHalResource.extend({
    url: '/api/v1/courseCategories'
  });

  Entities.CourseCategoryCollection = Backbone.RelationalHalResource.extend({
    url: '/api/v1/courseCategories',
    halEmbedded: {
      courseCategories: {
        type: Backbone.HasMany,
        relatedModel: Entities.CourseCategory
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
    var course = new Entities.Course(id);
    var defer = $.Deferred();
    course.fetch().then(function() {
      defer.resolve(course);
    });
    return defer.promise();
  });

  Dionysus.reqres.setHandler('course:new', function() {
    return new Entities.Course();
  });

  Dionysus.reqres.setHandler('course:category', function(id) {
    var category = new Entities.CourseCategory(id);
    var defer = $.Deferred();
    category.fetch().then(function() {
      defer.resolve(category);
    });
    return defer.promise();
  });

  Dionysus.reqres.setHandler('course:categories', function() {
    var categories = new Entities.CourseCategoryCollection();
    var defer = $.Deferred();
    categories.fetch().then(function() {
      defer.resolve(categories);
    });
    return defer.promise();
  });

});

