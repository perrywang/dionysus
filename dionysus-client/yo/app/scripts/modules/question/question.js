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
      var html = template.template(data);
      return html;
    },

    onRender:function(){
      var questions = JST[baseTemplatePath+'/questionList'];
      var html = questions.template({questions:this.questions.content});
      this.$('#questions').html(html);
    }
  });


  var QuestionController = Marionette.Controller.extend({
    showQuestionHome: function(){
      Dionysus.mainRegion.show(new Dionysus.Common.Views.Loading());
    },
    showQuestion:function(id){
      Dionysus.mainRegion.show(new Dionysus.Common.Views.Loading());
    },
    createQuestion: function(){
      Dionysus.mainRegion.show(new Dionysus.Common.Views.Loading());
    }
  });

  Dionysus.addInitializer(function () {
    new Marionette.AppRouter({
      appRoutes: {
        'questions(/)': 'showQuestionHome',
        'questions/create(/)' : 'createQuestion',
        'questions/:id(/)' : 'showQuestion'
      },
      controller: new QuestionController()
    });
  });

})
