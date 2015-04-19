Dionysus.module('Consultant', function(Consultant, Dionysus, Backbone, Marionette) {
  'use strict';

  var ConsultantView = Marionette.ItemView.extend({ 
    template: '#consultant-tpl',
    tagName: 'li',
    className: 'item',
    ui: {
      button: '.button'
    },
    events: {
      "click @ui.button" : "openAppointment"
    },
    openAppointment : function(e){
      this.trigger("consultant:newAppointment", this.model);
      var appointment = this.$el.form('get values', ['date', 'approach', 'reason']);
      alert(appointment.date + appointment.approach+appointment.reason);
      //TODO: do the actual post action, no current user info, and reference is link.
    }
  });

  var ConsultantsView = Marionette.CompositeView.extend({
    template: '#consultants-tpl',
    childView: ConsultantView,
    childViewContainer: '.items',
    className: 'ui page',
    onDomRefresh:function(){
      this.$('.ui.accordion').accordion();
    }
  });

  var ConsultantController = Marionette.Controller.extend({
    showConsultants: function () {
      var fetchingConsultants = Dionysus.request('consultant:entities');
      $.when(fetchingConsultants).done(function(consultants) {
        var consultantsView = new ConsultantsView({ collection: consultants });
        consultantsView.on("consultant:newAppointment", function(data){
          alert("newAppointment Called!");
        })
        Dionysus.mainRegion.show(consultantsView);
      });
    },
  });

  Dionysus.addInitializer(function() {
    new Marionette.AppRouter({
      appRoutes : {
        'consultants(/)': 'showConsultants',
      //  'consultants/:id(/)': 'showConsultant'
      },
      controller: new ConsultantController()
    });
  });
});
