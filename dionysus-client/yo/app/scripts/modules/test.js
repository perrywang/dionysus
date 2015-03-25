Dionysus.module('DionysusApp.Test', function (Test, Dionysus, Backbone, Marionette, $, _) {
    'use strict';

    var Test = Marionette.Model.extend({
        urlRoot: '/api/v1.1/tests'
    });

    var TestItemOptionView = Marionette.ItemView.extend({
        template: '#test-item-option-tpl',
        tagName: 'span',
        events: {
            'click': 'selectOption'
        },

        selectOption: function () {
            //to do how to find input element and select it??
        }
    });

    var TestItemView = Marionette.CompositeView.extend({
        template: '#test-item-tpl',
        itemView: TestItemOptionView,
        itemViewContainer: '#item-options'
    });

    var TestView = Marionette.LayoutView.extend({
        template: '#test-detail-tpl',
        regions: {
            'RegionItem': '#test-item'
        },
        events:{
            'click a#last':'movePrevious',
            'click a#next':'moveNext'
        },

        movePrevious:function(){
            this.model.current--;
        },

        moveNext:function(){
            this.model.current++;
        },

        onRender: function () {
            var currentIndex = this.model.current;
            var currentItem = this.model.items[currentIndex];
            var itemView = new TestItemView({
                sequence: currentIndex + 1,
                description: currentItem.description,
                collection: currentItem.options
            });
            this.RegionItem.show(itemView);
        }
    });

    var TestController = Marionette.Controller.extend({
        getTest: function (id) {
            var test = new Test({id: id});
            test.fetch().then(function () {
                test.current = 0;
                test.total = test.items.length;
                Dionysus.mainRegion.show(new TestView({ model: test}));
            });
        }
    });

    Dionysus.addInitializer(function () {
        new Marionette.AppRouter({
            appRoutes: {
                'app/tests/:id(/)': 'getTest'
            },
            controller: new TestController()
        });
    });
});
