new WOW().init();
$(document).ready(function(){
    $(window).scroll(function(){
        if($(this).scrollTop() > 0) {
            $("header").addClass("on");
            $("h1 img").attr("src","/img/logo.png");

        }else {
            $("header").removeClass("on");
            $(".index_body h1 img").attr("src", "/img/logo_w.png");
        }
    });
    if($("header").hasClass("on") == true) {
        $("h1 img").attr("src","/img/logo.png");
    }else {
        $(".index_body h1 img").attr("src", "/img/logo_w.png");
    }
});


/*
window.onload = () => {
    document.querySelectorAll(".story_items").forEach((item) => {
        item.style.gridRowEnd = `span ${item}`;
    });
    const wrap = document.querySelector(".story_list");
    wrap.style.display = "grid";
    wrap.style.gridTemplateColumns = "repeat(3, minmax(0, 1fr))";
    wrap.style.gridAutoRows = "1px";
}*/
