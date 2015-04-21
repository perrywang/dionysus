Dionysus.module('AdminCourse', function (Course, Dionysus, Backbone, Marionette, $) {
  'use strict';

  var CourseEditorView = Marionette.ItemView.extend({
    template: '#admin-course-editor-tpl',
    className: 'ui segment',
    initialize: function(options) {
      this.categories = options.categories;
      this.consultants = options.consultants;
    },
    serializeData: function(){
      var data = this.model.toJSON();
      data.categories = this.categories.toSelection();
      data.consultants = this.consultants.toSelection();
      return data;
    },
    onRender: function() {
      this.$('[name="category"]').dropdown();
      this.$('[name="state"]').dropdown();
      this.$('[name="consultant"]').dropdown();
      this.$('[name="approach"]').dropdown();
      var data = this.model.toJSON();
      this.$('ui.form').form('set values', data);
    },
    ui : {
      save : '.button.submit'
    },
    events: {
      'click @ui.save' : 'saveCourse'
    },
    saveCourse: function() {
      var json = this.$el.form('get values');
      this.trigger('course:save', json);
    }
  });

  var CourseController = Marionette.Controller.extend({

    createCourse: function() {
      var course = Dionysus.request('course:new');
      $.when(Dionysus.request('course:categories'),Dionysus.request('consultant:entities')).done(function(categories,consultants){
        console.log(consultants.toSelection());
        var editor = new CourseEditorView({model:course,categories:categories,consultants: consultants});
        editor.on('course:save', function(json) {
          course.save(json).then(function() {
            console.log('course has been saved');
          });
        });
        Dionysus.mainRegion.show(editor);

      });
    }
  });


  Dionysus.addInitializer(function() {
    new Marionette.AppRouter({
      appRoutes : {
        'admin/courses/create(/)': 'createCourse'
      },
      controller: new CourseController()
    });
  });

});
