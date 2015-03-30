
var testData = {
    "id":1,
    "title": "你存在心理问题吗？",
    "description": "测试你是否存在成为心理障碍的标准测试",
    "current" : 0,
    "items": [
        {
            "id":1,
            "description": "看到有人在你面前抢劫你会怎么做？",
            "options": [
                {
                    "id":1,
                    "description": "装作没看见"
                },
                {
                    "id":2,
                    "description": "上前搏斗"
                },
                {
                    "id":3,
                    "description": "一起抢"
                }
            ]
        },
        {
            "id":2,
            "description": "看到有人在你面前乞讨你会怎么做？",
            "options": [
                {
                    "id":4,
                    "description": "给钱"
                },
                {
                    "id":5,
                    "description": "装作没看见"
                },
                {
                    "id":6,
                    "description": "趁其不备，抢走他的钱"
                }
            ]
        },
        {
            "id":3,
            "description": "亲眼目睹一次车祸你有多久能够平复下来？",
            "options": [
                {
                    "id":7,
                    "description": "一天"
                },
                {
                    "id":8,
                    "description": "一星期"
                },
                {
                    "id":9,
                    "description": "一个月"
                }
            ]
        }
    ]
};

Dionysus.module('DionysusApp.Test', function (Test, Dionysus, Backbone, Marionette, $, _) {
    'use strict';

    var TestModel = Backbone.Model.extend({
        defaults : {
           'current' : 0
        },
        urlRoot: '/api/v1.1/tests'
    });

    var TestItemModel =  Backbone.Model.extend({
    });

    var TestItemOptionModel = Backbone.Model.extend({
        defaults : {
            selected: false
        }
    });

    var TestItemOptionView = Marionette.ItemView.extend({
        template: '#test-item-option-tpl',

        initialize: function(){
            this.model.on('change:selected', this.render, this);
        },

        ui:{
            checkbox : 'input'
        },

        events: {
            'click': 'selectOption'
        },

        selectOption: function () {
            if(!this.model.get('selected')){
                this.trigger("option:changed",this.model.get('id'))
            }
        },

        onRender : function(){
            this.$el.toggleClass("teal lighten-4",this.model.get('selected'));
            this.ui.checkbox.prop("checked",this.model.get('selected'));
        }
    });

    var TestItemOptionCollection = Backbone.Collection.extend({
        model : TestItemOptionModel
    });

    var TestView = Marionette.LayoutView.extend({

        template: "#test-tpl",

        regions:{
            TestHeaderRegion : '#test-header',
            TestItemRegion : '#test-item',
            TestWizardRegion : '#test-wizard'
        }

    });

    var HeaderView = Marionette.ItemView.extend({
        template : '#test-header-tpl',
        initialize: function(){
            this.model.on('change:current',this.render,this);
        }
    });

    var ItemView = Marionette.CompositeView.extend({
        template : '#test-item-tpl',
        childView : TestItemOptionView,
        childViewContainer: '#item-options'
    });

    var WizardView = Marionette.ItemView.extend({
        template : '#test-wizard-tpl',
        events : {
            'click #last' : 'lastClicked',
            'click #next' : 'nextClicked'
        },

        lastClicked : function(){
            this.trigger('item:changed',-1);
        },

        nextClicked : function(){
            this.trigger('item:changed',1);
        }
    });

    var TestController = Marionette.Controller.extend({
        showTest: function (id) {
            var test = new TestModel({id: id});
            test.fetch().then(function () {
                var total = test.get('items').length;
                test.set('total',total);
                var headerView = new HeaderView({
                    model : test
                });
                var current = test.get('current');
                var item = new TestItemModel({
                    description : test.get('items')[current]['description']
                });

                var options = new TestItemOptionCollection(test.get('items')[current]['options']);

                var itemView = new ItemView({
                    model : item,
                    collection : options
                });

                itemView.on('childview:option:changed',function(view,selectedId){
                    var current = test.get('current');
                    var currentItem = test.get('items')[current];
                    currentItem.options.map(function(option){
                        option['selected'] = (option['id'] == selectedId);
                    });
                    options.each(function(option){
                        option.set('selected',option.get('id') == selectedId);
                    });

                });

                var wizardView = new WizardView();

                wizardView.on('item:changed',function(view,step){
                    var current = test.get('current') + step;
                    test.set('current',current);
                    var currentItem = test.get('items')[current];
                    itemView.model.set('description',currentItem['description']);
                    itemView.collection = new TestItemOptionCollection(currentItem['options']);
                    itemView.render();
                });


                var testView = new TestView();

                testView.on('show',function(){
                    testView.TestHeaderRegion.show(headerView);
                    testView.TestItemRegion.show(itemView);
                    testView.TestWizardRegion.show(wizardView);

                });

                Dionysus.mainRegion.show(testView);
            });
        }
    });

    Dionysus.addInitializer(function () {
        new Marionette.AppRouter({
            appRoutes: {
                'app/tests/:id(/)': 'showTest'
            },
            controller: new TestController()
        });
    });
});
