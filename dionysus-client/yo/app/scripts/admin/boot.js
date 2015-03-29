Dionysus.module('DionysusApp.AdminHeader', function(Header, Dionysus, Backbone, Marionette, $) {
  var HeaderModel = Backbone.Model.extend({
    initialize: function() {
      Backbone.Select.Me.applyTo( this );
    }
  });

  var HeaderCollection = Backbone.Collection.extend({
    model: HeaderModel,
    initialize: function(models, options) {
      Backbone.Select.One.applyTo( this, models, options );
    }
  });

  var headers = new HeaderCollection([
    { name: "Home", href: "/admin", icon: "home" }, 
    { name: "Articles", href: "/admin/articles", icon: "edit" }, 
    { name: "Categories", href: "/admin/categories", icon: "inbox" }, 
    { name: "Tests", href: "/admin/tests", icon: "lab" }
  ]);

  var LinkView = Marionette.ItemView.extend({
    template: "#admin-header-tpl",
    className: "item",
    tagName: 'a',
    attributes: function() {
      return {
        href: this.model.get('href')
      };
    },
    modelEvents: {
      "selected": "onRender",
      "deselected": "onRender"
    },
    events: {
      "click" : "navigateMenu"
    },
    navigateMenu: function(e) {
      this.model.select();
    },
    onRender: function() {
      this.$el.toggleClass('active', !!this.model.selected);
    }
  }); 

  var HeaderView = Marionette.CollectionView.extend({
    childView: LinkView,
    className: 'ui menu',
    tagName: 'nav'
  });

  Dionysus.addInitializer(function() {
    Dionysus.headerRegion.show(new HeaderView({collection: headers}));
  });
});

Dionysus.start();