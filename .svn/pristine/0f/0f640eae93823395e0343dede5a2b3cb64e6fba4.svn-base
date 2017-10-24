/* Simple JavaScript Inheritance
 * By John Resig http://ejohn.org/
 * MIT Licensed.
 */
// Inspired by base2 and Prototype
(function () {
    var initializing = false, fnTest = /xyz/.test(function () {
        xyz;
    }) ? /\b_super\b/ : /.*/;
    // The base Class implementation (does nothing)
    this.Class = function () {
    };

    // Create a new Class that inherits from this class
    this.Class.extend = function (prop) {
        var _super = this.prototype;

        // Instantiate a base class (but only create the instance,
        // don't run the init constructor)
        initializing = true;
        var prototype = new this();
        initializing = false;

        // Copy the properties over onto the new prototype
        for (var name in prop) {
            // Check if we're overwriting an existing function
            prototype[name] = typeof prop[name] === "function" &&
            typeof _super[name] === "function" && fnTest.test(prop[name]) ?
                (function (name, fn) {
                    return function () {
                        var tmp = this._super;

                        // Add a new ._super() method that is the same method
                        // but on the super-class
                        this._super = _super[name];

                        // The method only need to be bound temporarily, so we
                        // remove it when we're done executing
                        var ret = fn.apply(this, arguments);
                        this._super = tmp;

                        return ret;
                    };
                })(name, prop[name]) :
                prop[name];
        }

        // The dummy class constructor
        function Class() {
            // All construction is actually done in the init method
            if (!initializing && this.init) {
                this.init.apply(this, arguments);
            }
        }

        // Populate our constructed prototype object
        Class.prototype = prototype;

        // Enforce the constructor to be what we expect
        Class.prototype.constructor = Class;
        // And make this class extendable
        Class.extend = arguments.callee;

        return Class;
    };
})();

define(function (require, exports, module) {
    "use strict";

    /**
     * PropertyBase基类
     */
    var PropertyBase = Class.extend({
        value: null,

        /**
         * 初始化控件
         * @param $container
         * @param option
         */
        onInit: function ($container, option) {
            // 外部容器
            this.$container = $container;
            this.option = option;
            // 所有属性都有name
            this.name = option.name;
        },

        /**
         * 获取值
         */
        getValue: function () {
            return this.value;
        },

        /**
         * 派发自定义事件事件
         * @param eventName
         * @param data
         */
        dispatchEvent: function (eventName, data) {
            var event = document.createEvent('Events');
            event.initEvent(eventName.toLowerCase(), false, false);
            event.data = data;
            document.dispatchEvent(event);
        },


        /**
         * 当前页面所有监听事件列表
         */
        listeners: {},

        /**
         * 添加自定义事件监听
         * @param eventName
         * @param listener
         */
        addEventListener: function (eventName, listener) {
            eventName = eventName.toLowerCase();
            // 记录已经监听的事件
            this.listeners[eventName] = this.listeners[eventName] || [];
            this.listeners[eventName].push(listener);
            document.addEventListener(eventName.toLowerCase(), listener);
        },

        /**
         * 清除自定义事件监听（仅能清除当前page的事件）
         * @param eventName
         * @param listener
         */
        removeEventListener: function (eventName, listener) {
            eventName = eventName.toLowerCase();
            var evtListeners = this.listeners[eventName] || [];
            for (var len = evtListeners.length, i = len - 1; i >= 0; i--) {
                // 如果指定了listener则移除指定监听，否则移除所有监听
                if (!listener || evtListeners[i] === listener) {
                    document.removeEventListener(eventName, evtListeners[i]);
                    evtListeners.splice(i, 1);
                }
            }
        }

    });

    module.exports = PropertyBase;

});