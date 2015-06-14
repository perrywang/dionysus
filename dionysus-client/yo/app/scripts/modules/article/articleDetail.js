Dionysus.module('Article', function(Article, Dionysus, Backbone, Marionette) {
  'use strict';

  /*
  View
  */

  var ArticleDetailView = Marionette.ItemView.extend({
    template: JST['templates/home/article/detailPage/detail'],
    tagName: 'article',
    className: 'ui centered grid article',

    initialize: function() {
      this.listenTo(this.model.get('comments'), 'add', this.render, this);
    },

    onRender: function() {
      var x;
    },

    events: {
      'click .icon.button': function() {
        if (sessionStorage.getItem("user")) {
          var data = Backbone.Syphon.serialize(this);
          if (data.mycomment && data.mycomment != "") {
            this.model.newComment(data);
          }
        } else alert("你需要先登录");
      }
    }
  });


  /*
  Controller
  */

  var ArticleController = Marionette.Object.extend({

    showArticle: function(id) {
      //show loading before get any data
      Dionysus.mainRegion.show(new Dionysus.Common.Views.Loading());

      Dionysus.request('article:instance:excerpt', id).done(function(article) {
        Dionysus.mainRegion.show(new ArticleDetailView({
          model: article
        }));
      });

    }
  });

  Dionysus.on("before:start", function() {
    new Marionette.AppRouter({
      appRoutes: {
        'articles/:id': 'showArticle',
      },
      controller: new ArticleController()
    });
  });
});