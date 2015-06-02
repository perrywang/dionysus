Dionysus.module('Domain', function(Domain, Dionysus, Backbone, Marionette, $){
/*
Entites
*/
	var Blog = Backbone.RelationalHalResource.extend({
		relations:[{
			type: "HasMany",
			key: "comments",
			relatedModel: Dionysus.Domain.Comment
		}],

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
		var blog = Blog.findOrCreate({
				id: id
			}),
			defer = $.Deferred();
		blog.fetch().then(function() {
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