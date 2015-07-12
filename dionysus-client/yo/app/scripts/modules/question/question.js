Dionysus.module('Course', function(Article, Dionysus, Backbone, Marionette) {

  var baseTemplatePath = 'templates/home/question';

  var QuestionHomeView = Marionette.ItemView.extend({
    initialize : function(options){
      this.popular = options.popular;
      this.latest = options.latest;
      this.popularTags = options.popularTags;
      this.questions = options.questions;
      this.answered = options.answered;
      this.noanswer = options.noanswer;
    },
    serializeData : function (){
      return this;
    },

    template : function(data){
      var template = JST[baseTemplatePath+'/questionHome'];
      var html = template(data);
      return html;
    },

    onRender:function(){
      var template = JST[baseTemplatePath+'/questionList'];
      var html = template({questions:this.questions.content});
      this.$('#questions').html(html);
      this.$('#all').toggleClass('basic green');
      this.$('#cats').on('click',function(event){
        var clicking = $(event.target);
        var current = $(this).find('.green');
        if(current.prop('id') !== clicking.prop('id')){
          current.toggleClass('basic green');
          clicking.toggleClass('basic green');
        }
      });
      this.$('.tag').on('click',function(event){
        var clicking = $(event.target);
        var tagName = clicking.text();
        if(tagName == '所有'){
          window.location.href = "/questions";
        }else{
          $.when(Dionysus.request('questions:byTagName',tagName)).done(function(questions){
            var template = JST[baseTemplatePath+'/questionList'];
            var html = template({questions:questions.content});
            $('#content').html(html);
          });
        }

      });
      this.$('#newQuestion').on('click',function(){
        Dionysus.navigate('/questions/create',true);
      });
    }
  });

  var CreateView = Marionette.ItemView.extend({
    template: JST[baseTemplatePath + '/editor'],
    onDomRefresh:function(){
      $('#tags').tagsInput({
        defaultText:'添加标签',
        width:'100%'
      });
    }
  });

  var QuestionController = Marionette.Controller.extend({
    showQuestionHome: function(){
      Dionysus.mainRegion.show(new Dionysus.Common.Views.Loading());
      $.when(Dionysus.request('questions'),
             Dionysus.request('questions:popular',5),
             Dionysus.request('questions:latest',5),
             Dionysus.request('questions:popularTags',5),
             Dionysus.request('questions:answered',true),
             Dionysus.request('questions:answered',false)
      ).done(function(questions,popular,latest,popularTags,answered,noanswer){
          var home = new QuestionHomeView({questions:questions,popular:popular,latest:latest,popularTags:popularTags,answered:answered,noanswer:noanswer});
          Dionysus.mainRegion.show(home);
        })
    },
    createQuestion: function(){
      var view = new CreateView();
      Dionysus.mainRegion.show(view);
    }
  });

  Dionysus.addInitializer(function () {
    new Marionette.AppRouter({
      appRoutes: {
        'questions(/)': 'showQuestionHome',
        'questions/create(/)': 'createQuestion'
      },
      controller: new QuestionController()
    });
  });

})
