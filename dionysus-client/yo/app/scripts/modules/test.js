Dionysus.module('DionysusApp.Test', function (Test, Dionysus, Backbone, Marionette, $, _) {
    'use strict';

    var TestModel = Backbone.Model.extend({
        defaults : {
           'current' : 0
        },
        urlRoot: '/api/v1/tests'
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
                this.trigger('option:changed',this.model.get('id'));

            }
        },

        onRender : function(){
            this.$el.toggleClass('test-item-option-selected',this.model.get('selected'));
            this.ui.checkbox.prop('checked',this.model.get('selected'));
        }
    });

    var TestItemOptionCollection = Backbone.Collection.extend({
        model : TestItemOptionModel
    });

    var TestView = Marionette.LayoutView.extend({

        template: '#test-tpl',
        className : 'ui segment',
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
        className : 'ui grid',
        initialize : function(){
            this.model.on('change:current',this.render,this);
        },
        events : {
            'click #last' : 'lastClicked',
            'click #next' : 'nextClicked'
        },

        ui:{
            'lastBtn' : '#last',
            'nextBtn' : '#next',
            'submitBtb' : '#submit'
        },
        onRender : function(){
            var current = this.model.get('current');
            var total = this.model.get('total');
            if(current === 0){
                this.ui.lastBtn.addClass('disabled');
            }
            if(current === total - 1){
                this.ui.nextBtn.addClass('disabled');
                this.ui.submitBtb.removeClass('disabled');
            }

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
                    description : test.get('items')[current].description
                });

                var options = new TestItemOptionCollection(test.get('items')[current].options);

                var itemView = new ItemView({
                    model : item,
                    collection : options
                });

                itemView.on('childview:option:changed',function(childview,selectedId){
                    var current = test.get('current');
                    var currentItem = test.get('items')[current];
                    currentItem.options.map(function(option){
                        option.selected = (option.id === selectedId);
                    });
                    itemView.collection.each(function(option){
                        option.set('selected',option.get('id') === selectedId);
                    });

                });

                var wizardView = new WizardView({model:test});

                wizardView.on('item:changed',function(step){
                    var current = test.get('current') + step;
                    test.set('current',current);
                    var currentItem = test.get('items')[current];
                    itemView.model.set('description',currentItem.description);
                    itemView.collection = new TestItemOptionCollection(test.get('items')[current].options);
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
