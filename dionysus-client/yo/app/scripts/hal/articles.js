Dionysus.module('Domain', function(Domain, Dionysus, Backbone, Marionette, $) {
  var Category = Backbone.RelationalHalResource.extend({
    url: '/api/v1/categories'
  });

  var Comment = Backbone.RelationalHalResource.extend({
    url: '/api/v1/comments'
  });

  var Article = Backbone.RelationalHalResource.extend({
    relations: [{
      type: Backbone.HasOne,
      key: 'category',
      relatedModel: Category
    },
    {
      type: Backbone.HasMany,
      key: 'comments',
      relatedModel: Comment
    }],

    initialize: function(){
      this.set("mycomment",null);
    },

    newComment: function(data) {
      var userId = sessionStorage.getItem("user");
      var comment = new Comment({
        content: data.mycomment,
        article: this.link('self').href()
      });
      comment.save();
      comment.set("createdBy", {
        username: sessionStorage.getItem('username'),
        avatar: sessionStorage.getItem('avatar'),
        lastModifiedDate:{year:"刚刚"}
      })
      this.get("comments").add(comment, {at:0});
      this.trigger
    }

  });

  var CategoryCollection = Backbone.RelationalHalResource.extend({
    url: '/api/v1/categories',
    halEmbedded: {
      categories: {
        type: Backbone.HasMany,
        relatedModel: Category
      }
    },
    toSelection : function() {
      var categories = this.embedded('categories');
      return categories.map(function(category) {
        return {
          name : category.get('name'),
          link : category.link('self').href()
        }
      });
    }
  });

  var ArticleCollection = Backbone.RelationalHalResource.extend({
    url: '/api/v1/articles',
    halEmbedded: {
      articles: {
        type: Backbone.HasMany,
        relatedModel: Article
      }
    }
  });

  Dionysus.reqres.setHandler('category:instances', function() {
    var resources = new CategoryCollection(), defer = $.Deferred();
    resources.fetch().then(function() {
      defer.resolve(resources);
    });
    return defer.promise();
  });

  Dionysus.reqres.setHandler('category:instance', function(id) {
    var category = Category.findOrCreate({
      id : id,
      _links : { self: { href : '/api/v1/categories/' + id } }
    }), defer = $.Deferred();

    category.fetch().then(function() {
      defer.resolve(category);
    });
    return defer.promise();
  });

  Dionysus.reqres.setHandler('article:instances', function(pageId,size) {
    var resources = new ArticleCollection(), defer = $.Deferred();
    var pageX = pageId ? pageId : 0;
  
    resources.fetch({ data: { projection: 'summary', page: pageX, size:size }}).then(function() {
      defer.resolve(resources);
    });
    return defer.promise();
  });

  Dionysus.reqres.setHandler('article:instances:page', function(pageId) {
    var resources = new ArticleCollection(), defer = $.Deferred();
    resources.fetch({data: { projection: 'summary', page: pageId}}).then(function(){
      defer.resolve(resources);
    });
    return defer.promise();
  });

  Dionysus.reqres.setHandler('article:instance:excerpt', function(id){
    var article = Article.findOrCreate({
      id : id,
      _links : { self : { href: '/api/v1/articles/'+id } }
    }), defer = $.Deferred();

    article.fetch({data:{ projection: 'excerpt'}}).then(function(){
      defer.resolve(article);
    });

    return defer.promise();

  })

  Dionysus.reqres.setHandler('article:instance', function(id) {
    var article = Article.findOrCreate({
      id : id,
      _links : { self: { href : '/api/v1/articles/' + id } }
    }), defer = $.Deferred();

    article.fetch({ data: { projection: 'details'}}).then(function() {
      article.link('category').fetchResource().then(function(data) {
        var category = data._links.self.href;
        article.set('category', category);
        defer.resolve(article);
      });
    });
    return defer.promise();
  });
});