Dionysus.module('Question', function (Article, Dionysus, Backbone, Marionette) {

  var baseTemplatePath = 'templates/home/question';

  var QuestionHomeView = Marionette.ItemView.extend({
    initialize: function (options) {
      this.popular = options.popular;
      this.latest = options.latest;
      this.popularTags = options.popularTags;
      this.questions = options.questions;
      this.answered = options.answered;
      this.noanswer = options.noanswer;
    },
    serializeData: function () {
      return this;
    },

    template: function (data) {
      var template = JST[baseTemplatePath + '/questionHome'];
      var html = template(data);
      return html;
    },

    retrieveQuestions: function(requestName,options){
      var reqOptions = options || {};
      $.when(Dionysus.request(requestName,reqOptions)).done(function(questions){
        var template = JST[baseTemplatePath + '/questionList'];
        var html = template({questions: questions.content});
        $('#questions').html(html);
        if (questions.number + 1 <= questions.totalPages) {
          $('#pagnation').twbsPagination({
            totalPages: questions.totalPages,
            startPage: questions.number + 1,
            visiblePages: 6,
            first: '第一页',
            prev: '前一页',
            next: '后一页',
            last: '最后一页',
            onPageClick: function (event, page) {
              var template = JST[baseTemplatePath + '/questionList'];
              reqOptions.page = page - 1;
              $.when(Dionysus.request(requestName, reqOptions)).done(function (data) {
                var html = template({questions: data.content});
                $('#questions').html(html);
              });
            }
          });
        }
      });
    },

    changeCategory:function(cat){
      if(cat == 'all') {
        this.retrieveQuestions('questions');
      }else if(cat == 'answered'){
        this.retrieveQuestions('questions:answered',{answered:true});
      }else if(cat == 'noAnwered'){
        this.retrieveQuestions('questions:answered',{answered:false});
      }else if(cat == 'myQuestions') {
        this.retrieveQuestions('questions:me');
      }
    },

    onRender: function () {
      var that = this;
      var template = JST[baseTemplatePath + '/questionList'];
      var html = template({questions: this.questions.content});
      this.$('#questions').html(html);
      this.$('#all').toggleClass('basic green');
      this.$('#cats').on('click', function (event) {
        var clicking = $(event.target);
        var current = $(this).find('.green');
        if (current.prop('id') !== clicking.prop('id')) {
          current.toggleClass('basic green');
          clicking.toggleClass('basic green');
          var cat = clicking.prop('id');
          that.changeCategory(cat);
        }
      });
      this.$('.tag').on('click', function (event) {
        var clicking = $(event.target);
        var tagName = clicking.text();
        if (tagName == '所有') {
          window.location.href = "/questions";
        } else {
          var tid = clicking.attr('tag-id');
          $.when(Dionysus.request('questions:byTag', tid)).done(function (questions) {
            var template = JST[baseTemplatePath + '/questionList'];
            var html = template({questions: questions.content,tag:tagName});
            $('#content').html(html);
            if (questions.number + 1 <= questions.totalPages) {
              $('#pagnation').twbsPagination({
                totalPages: questions.totalPages,
                startPage: questions.number + 1,
                visiblePages: 6,
                first: '第一页',
                prev: '前一页',
                next: '后一页',
                last: '最后一页',
                onPageClick: function (event, page) {
                  var template = JST[baseTemplatePath + '/questionList'];
                  $.when(Dionysus.request('questions:byTag',tid, page - 1)).done(function (data) {
                    var html = template({questions: data.content,tag:tagName});
                    $('#content').html(html);
                  });
                }
              })
            }
          });
        }
      });
      this.$('#newQuestion').on('click', function () {
        Dionysus.navigate('/questions/create',true);
      });
      if (this.questions.number + 1 <= this.questions.totalPages) {
        this.$('#pagnation').twbsPagination({
          totalPages: this.questions.totalPages,
          startPage: this.questions.number + 1,
          visiblePages: 6,
          first: '第一页',
          prev: '前一页',
          next: '后一页',
          last: '最后一页',
          onPageClick: function (event, page) {
            var template = JST[baseTemplatePath + '/questionList'];
            var options = {};
            options.page = page - 1;
            $.when(Dionysus.request('questions', options)).done(function (data) {
              var html = template({questions: data.content});
              $('#questions').html(html);
            });
          }
        });
      }
    }
  });

  var CreateView = Marionette.ItemView.extend({
    template: JST[baseTemplatePath + '/editor'],
    onDomRefresh: function () {
      $('#tags').tagsInput({
        defaultText: '添加标签',
        width: '100%'
      });
    },
    onRender:function(){
      this.$('#submit').on('click',function(event){
        var title = $('#title').val();
        var description = $('#description').val();
        var tagsInput = $('#tags').val();
        if(title == ''){
          toastr.error('请提供问题描述！');
          return;
        }
        if(tagsInput == ''){
          toastr.error('请至少提供一个问题标签！');
          return;
        }
        var question = {title:title,description:description,tagsInput:tagsInput};
        $.ajax({
          type: "POST",
          url: "/controllers/questions",
          data: JSON.stringify(question),
          success: function(data){
            toastr.success("提交问题成功");
            Dionysus.navigate("/questions",true);
          },
          dataType: "json",
          contentType: "application/json"
        });
      });
    }
  });

  var DetailView = Marionette.ItemView.extend({
    initialize: function (options) {
      this.question = options.question;
    },

    serializeData: function () {
      return this.question;
    },

    template: function (data) {
      var template = JST[baseTemplatePath + '/detail'];
      var html = template(data);
      return html;
    },

    onRender:function(){
      var that = this;
      this.$('#submit').on('click',function(){
        var answer = {};
        var content = $('#answer').val();
        if(content == ''){
          toastr.error('请输入你的答案！');
          return;
        }
        answer.content = content;
        $.ajax({
          type: "POST",
          url: "/controllers/questions/"+that.question.id + "/answers",
          data: JSON.stringify(answer),
          success: function(data){
            toastr.success("提交回答成功!");
            var template = JST[baseTemplatePath + '/answer'];
            var html = template(data);
            $('.ui.comments').prepend(html);
          },
          dataType: "json",
          contentType: "application/json"
        });

      });
    }

  });

  var QuestionController = Marionette.Controller.extend({
    showQuestionHome: function () {
      Dionysus.mainRegion.show(new Dionysus.Common.Views.Loading());
      $.when(Dionysus.request('questions',{}),
        Dionysus.request('questions:popular', 5),
        Dionysus.request('questions:latest', 5),
        Dionysus.request('questions:popularTags', 10),
        Dionysus.request('questions:answered', {answered:true}),
        Dionysus.request('questions:answered', {answered:false})
      ).done(function (questions, popular, latest, popularTags, answered, noanswer) {
          var home = new QuestionHomeView({
            questions: questions,
            popular: popular,
            latest: latest,
            popularTags: popularTags,
            answered: answered,
            noanswer: noanswer
          });
          Dionysus.mainRegion.show(home);
        })
    },
    createQuestion: function () {
      var view = new CreateView();
      Dionysus.mainRegion.show(view);
    },
    showQuestion: function (id) {
      Dionysus.mainRegion.show(new Dionysus.Common.Views.Loading());
      $.when(Dionysus.request('questions:question', id),Dionysus.request('questions:answers', id)).done(function (question,answers) {
        question.answers = answers;
        var view = new DetailView({question: question});
        Dionysus.mainRegion.show(view);
      });
    }
  });

  Dionysus.addInitializer(function () {
    new Marionette.AppRouter({
      appRoutes: {
        'questions(/)': 'showQuestionHome',
        'questions/create(/)': 'createQuestion',
        'questions/:id(/)': 'showQuestion'
      },
      controller: new QuestionController()
    });
  });

})
