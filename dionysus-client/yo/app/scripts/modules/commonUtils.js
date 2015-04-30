Dionysus.module('Common.Views', function(Views, Dionysus, Backbone, Marionette, $, _) {

	Views.Loading = Marionette.ItemView.extend({
		template: "#loading-view"
	})

	
	var MyController = Marionette.Controller.extend({
		testloading:function(){
			var loadingView = new Dionysus.Common.Views.Loading();
			Dionysus.mainRegion.show(loadingView);
		}
	})


	Dionysus.on("before:start",function(){
		new Marionette.AppRouter({
		appRoutes:{
			"admin/testloading(/)":"testloading"
		},
		controller: new MyController()	
	})
	})

});
