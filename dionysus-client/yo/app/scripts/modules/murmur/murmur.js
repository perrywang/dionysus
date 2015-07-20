Dionysus.module('Question', function (Article, Dionysus, Backbone, Marionette) {

  var baseTemplatePath = 'templates/home/murmur';

  var murmurHomeView = Marionette.ItemView.extend({
    initialize: function (options) {
      this.murmurs = options.murmurs;
    },
    serializeData: function () {
      return this.murmurs;
    },

    template: function (data) {
      var template = JST[baseTemplatePath + '/murmurHome'];
      var html = template({murmurs:data.content});
      return html;
    },

    onRender: function(){
      var that = this;
      this.$('#submit').on('click',function(event){
        var content = $('#content').val();
        if(content == ''){
          toastr.error('不能说 “ 空 ” 话！');
          return;
        }
        var murmur = {content:content};
        $.ajax({
          type: "POST",
          url: "/controllers/murmurs",
          data: JSON.stringify(murmur),
          success: function(data){
            toastr.success("发布成功！");
            var template = JST[baseTemplatePath + '/murmur'];
            var html = template(data);
            $('#murmurList').prepend(html);
          },
          dataType: "json",
          contentType: "application/json"
        });
      });
      this.$('#allmurmurs').on('click',function(event){
        $('#mymurmurs').toggleClass('active');
        $(this).toggleClass('active');
        var template = JST[baseTemplatePath + '/murmurList'];
        $.when(Dionysus.request('murmurs', {})).done(function (data) {
          var html = template({murmurs: data.content});
          $('#murmurs').html(html);
          $('#pagnation').remove();
          $('#pagnationWrapper').append('<div id="pagnation"></div>');
          if(data.number + 1 <= data.totalPages){
            $('#pagnation').twbsPagination({
              totalPages: data.totalPages,
              startPage: data.number + 1,
              visiblePages: 6,
              first: '第一页',
              prev: '前一页',
              next: '后一页',
              last: '最后一页',
              onPageClick: function (event, page) {
                var template = JST[baseTemplatePath + '/murmurList'];
                var options = {};
                options.page = page - 1;
                $.when(Dionysus.request('murmurs', options)).done(function (data) {
                  var html = template({murmurs: data.content});
                  $('#murmurs').html(html);
                });
              }
            });
          }
        });
      });

      this.$('#mymurmurs').on('click',function(event){
        $('#allmurmurs').toggleClass('active');
        $(this).toggleClass('active');
        var template = JST[baseTemplatePath + '/murmurList'];
        $.when(Dionysus.request('murmurs:me', {})).done(function (data) {
          var html = template({murmurs: data.content});
          $('#murmurs').html(html);
          $('#pagnation').remove();
          $('#pagnationWrapper').append('<div id="pagnation"></div>');
          if(data.number + 1 <= data.totalPages){
            $('#pagnation').twbsPagination({
              totalPages: data.totalPages,
              startPage: data.number + 1,
              visiblePages: 6,
              first: '第一页',
              prev: '前一页',
              next: '后一页',
              last: '最后一页',
              onPageClick: function (event, page) {
                var template = JST[baseTemplatePath + '/murmurList'];
                var options = {};
                options.page = page - 1;
                $.when(Dionysus.request('murmurs:me', options)).done(function (data) {
                  var html = template({murmurs: data.content});
                  $('#murmurList').html(html);
                });
              }
            });
          }
        });
      });

      if(this.murmurs.number + 1 <= this.murmurs.totalPages){
        this.$('#pagnation').twbsPagination({
          totalPages: this.murmurs.totalPages,
          startPage: this.murmurs.number + 1,
          visiblePages: 6,
          first: '第一页',
          prev: '前一页',
          next: '后一页',
          last: '最后一页',
          onPageClick: function (event, page) {
            var template = JST[baseTemplatePath + '/murmurList'];
            var options = {};
            options.page = page - 1;
            $.when(Dionysus.request('murmurs', options)).done(function (data) {
              var html = template({murmurs: data.content});
              $('#murmurs').html(html);
            });
          }
        });
      }
    }

  })

  var MurmurController = Marionette.Controller.extend({
    showMurmurHome: function () {
      Dionysus.mainRegion.show(new Dionysus.Common.Views.Loading());
      $.when(Dionysus.request('murmurs',{})).done(function (murmurs) {
          var home = new murmurHomeView({murmurs:murmurs});
          Dionysus.mainRegion.show(home);
        })
    }
  });

  Dionysus.addInitializer(function () {
    new Marionette.AppRouter({
      appRoutes: {
        'murmurs(/)': 'showMurmurHome'
      },
      controller: new MurmurController()
    });
  });
});
