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
      this.$('#category').dropdown();
      this.$('#consultant').dropdown();
      this.$('#style').dropdown();
      this.$('#videoPart').hide();
      var data = this.model.toJSON();
      this.$('ui.form').form('set values', data);
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
      var Course = Dionysus.request('course:new');
      $.when(Dionysus.request('course:categories'),Dionysus.request('consultant:entities')).done(function(categories,consultants){
        console.log(consultants.toSelection());
        var editor = new CourseEditorView({model:Course,categories:categories,consultants: consultants});

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
