!function(t){t.createHipChat=function(e){if(e&&e.url&&e.container&&e.timezone){var i=t(e.container);if(0===i.length)return;var o={anonymous:!0,timezone:e.timezone,minimal:!0};e.welcome&&(o.welcome_msg=e.welcome);var n=e.url+(e.url.indexOf("?")>0?"&":"?")+t.param(o);0!==n.indexOf("https://")&&(n="https://"+n),e.showButton!==!1&&(e.showButton=!0);var s=e.width||"100%",a=e.height||400,r=e.noframes||"";return{show:function(){i.html('<iframe src="'+n+'" frameborder="0" width="'+s+'" height="'+a+'">'+r+"</iframe>")}}}},t.fn.hipChatPanel=function(e){e.container=this[0];var i=t.createHipChat(e);e.showButton?this.html('<button class="show-hipchat '+e.buttonClasses+'">'+(e.buttonTitle||"Chat")+"</button>").find(".show-hipchat").click(function(){i.show()}):i.show()}}(jQuery);