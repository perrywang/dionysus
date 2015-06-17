Dionysus.module('Course', function(Article, Dionysus, Backbone, Marionette){

  var baseTemplatePath = 'templates/home/course';

  var Layout = Marionette.LayoutView.extend({
    template:JST[baseTemplatePath+'/home'],
    regions: {
      first: '#first',
      second: '#second'
    }});

  var firstPage = Marionette.ItemView.extend({
    initialize: function(options){
      this.categories = options.categories;
      this.approach = options.approach;
      this.courses = options.courses;
    },

    template:function(data){
      var template = JST[baseTemplatePath+'/first'];
      var html = template(data);
      var wrapper = $(html);
      _.each(this.categories, function(category){
        var topCat = '<div>'
      });
    },

    serializeData: function(){

    }

  });


  var CourseController = Marionette.Controller.extend({
    showCourseHome: function(){

    }
  });
  Dionysus.addInitializer(function () {
    new Marionette.AppRouter({
      appRoutes: {
        'courses(/)': 'showCourseHome'
      },
      controller: new CourseController()
    });
  });
});