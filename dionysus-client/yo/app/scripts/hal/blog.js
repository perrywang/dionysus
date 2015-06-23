Dionysus.module('Domain', function(Domain, Dionysus, Backbone, Marionette, $){
/*
Entites
*/
	var Blog = Backbone.RelationalHalResource.extend({
		url: '/api/v1/blogs',
		relations: [{
			type: "HasMany",
			key: "comments",
			relatedModel: Dionysus.Domain.Comment
		}],
		initialize: function(options) {
			if (options && options.id) this.url += "/" + options.id;
		},
		newComment: function(data) {
			var userId = sessionStorage.getItem("user");
			var comment = new Dionysus.Domain.Comment({
				content: data.mycomment,
				article: this.link('self').href()
			});
			comment.save();
			comment.set("createdBy", {
				username: sessionStorage.getItem('username'),
				avatar: sessionStorage.getItem('avatar'),
				lastModifiedDate: {
					year: "刚刚"
				}
			})
			this.get("comments").add(comment, {
				at: 0
			});

		}

	});

	var BlogModel = Backbone.Model.extend({
		url: '/api/v1/blogs',
		initialize: function(options) {
			if (options && options.id) this.url += "/" + options.id;
		}
	});

/*
Collection
*/

	var BlogCollection = Backbone.RelationalHalResource.extend({
		url: '/api/v1/blogs',
		halEmbedded: {
			blogs: {
				type: 'HasMany',
				relatedModel: Blog
			}
		}
	});

/*
Reqeust Handler
*/

	Dionysus.reqres.setHandler('blog:item', function(id) {
		/*var blog = new BlogModel({
				id: id
			}),*/
		var blog = Blog.findOrCreate({
			id:id
		})
			defer = $.Deferred();
		blog.fetch(/*{
			data: {
				projection: "detail"
			}
		}*/).then(function() {
			defer.resolve(blog);
		});

		return defer.promise();
	});

	Dionysus.reqres.setHandler('blog:list', function(page, size) {
		var blogResources = new BlogCollection(),
			defer = $.Deferred();
		var pageNumber = page ? page : 0;

		blogResources.fetch({
			data: {
				projection: 'blogsummary',
				page: pageNumber,
				size: size
			}
		}).then(function() {
			defer.resolve(blogResources);
		});
		return defer.promise();
	});

	Dionysus.reqres.setHandler('blog:user',
		function(userId, page, size) {
			var blogResources = new BlogCollection({
				url: "/api/v1/blogs/search/findByCreatedBy"
			});
			var defer = $.Deferred();

			blogResources.fetch({
				data: {
					author: userId,
					size: size,
					page: page
				}
			}).then(function(blogs) {
				defer.resolve(blogs)
			});

			return defer.promise();

		});


} );