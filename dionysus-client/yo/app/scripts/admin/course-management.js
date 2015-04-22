Dionysus.module('AdminCourse', function (Course, Dionysus, Backbone, Marionette, $) {
  'use strict';

  var CourseEditorView = Marionette.ItemView.extend({
    template: '#admin-course-editor-tpl',
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
      this.$('#videoPart').hide();
      this.$('[name="approach"]').dropdown();
      this.$('[name="approach"]').change(function(eventObject){
        eventObject.target.value === 'VIDEO' ? $('#videoPart').show():$('#videoPart').hide()
      });
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
        console.log(categories.toSelection());
        var editor = new CourseEditorView({model:course,categories:categories,consultants: consultants});
        editor.on('course:save', function(json) {
          course.save(json, {
            success: function(model, response, options){
              console.log(model);
              console.log(response);
              console.log(options);
            },
            error: function(model, response, options){
              console.log(model);
              console.log(response);
              console.log(options);
          }});
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
