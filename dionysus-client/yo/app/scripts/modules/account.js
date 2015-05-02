Dionysus.module('Account', function(Account, Dionysus, Backbone, Marionette) {
  'use strict';

  var ACCOUNT_RULES = {
    username: {
      identifier: 'username',
      rules: [{
        type: 'empty',
        prompt: 'Please enter a username'
      }]
    },
    password: {
      identifier: 'password',
      rules: [{
        type: 'empty',
        prompt: 'Please enter a password'
      }]
    }, 
    password1: {
      identifier: 'password1',
      rules: [{
        type: 'empty',
        prompt: 'Please retype your password'
      }, {
        type: 'match[password]',
        prompt: 'Password should match'
      }]
    },
    email: {
      identifier: 'email',
      rules: [{
        type: 'email',
        prompt: 'Please enter an valid email'
      }]
    },
    terms: {
      identifier : 'terms',
      rules: [{
        type   : 'checked',
        prompt : 'You must agree to the terms and conditions'
      }]
    }
  };
  
  var LogoutView = Marionette.ItemView.extend({ 
    template: '#logout-tpl',
    tagName: 'form',
    className: 'ui form',
    onRender: function() {
      this.$el.form({
        feedback: {
          identifier: 'feedback',
          rules: [{
            type: 'empty',
            prompt: 'Please share the feedback'
          }]
        }
      });
    },
    ui: {
      logout: '.logout'
    },
    events: {
      'click @ui.logout': 'logout'
    },
    logout: function() {
      this.trigger('user:logout');
    }
  });
  
  var LoginView = Marionette.ItemView.extend({ 
    template: '#account-login-tpl',
    tagName: 'form',
    className: 'ui form compact segment',
    onRender: function() {
      this.$el.form(ACCOUNT_RULES);
      
      var loginAction = function() {

        var userName = $('.ui.modal*.active').find('#name').val();
        var pass = $('.ui.modal*.active').find('#pass').val();
        if ( userName != "" && pass != "") {
          
          var user = {username:userName, password:pass};
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
            $('.ui.modal').remove();
            Dionysus.mainNavRegion.show(new Dionysus.Home.HeaderloginView());
          }).fail(function() {
            window.alert('登录失败，请确认用户名或密码正确...');
          });
        }
      }

      //$('#name').val("");
      //$('#pass').val("");
      this.$('#user').keypress(function(event){ if(event.which === 13) loginAction();})
      this.$('#pass').keypress(function(event){ if(event.which === 13) loginAction();})
      this.$('#login').click(loginAction);
      this.$('#register').click(function(event){ 
        
        $('.ui.modal').modal('hide');
        //$('.ui.modal').detach();
        Dionysus.navigate('/register', {
              trigger: true
            });
        
        
       })
    }
  });

  var RegisterView = Marionette.ItemView.extend({ 
    template: '#account-register-tpl',
    tagName: 'form',
    className: 'ui form compact segment',
    onRender: function() {
      this.$('.ui.checkbox').checkbox();
      this.$el.form(ACCOUNT_RULES);
    },
    ui: {
      submit: '.submit',
      consultant: '.consultant'
    },
    events: {
      'click @ui.submit': 'register'
    },
    register: function() {
      var user = this.$el.form('get values', ['username', 'password', 'email', 'consultant']);
      this.trigger('user:register', user); 
    }
  });

  var AccountController = Marionette.Controller.extend({
    login: function() {
      var view = new LoginView(), controller = this;
      
      view.on('render', function(){
        this.$('.ui.modal').modal({
          closable:false,
          onDeny: function(){
            Dionysus.navigate('/site',{trigger:true});
          },
          onAppoval: function(){
            alert('ok');
          }
        })
        .modal('setting','transition','horizontal flip')
        .modal('show');
      });

      Dionysus.mainRegion.show(view);
    },
    register: function() {
      var view = new RegisterView();
      view.on('user:register', function(user) {
        var consultant = user.consultant;
        var url = consultant ? '/api/v1/consultant' : '/api/v1/register';
        $.ajax({
          url: url,
          method: 'POST',
          contentType: 'application/json; charset=utf-8',
          data: JSON.stringify(user)
        }).done(function() {
          window.alert('register success');
          Dionysus.navigate('/site',{trigger:true});
        }).fail(function() {
          window.alert('register failure');
        }); 
      });
      Dionysus.mainRegion.show(view);
    },
    logout: function() {
      var view = new LogoutView();
      view.on('user:logout', function() {
        $.ajax({
          url: '/api/v1/logout',
          cache: false,
          success: function(response) {
            sessionStorage.setItem("authorized", "disabled");
            sessionStorage.removeItem("user");
            Dionysus.navigate('/site',{trigger:true});
            Dionysus.mainNavRegion.show(new Dionysus.Home.HeaderView());
          }
        });
      })
      Dionysus.mainRegion.show(view);
    }
  });

  Dionysus.addInitializer(function() {
    new Marionette.AppRouter({
      appRoutes: {
        'login(/)': 'login',
        'logout(/)': 'logout',
        'register(/)': 'register'
      },
      controller: new AccountController()
    });
  });
});