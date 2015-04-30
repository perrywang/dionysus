Dionysus.module('Common.Views', function(Views, Dionysus, Backbone, Marionette, $, _) {

	Views.Loading = Marionette.ItemView.extend({
		template: "#loading-view"
	})

	
	var MyController = Marionette.Controller.extend({
		testloading:function(){
			var loadingView = new Dionysus.Common.Views.Loading();
			alert("hehe");
		}
	})

	var myRoute = new Marionette.AppRouter({
		appRoutes:{
			"testloading(/)":"testloading"
		},
		controller:new MyController()	
	})

});
