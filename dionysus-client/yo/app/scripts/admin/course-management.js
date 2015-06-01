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
    className: 'item',
    ui: {
      deleteMe: '.button.delete'
    },
    events: {
      'click @ui.deleteMe': 'deleteCourse'
    },
    deleteCourse: function (e) {
      e.stopPropagation();
      this.trigger('course:delete', this.model);
    }
  });

  var CourseCollectionView = Marionette.CompositeView.extend({
    template: JST["templates/admin/courses/courses"],
    childView: CourseItemView,
    childViewContainer: '.items',
    initialize: function(options){
      if (options && options.totalPages){
        this.totalPages =options.totalPages;
      }
      if(options && options.current){
        this.current =options.current;
      }
    },
    onRender:function(){
      this.$('#paging').twbsPagination({
        totalPages: this.totalPages,
        startPage: this.current,
        visiblePages: 6,
        first: '第一页',
        prev: '前一页',
        next: '后一页',
        last: '最后一页',
        loop:true,
        onPageClick: function(event,page){
          Dionysus.navigate('/admin/courses?page=' + page,{trigger:true});
        }
      });
    }
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
      var that = this;
      this.$('[name="state"]').dropdown();
      this.$('[name="consultant"]').dropdown();
      this.$('#courseTime').datetimepicker({lang: 'zh', step: 30});
      this.$('#videoPart').hide();
      this.$('#groupAddress').hide();
      this.$('[name="approach"]').dropdown();
      this.$('.course-categories').html(getCategoriesHtml(this.categories.toJSON()));
      this.$('.ui.checkbox').checkbox();
      this.$('input[type="checkbox"]').on('change', function () {
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
      if (data.category != undefined && data.category != null) {
        data['CourseCategory-' + data.category] = true;
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
      save: '.button.submit',
      delete: '.button.delete',
      editcat: '.button.category.edit'
    },
    events: {
      'click @ui.save': 'saveCourse',
      'click @ui.delete': 'deleteCourse',
      'click @ui.editcat': 'editCategory'
    },
    saveCourse: function () {
      var json = this.$el.form('get values');
      var category = this.$('input:checked');
      json.category = category.prop('value');
      this.trigger('course:save', json);
    },

    deleteCourse: function () {
      this.trigger('course:delete');
    },

    editCategory: function () {
      var category = this.$('input:checked');
      if (category.length == 0) {
        toastr.error('请选择类别');
      } else {
        Dionysus.navigate('/admin/courses/categories/' + category.prop('value'), {trigger: true});
      }
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

    onRender: function () {
      this.$('.ui.dropdown').dropdown();
      var data = this.model.toJSON();
      this.$el.form('set values', data);
    },

    ui: {
      save: '.button.submit',
      delete: '.button.delete'
    },
    events: {
      'click @ui.save': 'saveCategory',
      'click @ui.delete': 'deleteCategory'
    },
    saveCategory: function () {
      var json = this.$el.form('get values');
      this.trigger('category:save', json);
    },

    deleteCategory: function () {
      this.trigger('category:delete');
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

  function parseQueryString(queryString){
    var params = {};
    if(queryString){
      _.each(
        _.map(decodeURI(queryString).split(/&/g),function(el,i){
          var aux = el.split('='), o = {};
          if(aux.length >= 1){
            var val = undefined;
            if(aux.length == 2)
              val = aux[1];
            o[aux[0]] = val;
          }
          return o;
        }),
        function(o){
          _.extend(params,o);
        }
      );
    }
    return params;
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

    showCourses: function (queryString) {
      var params = parseQueryString(queryString);
      var page = 1;
      if(params.page){
        page = parseInt(params.page);
      }
      Dionysus.mainRegion.show(new Dionysus.Common.Views.Loading());
      $.when(Dionysus.request('course:entities',page)).done(function (pagedCourse) {
        var courses = new Backbone.Collection(pagedCourse.get('content'));
        var totalPages = pagedCourse.get('totalPages');
        var listView = new CourseCollectionView({collection: courses,current:page, totalPages:totalPages});
        listView.on('childview:course:delete', function (childView, model) {
          model.url = '/controllers/courses/' + model.id;
          model.destroy({
            error: function (model, response) {
              toastr.error('删除课程失败');
            }
          }).done(function (){
            toastr.info('删除成功');
            listView.render();
          });
        });
        Dionysus.mainRegion.show(listView);
      });
    },

    editCourse: function (id) {
      Dionysus.mainRegion.show(new Dionysus.Common.Views.Loading());
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
        editor.on('course:delete', function () {
          course.destroy({
            error: function (model, response, options) {
              console.log(response);
              console.log(options);
              toastr.error('课程删除失败');
            }
          }).done(function (model, response, options) {
            console.log(response);
            console.log(options);
            toastr.info('删除成功');
            Dionysus.navigate('/admin/courses', {trigger: true, replace: true});
          });
        });
        Dionysus.mainRegion.show(editor);
      });
    },

    createCategory: function () {
      var category = Dionysus.request('course:category:new');
      $.when(Dionysus.request('course:categories')).done(function (categories) {
        var editor = new CategoryEditorView({model: category, categories: categories});
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
            Dionysus.navigate('/admin/courses', {trigger: true, replace: true});
          });
        });


        Dionysus.mainRegion.show(editor);
      });
    },
    editCategory: function (id) {
      $.when(Dionysus.request('course:category', id), Dionysus.request('course:categories')).done(function (category, categories) {
        categories.remove({id: parseInt(id)});
        var editor = new CategoryEditorView({model: category, categories: categories});
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
        editor.on('category:delete', function () {
          category.destroy({
            error: function (model, response, options) {
              //console.log(response);
              //console.log(options);
              toastr.error('类别删除失败，请检查是否有仍然有课程使用这个类别');
            }
          }).done(function () {
            toastr.info('删除成功');
          });
        });
        Dionysus.mainRegion.show(editor);
      });
    }
  });

  var getCategoriesHtml = function (categories) {
    var result = '';
    for (var index = 0, length = categories.length; index < length; index++) {
      var category = categories[index];
      result += '<li><div class="ui checkbox"><input type="checkbox" name = "CourseCategory-' + category.id + '" value="' + categories[index].id + '"/><label>' + category.name + '</label></div>';
      if (category.children.length > 0) {
        result += '<ul class="course-categories">';
        result += getCategoriesHtml(category.children);
        result += '</ul>';
      } else {
        result += '</li>';
      }
    }
    return result;
  };
  Dionysus.addInitializer(function () {
    new Marionette.AppRouter({
      appRoutes: {
        'admin/courses/create(/)': 'createCourse',
        'admin/courses(?*querystring)': 'showCourses',
        'admin/courses/:id(/)': 'editCourse',
        'admin/courses/categories/create': 'createCategory',
        'admin/courses/categories/:id(/)': 'editCategory'
      },
      controller: new CourseController()
    });
  });
});
