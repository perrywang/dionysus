Dionysus.module('Entities', function(Entities, Dionysus, Backbone, Marionette, $) {
  'use strict';

  Entities.Course = Backbone.Model.extend({
    urlRoot: '/api/v1/courses'
  });

  Entities.CourseCollection = Backbone.Collection.extend({
    model: Entities.Course,
    url: '/api/v1/courses',
    parse: function(response) {
      var embedded = response._embedded;
      return embedded ? embedded.courses : [];
    }
  });

  Dionysus.reqres.setHandler('course:entities', function() {
    var courses = new Entities.CourseCollection();
    var defer = $.Deferred();
    courses.fetch().then(function() {
      defer.resolve(courses);
    });
    return defer.promise();
  });

  Dionysus.reqres.setHandler('course:entity', function(id) {
    var course = new Entities.Course({id: id});
    var defer = $.Deferred();
    course.fetch().then(function() {
      defer.resolve(course);
    });
    return defer.promise();
  });

  Dionysus.reqres.setHandler('course:new', function() {
    return new Entities.Course();
  });
});

