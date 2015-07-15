Dionysus.module('Entities', function(Entities, Dionysus, Backbone, Marionette, $) {
  'use strict';

  var baseUrl = '/controllers/questions';

  Dionysus.reqres.setHandler('questions',function(options){
    var questions = $.Deferred();
    var page = options.page || 0;
    $.getJSON(baseUrl+"?page=" + page).done(function(data){
      questions.resolve(data);
    });
    return questions.promise();
  });

  Dionysus.reqres.setHandler('questions:popular',function(N){
    var questions = $.Deferred();
    $.getJSON(baseUrl+"/popular?N=" + N).done(function(data){
      questions.resolve(data);
    });
    return questions.promise();
  });

  Dionysus.reqres.setHandler('questions:latest',function(N){
    var questions = $.Deferred();
    $.getJSON(baseUrl+"/latest?N=" + N).done(function(data){
      questions.resolve(data);
    });
    return questions.promise();
  });

  Dionysus.reqres.setHandler('questions:me',function(options){
    var questions = $.Deferred();
    var page = options.page || 0;
    $.getJSON(baseUrl+"/me?page=" + page).done(function(data){
      questions.resolve(data);
    });
    return questions.promise();
  });

  Dionysus.reqres.setHandler('questions:byTag',function(tid,page){
    var questions = $.Deferred();
    if(page == undefined){
      page = 0;
    }
    $.getJSON(baseUrl+"/bytag/"+tid + "?page=" + page).done(function(data){
      questions.resolve(data);
    });
    return questions.promise();
  });

  Dionysus.reqres.setHandler('questions:byDate',function(page){
    var questions = $.Deferred();
    if(page == undefined){
      page = 0;
    }
    $.getJSON(baseUrl+"/byDate?page=" + page).done(function(data){
      questions.resolve(data);
    });
    return questions.promise();
  });

  Dionysus.reqres.setHandler('questions:bySize',function(page){
    var questions = $.Deferred();
    if(page == undefined){
      page = 0;
    }
    $.getJSON(baseUrl+"/bySize?page=" + page).done(function(data){
      questions.resolve(data);
    });
    return questions.promise();
  });

  Dionysus.reqres.setHandler('questions:byTagName',function(name,page){
    var questions = $.Deferred();
    if(page == undefined){
      page = 0;
    }
    $.getJSON(baseUrl+"/bytagName/"+name + "?page="+page).done(function(data){
      questions.resolve(data);
    });
    return questions.promise();
  });

  Dionysus.reqres.setHandler('questions:answered',function(options){
    var questions = $.Deferred();

    var page = options.page || 0;
    var path = options.answered ? "/answered" : "/unanswered";
    $.getJSON(baseUrl + path + "?page="+page).done(function(data){
      questions.resolve(data);
    });
    return questions.promise();
  });

  Dionysus.reqres.setHandler('questions:popularTags',function(number){
    var tags = $.Deferred();
    $.getJSON(baseUrl+"/tags/topN?N="+number).done(function(data){
      tags.resolve(data);
    });
    return tags.promise();
  });

  Dionysus.reqres.setHandler('questions:question',function(id){
    var question = $.Deferred();
    $.getJSON(baseUrl+"/"+id).done(function(data){
      question.resolve(data);
    });
    return question.promise();
  });

  Dionysus.reqres.setHandler('questions:answers',function(qid){
    var answers = $.Deferred();
    $.getJSON(baseUrl+"/"+qid+"/answers").done(function(data){
      answers.resolve(data);
    });
    return answers.promise();
  });

})
