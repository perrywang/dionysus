Dionysus.module('Article', function(Article, Dionysus, Backbone, Marionette){

	'use strict';
	/*
		Layout: Article Home
	*/
	var Layout = Marionette.LayoutView.extend({
		//TODO template:"?"
		regions: {
			slider: "#slider",
			category: "#category",
			docSummary: "#doc",
			videoSummary: "#video",
			blogSummary: "blog",
			tag: "#tag",
			latest: "#latest"
		},

	});



} );