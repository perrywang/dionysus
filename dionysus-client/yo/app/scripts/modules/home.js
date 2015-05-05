Dionysus.module('Home', function(Home, Dionysus, Backbone, Marionette) {
  'use strict';

  var ModuleView = Marionette.ItemView.extend({
    template: '#module-tpl',
    className: 'card fluid'
  });

  var ModulesView = Marionette.CompositeView.extend({
    template: '#modules-tpl',
    childView: ModuleView,
    childViewContainer: '.cards',
    className: 'ui segment'
  });

  var HomeController = Marionette.Controller.extend({
    showHome: function() {
      var fetching = Dionysus.request('module:entities');
      $.when(fetching).done(function(modules) {
        Dionysus.mainRegion.show(new ModulesView({ collection: modules }));
      });
    }
  });

  Home.HeaderloginView = Marionette.ItemView.extend({
    template: '#headerlogin-tpl',
    tagName: 'nav',
    className: 'ui menu',
    serializeData: function(){
      return {
        "id": sessionStorage.getItem("user")
      }
    }
  });

  Home.LoginModalView = Marionette.ItemView.extend({
    template: '#login-modal-tpl',
    //tagName: 'form',
    //className: 'ui form compact segment',
    onRender: function() {
      this.$el.form({
        username: {
          identifier: 'username',
          rules: [{
            type: 'empty',
            prompt: '输入用户名'
          }]
        },
        password: {
          identifier: 'password',
          rules: [{
            type: 'empty',
            prompt: '输入密码'
          }]
        }
      });

      var loginAction = function() {

        var userName = $('.ui.modal*.active').find('#name').val();
        var pass = $('.ui.modal*.active').find('#pass').val();
        if (userName != "" && pass != "") {

          var user = {
            username: userName,
            password: pass
          };
          $.ajax({
            url: '/api/v1/login',
            method: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(user)
          }).done(function(response) {
            var data = response.id;
            sessionStorage.setItem("authorized", "enabled");
            sessionStorage.setItem("user", data);
            Dionysus.navigate('/site', {
              trigger: true
            });
            $('.ui.modal').modal('hide');
            Dionysus.mainNavRegion.show(new Dionysus.Home.HeaderloginView());
          }).fail(function() {
            window.alert('登录失败，请确认用户名或密码正确...');
          });
        }
      }

      this.$('#user').keypress(function(event) {
        if (event.which === 13) loginAction();
      })
      this.$('#pass').keypress(function(event) {
        if (event.which === 13) loginAction();
      })
      this.$('#loginbutton').click(loginAction);
      this.$('#register').click(function(event) {

        $('.ui.modal').modal('hide');

        Dionysus.navigate('/register', {
          trigger: true
        });


      })
    }
  });
  
  Home.HeaderView = Marionette.ItemView.extend({
    template: '#header-tpl',
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
    template: '#footer-tpl'
  });

  Dionysus.addInitializer(function() {
    if(sessionStorage.getItem("authorized") == "enabled") {
      Dionysus.mainNavRegion.show(new Dionysus.Home.HeaderloginView());
      Dionysus.footerRegion.show(new FooterView());
	}
	else {
	  Dionysus.mainNavRegion.show(new Dionysus.Home.HeaderView());
      Dionysus.footerRegion.show(new FooterView());
	}

  //initial login modal view
  Dionysus.loginModalRegion.show(new Dionysus.Home.LoginModalView());
  Dionysus.on("login",function(){
    $('.ui.modal')
    .modal('setting','transition','horizontal flip')
    .modal('show');
  })

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
