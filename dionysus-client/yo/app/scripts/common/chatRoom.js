Dionysus.module('Entities', function(Entities, Dionysus, Backbone, Marionette, $){

	'use strict';

	var Room = Backbone.Model.extend({
		urlRoot: '/api/v1/rooms'
	});

});