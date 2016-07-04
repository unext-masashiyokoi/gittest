$(document).ready(function() {  
  $(".animsition").animsition({
   
    inClass               :   'fade-in-up',
    outClass              :   'fade-out-down',
    inDuration            :    200,
    outDuration           :    200,
    linkElement           :   '.animsition-link',
   // linkElement           :   'a',
    // e.g. linkElement   :   'a:not([target="_blank"]):not([href^=#])'a
    loading               :    false,
    loadingParentElement  :   'body', //animsition wrapper element
    loadingClass          :   'animsition-loading',
    unSupportCss          : [ 'animation-duration',
                              '-webkit-animation-duration',
                              '-o-animation-duration'
                            ],
    //"unSupportCss" option allows you to disable the "animsition" in case the css property in the array is not supported by your browser.
    //The default setting is to disable the "animsition" in a browser that does not support "animation-duration".

    overlay               :   false,
     
    overlayClass          :   'animsition-overlay-slide',
    overlayParentElement  :   'body'
  });
})

$(document).ready(function() {
   
  $(".animsition").animsition({
   
    inClass               :   'fade-in',
    outClass              :   'fade-out',
    inDuration            :    200,
    outDuration           :    200,
    linkElement           :   '.animsition-link-blog',
   // linkElement           :   'a',
    // e.g. linkElement   :   'a:not([target="_blank"]):not([href^=#])'a
    loading               :    false,
    loadingParentElement  :   'body', //animsition wrapper element
    loadingClass          :   'animsition-loading',
    unSupportCss          : [ 'animation-duration',
                              '-webkit-animation-duration',
                              '-o-animation-duration'
                            ],
    //"unSupportCss" option allows you to disable the "animsition" in case the css property in the array is not supported by your browser.
    //The default setting is to disable the "animsition" in a browser that does not support "animation-duration".

    overlay               :   false,
     
    overlayClass          :   'animsition-overlay-slide',
    overlayParentElement  :   'body'
  });
})

var angle = 0;
setInterval(function(){
    angle+=1;
    $("#rotate").rotate(angle);
},50);

$(document).ready(function(){
				$('.navbar-brand').hover(function() {
                $(this).stop().animate({'marginLeft':'3px'}, 400);//左を3px空ける事でテキストを右にずらす
                },function() {
                $(this).stop().animate({'marginLeft':'0px'}, 200);
                });
});

$(document).ready(function(){
    $("img").lazyload({
        effect : "fadeIn",
        effect_speed: 2000 		// 3秒かけて表示させる
    });
});
