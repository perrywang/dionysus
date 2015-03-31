Dionysus.module('Common', function(Common, Dionysus, Backbone, Marionette, $) {
  'use strict';

  var LinkView = Marionette.ItemView.extend({
    template: _.template('<% if(this.icon) { %><i class="icon <%= icon %>"></i><% } %><%= name %>'),
    className: 'item',
    tagName: 'a',
    attributes: function() {
      return { href: this.model.get('href') };
    },
    modelEvents: {
      'selected': 'onRender',
      'deselected': 'onRender'
    },
    events: {
      'click' : 'navigateMenu'
    },
    navigateMenu: function() {
      // this.model.select();
    },
    onRender: function() {
      this.$el.toggleClass('active', !!this.model.selected);
    }
  });

  Common.HeaderView = Marionette.CollectionView.extend({
    childView: LinkView,
    className: 'ui menu',
    tagName: 'nav'
  });
});