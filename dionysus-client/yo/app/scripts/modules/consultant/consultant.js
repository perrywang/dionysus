Dionysus.module('Consultant', function(Consultant, Dionysus, Backbone, Marionette) {
  'use strict';

  var ConsultantView = Marionette.ItemView.extend({
    template: JST['templates/home/consultant/consultantHome'],
    //tagName: 'li',
    //className: 'item',
    ui: {
      button: '.button'
    },
    events: {
      "click @ui.button": "openAppointment"
    },
    openAppointment: function(e) {
      var appointmentData = this.$el.form('get values');
      this.trigger("consultant:newAppointment", appointmentData);

      //leave server to get user from login session not here
      /* appointmentData.user = Dionysus.Entities.User.prototype.urlRoot + '/' + sessionStorage.user;
       appointmentData.consultant = this.model.url();
       var appointment = Dionysus.request('appointment:new');
       appointment.save(appointmentData).then(function(){
         toastr.info('预约提交成功，请等待咨询师稍后回复！');
       });*/
    }
  });

  var ConsultantsView = Marionette.CompositeView.extend({
    template: '#consultants-tpl',
    childView: ConsultantView,
    childViewContainer: '.items',
    className: 'ui center aligned page grid',
    onDomRefresh: function() {
      this.$('.ui.accordion').accordion();
    },
    onRender: function() {
      this.$('.ui.dropdown').dropdown();
      this.$('#appointmentDate').datetimepicker({
        lang: 'zh',
        step: 30
      });
    }
  });



  var Layout = Marionette.LayoutView.extend({

    template: JST['templates/home/consultant/consultantHome'],

    regions: {
      expertise: '#expertise',
      list: '#list'
    },

    onBeforeShow: function() {
      var thisView = this;
      _.each(this.regions, function(regionId, regionName) {
        thisView.getRegion(regionName).show(new Dionysus.Common.Views.Loading());
      });
    },

    childEvents: {
      "expertise:filter": function(childView, expertise) {
        this.getRegion("list").currentView.filterByExpertise(expertise);
      }
    }

  });

  var List = Marionette.ItemView.extend({
    template: JST['templates/home/consultant/consultantList'],

  });

//try to use item view to handle the page render shit
//
//
//try to use item view to handle the page render shit

  var ConsultantHomeView = Marionette.LayoutView.extend({
    
    template: JST['templates/home/consultant/consultantHome'],
    tagName: "div",
    className: "layout-view",

    initialize: function(options){
      this.expertises = options.expertises;
      this.expertise = options.expertise;
      this.listenTo(this.collection, 'add', this.render, this);
    },

    serializeData: function(){
      return {
        items: this.collection.toJSON(),
        expertise: this.expertise,
        expertises: this.expertises.toJSON()
      }
    },

    events: {
      "gotoPage" : function(page){
        this.collection.getPage(page-1);
      }
    },

    onRender: function(){
      var state = this.collection.state;
      this.$('#paging').twbsPagination({
        totalPages: state['totalPages'],
        startPage: state['currentPage']+1,
        visiblePages: 6,
        first: '第一页',
            prev: '前一页',
            next: '后一页',
            last: '最后一页',
            loop:true,
            onPageClick: function(event, page){
              $(this).trigger("gotoPage", page);
            }
      });
    }
  });

  var ConsultantDetailView = Marionette.ItemView.extend({
    template: JST['templates/home/consultant/consultantDetail'],

  });




  var ConsultantController = Marionette.Controller.extend({

    showConsultants: function() {
      /*var fetchingConsultants = Dionysus.request('consultant:entities');
      $.when(fetchingConsultants).done(function(consultants) {
        var consultantsView = new ConsultantsView({ collection: consultants.embedded('consultants') });
        Dionysus.mainRegion.show(consultantsView);
      });*/

      $.when(Dionysus.request("consultant:search:pageable"), Dionysus.request("consultant:expertises")).done(function(consultants, expertises){
        var view = new ConsultantHomeView({
          expertise: "全部",
          expertises: expertises,
          collection: consultants
        }); 
        Dionysus.mainRegion.show(view);
      });
    },

    filterConsultants: function(expertiseValue) {
      Dionysus.request("consultant:search:pageable","findConsultantsByExpertise",{expertise:expertiseValue}).done(function(consultants){

        var view = new ConsultantHomeView({
          expertise: expertiseValue,
          collection: consultants
        });

        Dionysus.mainRegion.show(view);

      });
    },

    showConsultantDetail: function(id) {
      Dionysus.request("consultant:detail", id).done(function(consultant){
        var view = new ConsultantDetailView({
          model: consultant
        });
        Dionysus.mainRegion.show(view);
      });
    }
  });

  Dionysus.addInitializer(function() {
    new Marionette.AppRouter({
      appRoutes: {
        'consultants(/)': 'showConsultants',
        'consultants/list/:expertise': 'filterConsultants',
        'consultants/:id(/)': 'showConsultantDetail'
      },
      controller: new ConsultantController()
    });
  });
});