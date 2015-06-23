Dionysus.module('Domain', function(Domain, Dionysus, Backbone, Marionette, $) {
  
  var Category = Backbone.RelationalHalResource.extend({
    url: '/api/v1/categories',
    toJSON: function(options) {
      if (options && options.useRelationUri) return this.url + '/' + this.id;
      else return {
        id: this.get('id'),
        name: this.get('name')
      }
    }
  });

  var Comment = Backbone.RelationalHalResource.extend({
    url: '/api/v1/comments'
  });

  Domain.Comment = Comment;

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
          link : category.link('self').href(),
          id: category.id
        }
      });
    }
  });

  var ArticleCollection = Backbone.RelationalHalResource.extend({
    
    url: '/api/v1/officialArticles',

    initialize: function(options){
      if(options && options.searchMethod) this.url += '/search/'+options.searchMethod;
    },

    halEmbedded: {
      officialArticles: {
        type: Backbone.HasMany,
        relatedModel: Article
      }
    }
  });

  var ArticleModel = Backbone.Model.extend({
    urlRoot: '/api/v1/officialArticles'
  });
  var ArticlePageableCollection = Backbone.PageableCollection.extend({
    
    url: '/api/v1/officialArticles',

    initialize: function(options){
      if(options && options.searchMethod) this.url += '/search/'+options.searchMethod;
      _.extend(this.queryParams, options.criteria);
    },

    model: ArticleModel,
    state: {
      firstPage : 0,
      currentPage: 0, 
      pageSize:10
    },
    queryParams: {
      currentPage: "page",
      pageSize: "size",
      totalPages: null,
      totalRecords: null
    },

    parseRecords: function(resp){
      var embedded = resp._embedded;
      return embedded ? embedded.officialArticles : [];
    },

    parseState: function(resp) {
      var page = resp.page;
      return {
        currentPage: page.number,
        pageSize: page.size,
        totalPages: page.totalPages,
        totalRecords: page.totalElements
      }
    }
  });

  Domain.ArticlePageableCollection = ArticlePageableCollection;

/*
"page" : {
    "size" : 20,
    "totalElements" : 31,
    "totalPages" : 2,
    "number" : 1
  }

*/
  /*
    Request Handler
  */


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
      _links : { self : { href: '/api/v1/officialArticles/'+id } }
    }), defer = $.Deferred();

    article.fetch({data:{ projection: 'excerpt'}}).then(function(){
      defer.resolve(article);
    });

    return defer.promise();

  });

/*
  Used for article home page summary articles.
*/
  Dionysus.reqres.setHandler('article:search:summary', function(searchMethod, criteria) {
    
    if(!criteria) criteria={};

    var resources = new ArticleCollection({
      searchMethod : searchMethod
    }),
      defer = $.Deferred();

    criteria['projection'] = 'read';

    resources.fetch({
      data: criteria
    }).then(function() {
      defer.resolve(resources);
    });

    return defer.promise();
  });

  Dionysus.reqres.setHandler('article:list:pageable', function(searchMethod, criteria){
    if(!criteria) criteria={};
    criteria['projection'] = 'read';
    var resources = new ArticlePageableCollection({
      searchMethod : searchMethod,
      criteria:criteria
    }),
      defer = $.Deferred();

    resources.fetch().then(function() {
      defer.resolve(resources);
    });

    return defer.promise();
  });

  Dionysus.reqres.setHandler('article:instance', function(id) {
    var article = Article.findOrCreate({
      id : id,
      _links : { self: { href : '/api/v1/officialArticles/' + id } }
    }), defer = $.Deferred();



    article.fetch().then(function() {
      article.link('category').fetchResource().then(function(data) {
        var category = Category.findOrCreate({id:data.id});
        article.set('category', category);
        defer.resolve(article);
      });
    });
    return defer.promise();
  });
});