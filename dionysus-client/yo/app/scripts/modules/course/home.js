Dionysus.module('Course', function(Article, Dionysus, Backbone, Marionette){

  var baseTemplatePath = 'templates/home/course';

  var home = Marionette.ItemView.extend({
    initialize: function(options){
      this.slider = options.slider;
      this.top = options.top;
      this.sub = options.sub;
      this.approach = options.approach;
      this.videos = options.videos.content;
      this.videosTotal = options.videos.totalPages;
      this.videoCurrent = options.videos.number+1;
      this.reporter = options.reporter;
      this.room = options.room.content;
      this.roomTotal = options.room.totalPages;
      this.roomCurrent = options.room.number+1;
      this.offline = options.offline;
    },

    template:function(data){
      var template = JST[baseTemplatePath+'/home'];
      var html = template(data);
      return html;
    },

    updatePage: function(category){
      $.when(Dionysus.request('course:home:videos',category),
          Dionysus.request('course:home:room',category),
          Dionysus.request('course:home:offline',category)
      ).done(function(videos,room,offline){
            var videoTemplate = JST[baseTemplatePath+'/videos'];
            var html = videoTemplate({videos:videos.content});
            $('#videos').html(html);
            $('#pagenation-video').twbsPagination({
              totalPages: videos.totalPages,
              startPage: videos.number+1,
              visiblePages: 6,
              first: '第一页',
              prev: '前一页',
              next: '后一页',
              last: '最后一页',
              onPageClick: function(event,page){
                var videoTemplate = JST[baseTemplatePath+'/videos'];
                var category = $('.sub.green').prop('id');
                $.when(Dionysus.request('course:home:videos',category,page-1)).done(function(data){
                  var html = videoTemplate({videos:data.content});
                  $('#videos').html(html);
                });
              }
            });
            var roomTemplate = JST[baseTemplatePath+'/room'];
            var rooms = roomTemplate({room:room.content});
            $('#room').html(rooms);
            $('#pagenation-room').twbsPagination({
              totalPages: room.totalPages,
              startPage: room.number+1,
              visiblePages: 6,
              first: '第一页',
              prev: '前一页',
              next: '后一页',
              last: '最后一页',
              onPageClick: function(event,page){
                var videoTemplate = JST[baseTemplatePath+'/room'];
                var category = $('.sub.green').prop('id');
                $.when(Dionysus.request('course:home:room',category,page-1)).done(function(data){
                  var html = videoTemplate({room:data.content});
                  $('#room').html(html);
                });
              }
            });
            var offlineTemplate = JST[baseTemplatePath+'/offline'];
            var offlines = offlineTemplate({offline:offline.content});
            $('#offline').html(offlines);
            $('a.reg').on('click', function(event){
              event.preventDefault();
              var clicking = $(event.target);
              var href = clicking.prop('href');
              Dionysus.navigate(href,{trigger:true});
            });
          });
    },

    onRender: function(){
      var that = this;
      this.$('#slider').flexslider();
      this.$('.ui.small.basic.button:nth-child(2)').toggleClass('basic green');
      this.$('#pagenation-video').twbsPagination({
        totalPages: this.videosTotal,
        startPage: this.videoCurrent,
        visiblePages: 6,
        first: '第一页',
        prev: '前一页',
        next: '后一页',
        last: '最后一页',
        onPageClick: function(event,page){
          var videoTemplate = JST[baseTemplatePath+'/videos'];
          var category = $('.sub.green').prop('id');
          $.when(Dionysus.request('course:home:videos',category,page-1)).done(function(data){
            var html = videoTemplate({videos:data.content});
            $('#videos').html(html);
          });
        }
      });

      this.$('#pagenation-room').twbsPagination({
        totalPages: this.roomTotal,
        startPage: this.roomCurrent,
        visiblePages: 6,
        first: '第一页',
        prev: '前一页',
        next: '后一页',
        last: '最后一页',
        onPageClick: function(event,page){
          var roomTemplate = JST[baseTemplatePath+'/room'];
          var category = $('.sub.green').prop('id');
          $.when(Dionysus.request('course:home:room',category,page-1)).done(function(data){
            var html = roomTemplate({room:data.content});
            $('#room').html(html);
          });
        }
      });
      this.$('#subCats').on('click',function(event){
        var clicking = $(event.target);
          var current = $(this).find('.green');
          if(current.prop('id') !== clicking.prop('id')){
            current.toggleClass('basic green');
            clicking.toggleClass('basic green');
            that.updatePage(clicking.prop('id'));
          }
      });
      this.$('#topCats').on('click',function(event){
        var clicking = $(event.target);
        var current = $(this).find('.green');
        if(current.prop('id') !== clicking.prop('id')){
          current.toggleClass('basic green');
          clicking.toggleClass('basic green');
          var clickedCategory = _.findWhere(that.top,{id:parseInt(clicking.prop('id'))});
          var subTemplate = JST[baseTemplatePath+'/subcats'];
          var html = subTemplate({sub:clickedCategory.children});
          $('#subCats').html(html);
          var sub = $('#subCats').find('.button:nth-child(2)');
          sub.toggleClass('basic green');
          var id = sub.prop('id');
          that.updatePage(id);
        }
      });
      this.$('#approach').on('click',function(event){
        var clicking = $(event.target);
        var current = $(this).find('.green');
        if(current.text() !== clicking.text()){
          current.toggleClass('basic green');
          clicking.toggleClass('basic green');
        }
      });
      this.$('a.reg').on('click', function(event){
        event.preventDefault();
        var clicking = $(event.target);
        var href = clicking.prop('href');
        Dionysus.navigate(href,{trigger:true});
      });
    },

    serializeData: function(){
      return this;
    }
  });

  var detail = Marionette.ItemView.extend({
     initialize : function(options){
       this.course = options.course;
       this.courses = options.courses;
       this.comments = options.comments;
     },
    template:function(data){
      var template = JST[baseTemplatePath+'/detail'];
      var html = template(data);
      return html;
    },
    serializeData: function(){
      return this;
    }
  });

  var CourseController = Marionette.Controller.extend({
    showCourseHome: function(){
      $.when(Dionysus.request('course:home:categories'),Dionysus.request('course:home:slider'))
            .done(function(categories,slider){
                var options = {slider:slider};
                options.approach = [{name:"录制视频",href:"#approach"},{name:"在线课堂",href:"#second"},{name:"离线课程",href:"#offline"}];
                options.top = [];
                _.map(categories,function(category){
                  options.top.push(category);
                });
                options.sub = categories[0].children;
                var category;
                if(options.sub.length > 0){
                  category = options.sub[0].id;
                }else{
                  category = categories[0].id;
                }
                $.when(Dionysus.request('course:home:videos',category),
                       Dionysus.request('course:home:room',category),
                       Dionysus.request('course:home:offline',category)
                ).done(function(videos,room,offline){
                      options.videos = videos;
                      options.room = room;
                      options.offline = offline.content;
                      var view = new home(options);
                      Dionysus.mainRegion.show(view);
                    });
            });
    },
    showCourse:function(id){
      $.when(Dionysus.request('course:home:detail',id),Dionysus.request('course:home:detail:courses'),Dionysus.request('course:home:detail:comments',id)).done(function(course,courses,comments){
        var detailView = new detail({course:course,courses:courses,comments:comments});
        Dionysus.mainRegion.show(detailView);
      });
    },
    registerRoom : function(id){
      $.getJSON("/controllers/courses/" + id + "/reg");
    },
    registerOffline : function(id){
      $.getJSON("/controllers/courses/" + id + "/reg",function(data){
        toastr.info('课程注册成功');
        $('#reg').text('已注册 ' + data.number + ' 人')
      });
    },
    registerRoom : function(id){
      $.getJSON("/controllers/courses/" + id + "/reg",function(data){
        toastr.info('课程注册成功');
      });
    }
  });
  Dionysus.addInitializer(function () {
    new Marionette.AppRouter({
      appRoutes: {
        'courses(/)': 'showCourseHome',
        'courses/:id(/)' : 'showCourse',
        'courses/:id/regroom(/)' : 'registerRoom',
        'courses/:id/regoffline(/)' : 'registerOffline'
      },
      controller: new CourseController()
    });
  });
});
