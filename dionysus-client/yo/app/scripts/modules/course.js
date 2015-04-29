Dionysus.module('Course', function(Course, Dionysus, Backbone, Marionette) {
  'use strict';
  
  var CourseView = Marionette.ItemView.extend({ 
    template: '#course-list-item-tpl',
    className: 'item'
  });

  var CoursesView = Marionette.CollectionView.extend({
    childView: CourseView,
    className: 'ui divided items'
  });

  var CourseController = Marionette.Controller.extend({
    showCourses: function () {
      var fetchingCourses = Dionysus.request('course:entities');
      $.when(fetchingCourses).done(function(courses) {
        Dionysus.mainRegion.show(new CoursesView({ collection: courses }));
      });
    },
    showCourse: function(id) {
      var courseFetching = Dionysus.request('course:entity', id);
      $.when(courseFetching).done(function(course) {
        Dionysus.mainRegion.show(new CourseView({ model: course}));
      });
    },
    showCoursesByUser: function(userid){
      var userFetchingcourses = Dionysus.request('course:bookedby', userid);
      $.when(userFetchingcourses).done(function(courses) {
        Dionysus.mainRegion.show(new CoursesView({ collection: courses}));
      });
    }
  });

  Dionysus.addInitializer(function() {
    new Marionette.AppRouter({
      appRoutes : {
        'courses(/)': 'showCourses',
        'courses/:id(/)': 'showCourse',
        'courses/bookedBy/:id' : 'showCoursesByUser'
      },
      controller: new CourseController()
    });
  });
});
