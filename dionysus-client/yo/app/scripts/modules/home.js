Dionysus.module('Home', function(Home, Dionysus, Backbone, Marionette) {
  'use strict';

  var ModuleView = Marionette.ItemView.extend({
    template: JST["templates/home/modules/module"],
    className: 'card fluid'
  });

  var ModulesView = Marionette.CollectionView.extend({
    childView: ModuleView,
    childViewContainer: '.cards',
    className : 'ui three doubling cards'
  });

  var HomeController = Marionette.Controller.extend({
    showHome: function() {
      var fetching = Dionysus.request('module:entities');
      $.when(fetching).done(function(modules) {
        Dionysus.mainRegion.show(new ModulesView({ collection: modules }));
      });
    }
  });

  Home.HeaderLoginView = Marionette.ItemView.extend({
    template: JST["templates/home/header/login"],
    tagName: 'nav',
    className: 'ui menu',
    serializeData: function(){
      return {
        "id": sessionStorage.getItem("user")
      }
    },
    onShow: function(){
      if(!sessionStorage.getItem('role') || sessionStorage.getItem('role') != "ROLE_ADMIN"){
        this.$el.form().find('#adminentry').remove();
      }
    },
    ui: {
      'adminlink': '#adminlink'
    },
    events: {
      'click @ui.adminlink': 'jumpToAdmin'
    },
    jumpToAdmin: function(){
      window.open(window.location.origin + '/admin');
    }
  });

  
  
  Home.HeaderView = Marionette.ItemView.extend({
    template: JST["templates/home/header/nav"],
    tagName: 'nav',
    className: 'ui menu',
    ui:{
      login: '#login'
    },
    events:{
      'click @ui.login': 'triggerLogin'
    },
    triggerLogin: function(){
      Dionysus.trigger('login');
    }
  });

  var FooterView = Marionette.ItemView.extend({
    template: JST["templates/home/footer"],
    className : 'ui segment'
  });

  Home.LoginModalView = Marionette.ItemView.extend({
    template: JST["templates/home/header/modal"],
    className : 'ui modal',
    events : {
      'click #register' : function() {
        this.$el.modal('hide');
        Dionysus.navigate('/register', { trigger: true });
      },
      'click #loginbutton' : 'login'
    },
    login : function() {
      var dialog = this;
      // already have semantic form validation
      var user = {
        username: this.$('#name').val(),
        password: this.$('#pass').val()
      };
      $.ajax({
        url: '/api/v1/login',
        method: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(user)
      }).done(function(response) {
        var data = response.id;
        var roles = response.roles;
        sessionStorage.setItem("authorized", "enabled");
        sessionStorage.setItem("user", data);
        for (var i = roles.length - 1; i >= 0; i--) {
          if (roles[i].name === 'ROLE_ADMIN')
            sessionStorage.setItem('role',roles[i].name);
        };

        dialog.$el.modal('hide');
        Dionysus.navigate('/site', { trigger: true });
        Dionysus.mainNavRegion.show(new Dionysus.Home.HeaderLoginView());
      }).fail(function() {
        window.alert('登录失败，请确认用户名或密码正确...');
      });
    },
    onRender: function() {
      this.$el.form({
        username: {
          identifier: 'username',
          rules: [{ type: 'empty', prompt: '输入用户名' }]
        },
        password: {
          identifier: 'password',
          rules: [{ type: 'empty', prompt: '输入密码' }]
        }
      });

      this.$el
        .modal('setting','transition','horizontal flip')
        .modal('show');
    }
  });

  Dionysus.addInitializer(function() {
    if (sessionStorage.getItem("authorized") === "enabled") {
      Dionysus.mainNavRegion.show(new Dionysus.Home.HeaderLoginView());
    } else {
      Dionysus.mainNavRegion.show(new Dionysus.Home.HeaderView());
    }

    Dionysus.footerRegion.show(new FooterView());
    Dionysus.on("login",function(){
      Dionysus.dialogRegion.show(new Dionysus.Home.LoginModalView());
    });
  });


  Dionysus.addInitializer(function() {
    new Marionette.AppRouter({
      appRoutes : { 
        '(/)': 'showHome'
      },
      controller: new HomeController()
    });
  });
});
