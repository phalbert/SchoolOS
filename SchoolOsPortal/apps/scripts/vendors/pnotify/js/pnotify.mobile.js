// Mobile
!function(i,o){"function"==typeof define&&define.amd?define("pnotify.mobile",["jquery","pnotify"],o):"object"==typeof exports&&"undefined"!=typeof module?module.exports=o(require("jquery"),require("./pnotify")):o(i.jQuery,i.PNotify)}("undefined"!=typeof window?window:this,function(i,o){return o.prototype.options.mobile={swipe_dismiss:!0,styling:!0},o.prototype.modules.mobile={swipe_dismiss:!0,init:function(i,o){var t=this,e=null,s=null,n=null;this.swipe_dismiss=o.swipe_dismiss,this.doMobileStyling(i,o),i.elem.on({touchstart:function(o){t.swipe_dismiss&&(e=o.originalEvent.touches[0].screenX,n=i.elem.width(),i.container.css("left","0"))},touchmove:function(o){if(e&&t.swipe_dismiss){var a=o.originalEvent.touches[0].screenX;s=a-e;var p=(1-Math.abs(s)/n)*i.options.opacity;i.elem.css("opacity",p),i.container.css("left",s)}},touchend:function(){if(e&&t.swipe_dismiss){if(Math.abs(s)>40){var o=s<0?-2*n:2*n;i.elem.animate({opacity:0},100),i.container.animate({left:o},100),i.remove()}else i.elem.animate({opacity:i.options.opacity},100),i.container.animate({left:0},100);e=null,s=null,n=null}},touchcancel:function(){e&&t.swipe_dismiss&&(i.elem.animate({opacity:i.options.opacity},100),i.container.animate({left:0},100),e=null,s=null,n=null)}})},update:function(i,o){this.swipe_dismiss=o.swipe_dismiss,this.doMobileStyling(i,o)},doMobileStyling:function(o,t){t.styling?(o.elem.addClass("ui-pnotify-mobile-able"),i(window).width()<=480?(o.options.stack.mobileOrigSpacing1||(o.options.stack.mobileOrigSpacing1=o.options.stack.spacing1,o.options.stack.mobileOrigSpacing2=o.options.stack.spacing2),o.options.stack.spacing1=0,o.options.stack.spacing2=0):(o.options.stack.mobileOrigSpacing1||o.options.stack.mobileOrigSpacing2)&&(o.options.stack.spacing1=o.options.stack.mobileOrigSpacing1,delete o.options.stack.mobileOrigSpacing1,o.options.stack.spacing2=o.options.stack.mobileOrigSpacing2,delete o.options.stack.mobileOrigSpacing2)):(o.elem.removeClass("ui-pnotify-mobile-able"),o.options.stack.mobileOrigSpacing1&&(o.options.stack.spacing1=o.options.stack.mobileOrigSpacing1,delete o.options.stack.mobileOrigSpacing1),o.options.stack.mobileOrigSpacing2&&(o.options.stack.spacing2=o.options.stack.mobileOrigSpacing2,delete o.options.stack.mobileOrigSpacing2))}},o});
//# sourceMappingURL=pnotify.mobile.js.map