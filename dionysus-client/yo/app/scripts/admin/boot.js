Dionysus.module('DionysusApp.AdminHeader', function(Header, Dionysus, Backbone, Marionette, $) {
  var HeaderModel = Backbone.Model.extend({
    initialize: function() {
      var selectable = new Backbone.Picky.Selectable(this);
      _.extend(this, selectable);
    }
  });

  var HeaderCollection = Backbone.Collection.extend({
    model: HeaderModel,
    initialize: function() {
      var singleSelect = new Backbone.Picky.SingleSelect(this);
      _.extend(this, singleSelect);
    }
  });

  var headers = new HeaderCollection([
    { name: "Home", href: "/admin", icon: "home" }, 
    { name: "Articles", href: "/admin/articles", icon: "edit" }, 
    { name: "Categories", href: "/admin/categories", icon: "inbox" }, 
    { name: "Tests", href: "/admin/tests", icon: "lab" }
  ]);

  headers.models[0].selected=true;

  var HeaderView = Marionette.ItemView.extend({
    template: "#admin-header-tpl",
    tagName: "li",
    className: "item",
    initialize: function() {
      this.model.on('selected', this.onRender, this);
      this.model.on('deselect', this.onRender, this);
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