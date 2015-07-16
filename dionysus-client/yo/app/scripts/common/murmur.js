Dionysus.module('Entities', function(Entities, Dionysus, Backbone, Marionette, $) {
  'use strict';

  var baseUrl = '/controllers/murmurs';

  Dionysus.reqres.setHandler('murmurs',function(options){
    var murmurs = $.Deferred();
    var page = options.page || 0;
    $.getJSON(baseUrl+"?page=" + page).done(function(data){
      murmurs.resolve(data);
    });
    return murmurs.promise();
  });

  Dionysus.reqres.setHandler('murmurs:me',function(options){
    var murmurs = $.Deferred();
    var page = options.page || 0;
    $.getJSON(baseUrl+"/me?page=" + page).done(function(data){
      murmurs.resolve(data);
    });
    return murmurs.promise();
  });

});
