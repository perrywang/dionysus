Dionysus.module('Course', function (Article, Dionysus, Backbone, Marionette) {

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

    onRender: function () {
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
        }
      });
      this.$('.tag').on('click', function (event) {
        var clicking = $(event.target);
        var tagName = clicking.text();
        if (tagName == '所有') {
          window.location.href = "/questions";
        } else {
          $.when(Dionysus.request('questions:byTagName', tagName)).done(function (questions) {
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
                  $.when(Dionysus.request('questions:byTagName', page - 1)).done(function (data) {
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
        Dionysus.navigate('/questions/create', true);
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
            $.when(Dionysus.request('questions', page - 1)).done(function (data) {
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
    }
  });

  var QuestionController = Marionette.Controller.extend({
    showQuestionHome: function () {
      Dionysus.mainRegion.show(new Dionysus.Common.Views.Loading());
      $.when(Dionysus.request('questions'),
        Dionysus.request('questions:popular', 5),
        Dionysus.request('questions:latest', 5),
        Dionysus.request('questions:popularTags', 5),
        Dionysus.request('questions:answered', true),
        Dionysus.request('questions:answered', false)
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
      $.when(Dionysus.request('questions:question', id)).done(function (question) {
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
