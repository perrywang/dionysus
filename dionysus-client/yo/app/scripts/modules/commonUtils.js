Dionysus.module('Common.Views', function(Views, Dionysus, Backbone, Marionette, $, _) {

	Views.Loading = Marionette.ItemView.extend({
		template: "#loading-view"
	});

	Views.PageableItemView = Marionette.ItemView.extend({

		initialize: function(options){
			if(this.collection) this.listenTo(this.collection, 'add', this.render, this);
		},

		gotoPage: function(event, page){
			this.collection.getPage(page-1);
		},

		onRender: function() {
			var state = this.collection.state;
			var currentPage = state['currentPage'] + 1;
			var total = state['totalPages'] == 0 ? 1 : state['totalPages'];
			this.$('#paging').twbsPagination({
				totalPages: total,
				startPage: currentPage,
				visiblePages: 6,
				first: '第一页',
				prev: '前一页',
				next: '后一页',
				last: '最后一页',
				loop: true,
				onPageClick: function(event, page) {
					$(this).trigger("gotoPage", page);
				}
			});

		}

	});
});