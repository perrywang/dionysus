Dionysus.module('Entities', function(Entities, Dionysus, Backbone, Marionette, $) {

'use strict';

var RoomModel = Backbone.Model.extend({
	urlRoot: '/api/v1/rooms'
});

var RoomPageableCollection = Backbone.PageableCollection.extend({

	url: '/api/v1/rooms',

	initialize: function(options) {
		if (options && options.searchMethod) this.url += '/search/' + options.searchMethod;
		_.extend(this.queryParams, options.criteria);
	},

	model: RoomModel,

	state: {
		firstPage: 0,
		currentPage: 0,
		pageSize: 10
	},

	queryParams: {
		currentPage: "page",
		pageSize: "size",
		totalPages: null,
		totalRecords: null
	},

	parseRecords: function(resp) {
		var embedded = resp._embedded;
		return embedded ? embedded.rooms : [];
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


Dionysus.reqres.setHandler('rooms:list:pageable', function(searchMethod, criteria){
	var resourses = new RoomPageableCollection({
		searchMethod: searchMethod,
		criteria: criteria
	}), defer = $.Deferred();

	resourses.fetch().then(function(){
		defer.resolve(resourses);
	});

	return defer.promise();

});

});