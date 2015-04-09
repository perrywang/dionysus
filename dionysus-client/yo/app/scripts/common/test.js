Dionysus.module('Entities', function (Entities, Dionysus, Backbone, Marionette, $) {
  'use strict';

  Entities.PsychTest = Backbone.Model.extend({
    defaults: {
      'current': 0
    },
    urlRoot: '/api/v1/psychTests'
  });

  Entities.PsychTestItem = Backbone.Model.extend({
  });

  Entities.PsychTestItemCollection = Backbone.Collection.extend({
    model: Entities.PsychTestItem,
    url: '/api/v1/testitems',
    parse: function (response) {
      var embedded = response._embedded;
      return embedded ? embedded.testitems : [];
    },
    state: {
      firstPage: 0
    },
    queryParams: {
      currentPage: 'page',
      pageSize: 'size'
    }
  });

  Entities.PsychTestItemOption = Backbone.Model.extend({
    defaults: {
      selected: false
    }
  });

  Entities.PsychTestItemOptionCollection = Backbone.Collection.extend({
    model: Entities.PsychTestItemOption
  });

  Dionysus.reqres.setHandler('test:entity', function (id) {
    var test = new Entities.PsychTest({id: id});
    var defer = $.Deferred();
    test.fetch().then(function () {
      defer.resolve(test);
    });
    return defer.promise();
  });

  Dionysus.reqres.setHandler('testitem:entities', function () {

  });

})