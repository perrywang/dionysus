Dionysus.module('Common.Views', function(Views, Dionysus, Backbone, Marionette, $, _) {

	Views.Loading = Marionette.ItemView.extend({
		template: "#loading-view"
	});

	Views.Page2Layout = Marionette.LayoutView.extend({
		template: "#page2-layout-tpl",
		className: 'container ui basic center aligned segment',
		onRender: function() {
			var tpl = '<div class="row"><div class="column"><div class="ui segment" id="<%= region %>"></div></div></div>';
			var thisView = this;
			_.each( this.regions, function(regionValue){
				var regionId = regionValue.slice(1, regionValue.length);
				thisView.$el.find('#gridrows').append(_.template(tpl)({
					region: regionId
				}));
			});
		},
		onBeforeShow: function() {
			//show loading before get any data
			for (var region in this.regions) {
				this.getRegion(region).show(new Dionysus.Common.Views.Loading());
			}
		},
		onDomRefresh: function(){
			$('.ui.sticky')
			.sticky({
				context: '#main'
			});

		}

	});

	Views.Page2Segment = Marionette.LayoutView.extend({
		template: "#page2-sub-layout-tpl-doc-tpl",
		regions: {
			slides: "#slides",
			sec0: "#sec0",
			sec1: "#sec1",
			sec2: "#sec2",
			sec3: "#sec3"
		},
		onBeforeShow: function(){
			
			var segView = this;
			//get models for slides
			var secModels = this.collection.models.slice(3);

			//initial slides view
			this.getRegion('slides').show(new Dionysus.Common.Views.Page2Slides({collection: this.collection}));
			this.$('.flexslider').flexslider();

			
			//show rest models for the rest sections
			_.each(secModels, function(model, idx){
				var region = segView.getRegion("sec" + idx);
				if(region) region.show(new Dionysus.Common.Views.Page2Item({model: model}));	
			});
			
		}

	});

	Views.Page2Item = Marionette.ItemView.extend({
		template: "#page2-item-tpl",
		tagName: "div",
		className: "ui items"
	});

	Views.Page2Slides = Marionette.ItemView.extend({
		template: '#page2-slides-tpl',
		className :'flexslider'
	});

});