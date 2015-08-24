Dionysus.module('Organization', function(Organization, Dionysus, Backbone, Marionette){

  var api = '/api/v1';

  var baseTemplatePath = 'templates/home/organization';

  var HomeView = Marionette.ItemView.extend({
    initialize: function (options) {
      this.pagedorganizations = options.pagedorganizations;
    },
    serializeData: function () {
      return this.pagedorganizations.content;
    },

    template: function (data) {
      var template = JST[baseTemplatePath + '/home'];
      var html = template({organizations:data});
      return html;
    },
    onRender : function(){
      this.$('#adding').on('click',function(){
        $.getJSON(api+'/currentuser').done(function(user){
          Dionysus.navigate('/organizations/'+user.id+'/apply',true);
        });
      });
    }
  });

  var DetailView = Marionette.ItemView.extend({
    initialize: function (options) {
      this.organization = options.organization;
      this.pagedblogs = options.pagedblogs;
    },
    serializeData: function () {
      return this;
    },

    template: function (data) {
      var template = JST[baseTemplatePath + '/detail'];

      var html = template({organization:data.organization,blogs:data.pagedblogs.content});
      return html;
    }
  });

  var SubmitView = Marionette.ItemView.extend({
    initialize: function (options) {
      this.user = options.user;
    },
    serializeData: function () {
      return this.user;
    },
    template: function (user) {
      var template = JST[baseTemplatePath + '/form'];
      var html = template(user);
      return html;
    },
    onRender : function(){
      var that = this;
      this.$('#applyForm').form('set values',this.user);
      this.$('.submit').on('click',function(){
        var applyingUser = $('#applyForm').form('get values');
        $.extend(that.user,applyingUser);
        $.ajax({
          type: "POST",
          url: "/controllers/organizations",
          data: JSON.stringify(that.user),
          success: function(data){
            toastr.success("提交申请成功!");
          },
          dataType: "json",
          contentType: "application/json"
        });
      });
    }
  });

  var OrganizationController = Marionette.Controller.extend({
    showOrganizationHome: function(){
      Dionysus.mainRegion.show(new Dionysus.Common.Views.Loading());
      $.when(Dionysus.request('organization:entities')).done(function(organizations){
        var home = new HomeView({pagedorganizations:organizations});
        Dionysus.mainRegion.show(home);
      });
    },
    showOrganization:function(id){
      Dionysus.mainRegion.show(new Dionysus.Common.Views.Loading());
      $.when(Dionysus.request('organization:entity',id),Dionysus.request('organization:blogs',{id:id})).done(function(organization,blogs){
        var detail = new DetailView({organization:organization,pagedblogs:blogs});
        Dionysus.mainRegion.show(detail);
      });
    },
    joinOrganization:function(id){
      Dionysus.mainRegion.show(new Dionysus.Common.Views.Loading());
      $.getJSON('/controllers/organizations/' + id).done(function(user){
        var submitForm = new SubmitView({user:user});
        Dionysus.mainRegion.show(submitForm);
      });
    }
  });
  Dionysus.addInitializer(function () {
    new Marionette.AppRouter({
      appRoutes: {
        'organizations(/)': 'showOrganizationHome',
        'organizations/:id/apply(/)' : 'joinOrganization',
        'organizations/:id(/)' : 'showOrganization'
      },
      controller: new OrganizationController()
    });
  });
});
