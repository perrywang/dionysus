Dionysus.module('AdminCourse', function (Course, Dionysus, Backbone, Marionette, $) {
  'use strict';

  var validationRules = {
    title: {
      identifier : 'title',
      rules: [{ type : 'empty', prompt  : '课程名称不能为空' }]
    },
    capacity:{
      identifier : 'capacity',
      rules: [{ type : 'integer', prompt  : '人数限制必须输入整数' }]
    }
  };

  var empty2null = function(input){
    return (input === '') ? null : input;
  };

  var string2Integer = function(input){
    var number = parseInt(input);
    return isNaN(number) ? null : number;
  };

  var courseTransformRules = {
    category : empty2null,
    consultant : empty2null,
    approach : empty2null,
    capacity : string2Integer
  };

  var CourseItemView = Marionette.ItemView.extend({
    template: JST["templates/admin/courses/detail"],
    tagName: 'li',
    className: 'item'
  });

  var CourseCollectionView = Marionette.CompositeView.extend({
    template: JST["templates/admin/courses/courses"],
    childView: CourseItemView,
    childViewContainer: '.items'
  });

  var CourseEditorView = Marionette.ItemView.extend({
    template: JST["templates/admin/courses/editor"],
    initialize: function(options) {
      this.categories = options.categories;
      this.consultants = options.consultants;
    },
    serializeData: function(){
      var data = this.model.toJSON();
      data.categories = this.categories.toJSON();
      data.consultants = this.consultants.toJSON();
      return data;
    },
    onRender: function() {
      this.$('[name="category"]').dropdown();
      this.$('[name="state"]').dropdown();
      this.$('[name="consultant"]').dropdown();
      this.$('#courseTime').datetimepicker({lang:'zh',step:30});
      this.$('#videoPart').hide();
      this.$('#groupAddress').hide();
      this.$('[name="approach"]').dropdown();
      this.$('[name="approach"]').change(function(eventObject){
        var videoPart = $('#videoPart');
        var groupAddress = $('#groupAddress');
        eventObject.target.value === 'VIDEO' ? videoPart.show():videoPart.hide();
        eventObject.target.value === 'ONE2MANY' ? groupAddress.show():groupAddress.hide();

      });
      this.$el.form(validationRules);
      var data = this.model.toJSON();
      this.$el.form('set values', data);
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

  function transform(source, rules){
    var prop;
    for(prop in source){
      if(source.hasOwnProperty(prop) && rules[prop]){
        source[prop] = rules[prop](source[prop]);
      }
    }
  }

  var CourseController = Marionette.Controller.extend({

    createCourse: function() {
      var course = Dionysus.request('course:new');
      $.when(Dionysus.request('course:categories'),Dionysus.request('course:consultants')).done(function(categories,consultants){
        var editor = new CourseEditorView({model:course,categories:categories,consultants: consultants});
        editor.on('course:save', function(json) {
          transform(json,courseTransformRules);
          json.category = string2Integer(json.category);
          json.consultant = string2Integer(json.consultant);
          course.save(json, {
            error: function(model, response, options){
              console.log(response);
              console.log(options);
              toastr.error('课程保存失败');
          }}).done(function(){
            toastr.info('课程保存成功');
          });
        });
        Dionysus.mainRegion.show(editor);
      });
    },

    showCourses: function(){
      $.when(Dionysus.request('course:entities')).done(function(courses){
        Dionysus.mainRegion.show(new CourseCollectionView({ collection: courses }));
      });
    },

    editCourse: function(id){
      $.when(Dionysus.request('course:entity',id),Dionysus.request('course:categories'),Dionysus.request('course:consultants')).done(function(course,categories,consultants){
        var couseData = course.toJSON();
        course.set('category',couseData.category.name);
        course.set('consultant',couseData.consultant.username);
        var editor = new CourseEditorView({model:course,categories:categories,consultants: consultants});
        editor.on('course:save', function(json) {
          transform(json,courseTransformRules);
          json.category = {"id":string2Integer(json.category)};
          json.consultant = {"id":string2Integer(json.consultant)};
          course.save(json, {
            error: function(model, response, options){
              console.log(response);
              console.log(options);
              toastr.error('课程保存失败');
            }}).done(function(model, response, options){
            console.log(response);
            console.log(options);
            toastr.info('课程保存成功');
          });
        });
        Dionysus.mainRegion.show(editor);
      });
    }

  });

  Dionysus.addInitializer(function() {
    new Marionette.AppRouter({
      appRoutes : {
        'admin/courses/create(/)': 'createCourse',
        'admin/courses(/)':'showCourses',
        'admin/courses/:id(/)':'editCourse'
      },
      controller: new CourseController()
    });
  });

});
