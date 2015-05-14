Dionysus.module('Common.Views', function(Views, Dionysus, Backbone, Marionette, $, _) {

	Views.Loading = Marionette.ItemView.extend({
		template: "#loading-view"
	});

	Views.Page2Layout = Marionette.LayoutView.extend({
		template: "#page2-layout-tpl",
		/*regions: function(options) {
			return options.regions;
		},*/
		onRender: function() {
			var tpl = '<div class="row"><div class="column"><div class="ui segment" id="<%= region %>"></div></div></div>';
			for (var regionKey in this.regions) {
				var regionValue = this.regions[regionKey];
				var regionId = regionValue.slice(1, regionValue.length);
				this.$el.find('.ui.grid').append(_.template(tpl)({
					region: regionId
				}));
			}
		},
		onBeforeShow: function() {
			//show loading before get any data
			for (var region in this.regions) {
				this.getRegion(region).show(new Dionysus.Common.Views.Loading());
			}
		}

	});

	Views.Page2Segment = Marionette.LayoutView.extend({
		template: "#page2-sub-layout-tpl-doc-tpl",
		regions: {
			sec0: "#sec0",
			sec1: "#sec1",
			sec2: "#sec2",
			sec3: "#sec3",
			sec4: "#sec4"
		},
		onBeforeShow: function(){
			for(var i = 0; i < 5; i++){
				this.getRegion("sec" + i).show(new Dionysus.Common.Views.Page2Item({model: this.collection.models[i]}));
			}
			
		}

	});

	Views.Page2Item = Marionette.ItemView.extend({
		template: "#page2-item-tpl",
		tagName: "div",
		className: "ui items"
	});

});