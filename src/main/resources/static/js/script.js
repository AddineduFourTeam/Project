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
    if($("div").hasClass(".story_list") == true) {
        setTimeout(function(){
            masonryLayout();
            window.addEventListener("resize", masonryLayout);
        },1000)
    }



});

function masonryLayout() {
    const masonryContainerStyle = getComputedStyle(
        document.querySelector(".story_list")
    );
    const columnGap = parseInt(
        masonryContainerStyle.getPropertyValue("column-gap")
    );
    const autoRows = parseInt(
        masonryContainerStyle.getPropertyValue("grid-auto-rows")
    );

    document.querySelectorAll(".story_items").forEach((elt) => {
        elt.style.gridRowEnd = `span ${Math.ceil(elt.querySelector(".story_content").scrollHeight / 10 + 1)}`;
    });
}
