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

  var HeaderView = Marionette.ItemView.extend({
    template: "#admin-header-tpl",
    tagName: "li",
    className: "item",
    initialize: function() {
      this.model.on('selected', this.onRender, this);
      this.model.on('deselected', this.onRender, this);
    },
    events: {
      "click a" : "navigateMenu"
    },
    navigateMenu: function(e) {
      this.model.select();
    },
    onRender: function() {
      if (this.model.selected) {
        this.$el.addClass('active');
      } else {
        this.$el.removeClass('active');
      }
    }
  }); 

  var HeadersView = Marionette.CompositeView.extend({
    template: '#admin-headers-tpl',
    childView: HeaderView,
    childViewContainer: '.menu',
    tagName: 'nav'
  });

  Dionysus.addInitializer(function() {
    Dionysus.headerRegion.show(new HeadersView({collection: headers}));
  });
});

Dionysus.start();