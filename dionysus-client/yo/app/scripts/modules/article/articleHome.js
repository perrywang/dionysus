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
			blogSummary: "#blog",
			tag: "#tag",
			latest: "#latest"
		},

	});

	/*
		Region Views
	*/
	var SliderView = Marionette.ItemView.extend();

	var CategoryView = Marionette.ItemView.extend();

	var DocSummaryView = Marionette.ItemView.extend();

	var VideoSummaryView = Marionette.ItemView.extend();

	var BlogSummaryView = Marionette.ItemView.extend();

	var TagView = Marionette.ItemView.extend();

	var LatestView = Marionette.ItemView.extend();;



} );