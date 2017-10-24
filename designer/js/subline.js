define(function (require, exports, module) {
    "use strict";

    var global = require('./global');

    var SubLine = function () {

        this.init = function () {
            this.$lineX = $('#subLineX');
            this.$lineY = $('#subLineY');

            // 纵向辅助线
            this.$lineX.draggable({
                axis: 'x',
                cursor: '',
                drag: function (evt, ui) {
                    if (ui.position.left < 325) {
                        ui.position.left = 325;
                    }
                }
            });
            // 横向辅助线
            this.$lineY.draggable({
                axis: 'y',
                cursor: 'x',
                drag: function (evt, ui) {
                    if (ui.position.top < 10) {
                        ui.position.top = 10;
                    }
                }
            });
        };
    };

    module.exports = new SubLine();

});