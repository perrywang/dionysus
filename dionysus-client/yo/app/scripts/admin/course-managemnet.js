Dionysus.module('AdminCourse', function (Course, Dionysus, Backbone, Marionette, $) {
  'use strict';

  var CourseEditorView = Marionette.ItemView.extend({
    template: '#admin-course-editor-tpl',
    tagName: 'form',
    className: 'ui form',
    initialize: function(options) {
      this.couseCategories = options.couseCategories;
      this.consultants = options.consultants;
    },
    serializeData: function(){
      var data = this.model.toJSON();
      data.couseCategories = this.couseCategories;
      return data;
    },
    onRender: function() {

      var data = this.model.toJSON();
      this.$el.form('set values', data);

      this.$('.editor').editable({
        inlineMode: false,
        language: 'zh_cn',
        imageUploadURL: '/api/v1/upload',
        fileUploadURL: '/api/v1/upload'
      });
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
