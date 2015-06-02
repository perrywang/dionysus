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
      var appointmentData = this.$el.form('get values');
      this.trigger("consultant:newAppointment", appointmentData);
      appointmentData.user = Dionysus.Entities.User.prototype.urlRoot + '/' + sessionStorage.user;
      appointmentData.consultant = this.model.url();
      var appointment = Dionysus.request('appointment:new');
      appointment.save(appointmentData).then(function(){
        alert("预约提交成功，请等待咨询师稍后回复!");
        //toastr.info('预约提交成功，请等待咨询师稍后回复！');
      });
    }
  });

  var ConsultantsView = Marionette.CompositeView.extend({
    template: '#consultants-tpl',
    childView: ConsultantView,
    childViewContainer: '.items',
    className: 'ui center aligned page grid',
    onDomRefresh:function(){
      this.$('.ui.accordion').accordion();
    }
  });

  var ConsultantController = Marionette.Controller.extend({
    showConsultants: function () {
      var fetchingConsultants = Dionysus.request('consultant:entities');
      $.when(fetchingConsultants).done(function(consultants) {
        var consultantsView = new ConsultantsView({ collection: consultants.embedded('consultants') });
        Dionysus.mainRegion.show(consultantsView);
      });
    }
  });

  Dionysus.addInitializer(function() {
    new Marionette.AppRouter({
      appRoutes : {
        'consultants(/)': 'showConsultants'
      //  'consultants/:id(/)': 'showConsultant'
      },
      controller: new ConsultantController()
    });
  });
});
