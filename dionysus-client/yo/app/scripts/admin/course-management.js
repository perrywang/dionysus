Dionysus.module('AdminCourse', function (Course, Dionysus, Backbone, Marionette, $) {
  'use strict';

  var validationRules = {
    title: {
      identifier: 'title',
      rules: [{type: 'empty', prompt: '课程名称不能为空'}]
    },
    capacity: {
      identifier: 'capacity',
      rules: [{type: 'integer', prompt: '人数限制必须输入整数'}]
    },

    price: {
      identifier: 'price',
      rules: [{type: 'integer', prompt: '必须输入一个有效的价格'}]
    }

  };

  var empty2null = function (input) {
    return (input === '') ? null : input;
  };

  var string2Integer = function (input) {
    var number = parseInt(input);
    return isNaN(number) ? input : number;
  };

  var string2Float = function (input) {
    var number = parseFloat(input);
    return isNaN(number) ? input : number;
  };

  var courseTransformRules = {
    category: empty2null,
    consultant: empty2null,
    approach: empty2null,
    capacity: string2Integer,
    price: string2Float
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
    initialize: function (options) {
      this.categories = options.categories;
      this.consultants = options.consultants;
    },
    serializeData: function () {
      var data = this.model.toJSON();
      data.categories = this.categories.toJSON();
      data.consultants = this.consultants.toJSON();
      return data;
    },
    onRender: function () {
      var that= this;
      this.$('[name="state"]').dropdown();
      this.$('[name="consultant"]').dropdown();
      this.$('#courseTime').datetimepicker({lang: 'zh', step: 30});
      this.$('#videoPart').hide();
      this.$('#groupAddress').hide();
      this.$('[name="approach"]').dropdown();
      this.$('.course-categories').html(getCategoriesHtml(this.categories.toJSON()));
      this.$('.ui.checkbox').checkbox();
      this.$('input[type="checkbox"]').on('change', function() {
        that.$('input[type="checkbox"]').not(this).prop('checked', false);
      });
      this.$('[name="approach"]').change(function (eventObject) {
        var videoPart = $('#videoPart');
        var groupAddress = $('#groupAddress');
        eventObject.target.value === 'VIDEO' ? videoPart.show() : videoPart.hide();
        eventObject.target.value === 'ONE2MANY' ? groupAddress.show() : groupAddress.hide();

      });
      this.$el.form(validationRules);
      var data = this.model.toJSON();
      if(data.category != undefined && data.category != null){
        data['CourseCategory-'+data.category] = true;
      }
      this.$el.form('set values', data);
      this.$('.editor').editable({
        buttons: ['bold', 'italic', 'underline', 'strikeThrough', 'fontSize', 'fontFamily', 'color', 'sep',
          'formatBlock', 'blockStyle', 'align', 'insertOrderedList', 'insertUnorderedList', 'outdent', 'indent', 'sep',
          'createLink', 'insertImage', 'insertVideo', 'insertHorizontalRule', 'undo', 'redo', 'html', 'uploadFile'
        ],
        inlineMode: false,
        language: 'zh_cn',
        imageUploadURL: '/api/v1/upload',
        fileUploadURL: '/api/v1/upload'
      });
    },
    ui: {
      save: '.button.submit'
    },
    events: {
      'click @ui.save': 'saveCourse'
    },
    saveCourse: function () {
      var json = this.$el.form('get values');
      var category = this.$('input:checked');
      json.category = category.prop('value');
      this.trigger('course:save', json);
    }
  });

  var CategoryEditorView = Marionette.ItemView.extend({
    template: JST["templates/admin/courses/categoryeditor"],
    initialize: function (options) {
      this.categories = options.categories;
    },
    serializeData: function () {
      var data = this.model.toJSON();
      data.categories = this.categories.toJSON();
      return data;
    },

    onRender: function (){
      this.$('.ui.dropdown').dropdown();
      var data = this.model.toJSON();
      this.$el.form('set values', data);
    },

    ui: {
      save: '.button.submit'
    },
    events: {
      'click @ui.save': 'saveCategory'
    },
    saveCategory: function () {
      var json = this.$el.form('get values');
      this.trigger('category:save', json);
    }
  });

  function transform(source, rules) {
    var prop;
    for (prop in source) {
      if (source.hasOwnProperty(prop) && rules[prop]) {
        source[prop] = rules[prop](source[prop]);
      }
    }
  }

  var CourseController = Marionette.Controller.extend({

    createCourse: function () {
      var course = Dionysus.request('course:new');
      $.when(Dionysus.request('course:categories:tree'), Dionysus.request('course:consultants')).done(function (categories, consultants) {
        var editor = new CourseEditorView({model: course, categories: categories, consultants: consultants});
        editor.on('course:save', function (json) {
          transform(json, courseTransformRules);
          if (json.category != null) {
            json.category = {"id": string2Integer(json.category)};
          }
          if (json.consultant != null) {
            json.consultant = {"id": string2Integer(json.consultant)};
          }
          course.save(json, {
            error: function (model, response, options) {
              console.log(response);
              console.log(options);
              toastr.error('课程保存失败');
            }
          }).done(function () {
            toastr.info('课程保存成功');
          });
        });
        Dionysus.mainRegion.show(editor);
      });
    },

    showCourses: function () {
      $.when(Dionysus.request('course:entities')).done(function (courses) {
        Dionysus.mainRegion.show(new CourseCollectionView({collection: courses}));
      });
    },

    editCourse: function (id) {
      $.when(Dionysus.request('course:entity', id), Dionysus.request('course:categories:tree'), Dionysus.request('course:consultants')).done(function (course, categories, consultants) {
        var couseData = course.toJSON();
        if (couseData.category != null) {
          course.set('category', couseData.category.id);
        }
        if (couseData.consultant != null) {
          course.set('consultant', couseData.consultant.username);
        }
        var editor = new CourseEditorView({model: course, categories: categories, consultants: consultants});
        editor.on('course:save', function (json) {
          transform(json, courseTransformRules);
          if (json.category != null) {
            json.category = {"id": string2Integer(json.category)};
          }
          if (json.consultant != null) {
            json.consultant = {"id": string2Integer(json.consultant)};
          }
          course.save(json, {
            error: function (model, response, options) {
              console.log(response);
              console.log(options);
              toastr.error('课程保存失败');
            }
          }).done(function (model, response, options) {
            console.log(response);
            console.log(options);
            toastr.info('课程保存成功');
          });
        });
        Dionysus.mainRegion.show(editor);
      });
    },

    createCategory: function(){
      var category = Dionysus.request('course:category:new');
      $.when(Dionysus.request('course:categories')).done(function(categories){
        var editor = new CategoryEditorView({model:category,categories:categories});
        editor.on('category:save', function (json) {
            if (json.parent != null) {
            json.parent = string2Integer(json.parent);
          }
          category.save(json, {
            error: function (model, response, options) {
              //console.log(response);
              //console.log(options);
              toastr.error('类别保存失败');
            }
          }).done(function () {
            toastr.info('类别保存成功');
          });
        });
        Dionysus.mainRegion.show(editor);
      });
    },
    editCategory: function(){

    }
  });

  var getCategoriesHtml = function (categories) {
    var result = '';
    for (var index = 0, length = categories.length; index < length; index++) {
      var category = categories[index];
      result += '<li><div class="ui checkbox"><input type="checkbox" name = "CourseCategory-' + category.id + '" value="' + categories[index].id + '"/><label>' + category.name + '</label></div>';
      if(category.children.length > 0 ){
        result += '<ul class="course-categories">';
        result += getCategoriesHtml(category.children);
        result += '</ul>';
      }else{
        result += '</li>';
      }
    }
    return result;
  };
  Dionysus.addInitializer(function () {
    new Marionette.AppRouter({
      appRoutes: {
        'admin/courses/create(/)': 'createCourse',
        'admin/courses(/)': 'showCourses',
        'admin/courses/:id(/)': 'editCourse',
        'admin/courses/categories/create': 'createCategory',
        'admin/courses/categories/:id(/)': 'editCategory'
      },
      controller: new CourseController()
    });
  });
});
