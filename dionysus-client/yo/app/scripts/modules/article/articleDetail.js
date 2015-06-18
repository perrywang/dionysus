Dionysus.module('Article', function(Article, Dionysus, Backbone, Marionette) {
  'use strict';
  var baseTemplatePath = 'templates/home/article/';
  /*
  Layout
  */

  var LayoutView = Marionette.LayoutView.extend({
    tagName: 'div',
    className: 'layout-view',
    template: JST['templates/home/article/detailPage/detail'],
    regions: {
      detail: "#detail",
      tag: "#tag",
      latest: "#latest"
    },

    onBeforeShow: function() {
      var thisView = this;
      _.each(this.regions, function(regionId, regionName) {
        thisView.getRegion(regionName).show(new Dionysus.Common.Views.Loading());
      });
    },

  });

  /*
  View
  */



  var ArticleDetailView = Marionette.ItemView.extend({
    template: JST['templates/home/article/detailPage/detailContent'],
    //tagName: 'article',
    //className: 'ui centered grid article',

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

      var layoutView = new LayoutView();
      Dionysus.mainRegion.show(layoutView);

      //get detail value
      Dionysus.request('article:instance:excerpt', id).done(function(article) {

        var detail = new ArticleDetailView({
          model: article
        });
        layoutView.getRegion('detail').show(detail);
      });

      //get latest
      Dionysus.request('article:list:pageable', null, {
        sort: 'lastModifiedDate,desc',
        size: 5
      }).done(function(articles) {

        var latest = new Dionysus.Article.RegionSummaryView({
          template: JST[baseTemplatePath + 'articleLatest'],
          collection: articles
        });
        layoutView.getRegion('latest').show(latest);
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