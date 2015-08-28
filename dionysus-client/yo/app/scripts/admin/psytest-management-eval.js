Dionysus.module('PsychTestEval', function (PsychTestEval, Dionysus, Backbone, Marionette, $) {

	PsychTestEval.ViewFactory = function(testName, model){
		switch (testName) {
			case "16PF":
				return new PF16View({model:model});
			default:
				return new DefaultView({model:model});
		}
	}

	var PF16View = Marionette.ItemView.extend({
		template: JST['templates/admin/psychtests/eval/16PF'],
		initialize: function(){
			Handlebars.registerHelper("get_normal_score", function(score){
				string = "";
				for(var i=1; i<11; i++){
					if(score == i) string += '<td><i class="green checkmark icon"></i></td>';
					else string += '<td></td>';
				}
				return new Handlebars.SafeString(string);
			});
		}
	});

	var DefaultView = Marionette.ItemView.extend({
		template: JST['templates/admin/psychtests/eval/default'],
		tagName: 'table',
    	className: 'ui celled striped table',
		serializeData: function(){
			var data = this.model.toJSON();
			var items = [];

			_.each(data, function(value, key) {
				if (key != "id") {
					items.push({
						key: key,
						value: value
					});
				}

			});

			return {items:items};
		}
	});


	var Controller = Marionette.Object.extend({
		calcResult: function(tname, id) {

			Dionysus.request('psychtestresult:evaluate', id).done(function(result) {
				var view = PsychTestEval.ViewFactory(tname, result);
				Dionysus.mainRegion.show(view);
			});

		}
	});

	Dionysus.on("before:start", function(){
		new Marionette.AppRouter({
			appRoutes: {
				'admin/psychotestresult/calc/tname=:tname&rid=:id': 'calcResult'
			},
			controller: new Controller()
		});
	});
});