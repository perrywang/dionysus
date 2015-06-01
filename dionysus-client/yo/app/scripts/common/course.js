Dionysus.module('Entities', function (Entities, Dionysus, Backbone, Marionette, $) {
  'use strict';

  var Course = Backbone.Model.extend({
    url: function () {
      return this.id ? '/controllers/courses/' + this.id : '/controllers/courses';
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
    url: '/controllers/courses',
    model: Course,
    parse: function (response) {
      return response.content;
    }
  });

  var PageCourseModel = Backbone.Model.extend({
    url :function(){
      return '/controllers/courses?page='+this.page;
    },
    initialize : function(page){
      this.page = page;
    }
  });

  var CourseCategory = Backbone.Model.extend({
    url: function () {
      return this.id ? '/controllers/courses/categories/' + this.id : '/controllers/courses/categories';
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
    url: '/controllers/courses/categories',
    model: CourseCategory
  });

  var CourseConsultant = Backbone.Model.extend({
    url: function () {
      return this.id ? '/controllers/courses/consultants/' + this.id : '/controllers/courses/consultants';
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
    url: '/controllers/courses/consultants',
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
    resources.url = '/controllers/courses/categories/tree';
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
});

