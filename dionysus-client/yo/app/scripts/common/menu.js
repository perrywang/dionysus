Dionysus.module('Entities', function(Entities, Dionysus, Backbone, Marionette, $) {
  'use strict';

  Entities.Menu = Backbone.Model.extend({
    urlRoot: '/api/v1/menus'
  });

  Entities.MenuCollection = Backbone.Collection.extend({
    url: '/api/v1/menus',
    parse: function(response) {
      return response._embedded.menus;
    },
    model: Entities.Menu
  });


  Entities.LinkModel = Backbone.Model.extend({
    initialize: function() {
      Backbone.Select.Me.applyTo( this );
    }
  });

  Entities.LinkCollection = Backbone.Collection.extend({
    model: Entities.LinkModel,
    initialize: function(models, options) {
      Backbone.Select.One.applyTo( this, models, options );
    }
  });

  Dionysus.reqres.setHandler('menu:entities', function() {
    var menus = new Entities.MenuCollection();
    var defer = $.Deferred();
    menus.fetch().then(function() {
      defer.resolve(menus);
    });
    return defer.promise();
  });
});

