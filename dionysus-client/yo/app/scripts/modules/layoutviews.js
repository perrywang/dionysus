Dionysus.module('Common.Views', function(Views, Dionysus, Backbone, Marionette, $, _){

	Views.Layout1 = Marionette.LayoutView.extend({
		template: '#layout1-tpl',
		className: 'ui page centered grid',
		onBeforeShow: function(){
			this.$('.flexslider').flexslider();
		}

	});

	Views.ItemListLayout = Marionette.LayoutView.extend({
		template: '#item-list-layout',
		className: 'ui page grid'
	});
});
