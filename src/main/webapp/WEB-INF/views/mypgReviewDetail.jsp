<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../include/header.jsp" %>
<div class="wrap con">
    <%@include file="../include/mypg_menu.jsp" %>
    <div class="my-wrap">
        <div class="board_con board_view">
            <div class="board_tb">
                <div class="board_view_tt">${review.reviewSubject}</div>
                <div class="board_view_top flex">
                    <div class="board_view_writer">
                        <span><img src="${loginUser.memImg}" alt=""
                                   onerror="this.src='img/profileImg.png'"></span>${loginUser.memid}
                    </div>
                    <div class="board_view_date">
                        <span>
                           조회수 : <span class="count">${review.reviewCount}</span>&nbsp;&nbsp;|&nbsp;&nbsp;
                        </span>
                        <span>
                            <fmt:parseDate value="${review.reviewDate}" pattern="yy. M. d. a h:mm" var="parsedDateTime" type="both" />
                            <fmt:formatDate pattern="yyyy.MM.dd H:mm" value="${parsedDateTime}"/>
                        </span>
                    </div>
                </div>
                <div class="board_view_con">
                    <c:if test="${not empty review.reviewImg1}">
                        <div class="story_detail_slide">
                            <button type="button" class="prev"><i class="fa-solid fa-angle-left" aria-hidden="true"></i>
                            </button>
                            <div class="story_detail_img">
                                <div class="story_detail_img_list">
                                    <c:if test="${not empty review.reviewImg1}">
                                        <img src="${review.reviewImg1}" alt="Image">
                                    </c:if>
                                </div>
                                <div class="story_detail_img_list">
                                    <c:if test="${not empty review.reviewImg2}">
                                        <img src="${review.reviewImg2}" alt="Image">
                                    </c:if>
                                </div>
                                <div class="story_detail_img_list">
                                    <c:if test="${not empty review.reviewImg3}">
                                        <img src="${review.reviewImg3}" alt="Image">
                                    </c:if>
                                </div>
                            </div>
                            <button type="button" class="next"><i class="fa-solid fa-angle-right" aria-hidden="true"></i>
                            </button>
                        </div>

                    </c:if>
                    <div class="story_detail_con">
                        ${review.reviewContent}
                    </div>
                </div>
                <div class="board_btn">
                    <a href="/mypgReviewWrite?id=${param.id}">수정</a>
                    <a href="javascript:myReviewDelete(${param.id})" class="delete">삭제</a>
                    <a href="/mypgReview">목록</a>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</div>
<c:set var="user" value="${loginUser ne null ? 'true' :'false' }"/>
<c:set var="user_idx" value="${loginUser.memIdx ne null ? loginUser.memIdx : '0'}"/>
<script>
    let is_user = ${user};

    $(document).ready(function(){
        let slideItemWidth = 0;
        let reviewSlideWidth = $(".review_detail_img").outerWidth();

        //이미지가 3개가 넘어가면 슬라이드
        $(window).on('load', function () {
            $(".review_detail_img_list").each(function () {
                slideItemWidth += $(this).innerWidth();
            });
            if (reviewSlideWidth < slideItemWidth) {
                review_slick();
            }
        });

    });



    //이미지 슬릭
    function review_slick() {
        //review slick
        $(".review_detail_img").slick({
            draggable: true,
            variableWidth: true,
            slidesToShow: 1,
            arrows: true,
            swipeToSlide: true,
            infinite: false,
            prevArrow: $('.prev'),
            nextArrow: $('.next'),
        });
    }

    $(document).on("click", ".emoji_btn", function (e) {
        const button = e.currentTarget;

        // 해당 버튼에 대한 처리
        const picker = new EmojiButton({
            i18n: {
                search: 'Search emojis...',
                categories: {
                    recents: 'Recent Emojis',
                    smileys: 'Smileys & Emotion',
                    people: 'People & Body',
                    animals: 'Animals & Nature',
                    food: 'Food & Drink',
                    activities: 'Activities',
                    travel: 'Travel & Places',
                    objects: 'Objects',
                    symbols: 'Symbols',
                    flags: 'Flags'
                },
                notFound: 'No emojis found'
            }
        });

        picker.on('emoji', emoji => {
            const associatedTextBoxId = button.dataset.targetTextbox;
            console.log(associatedTextBoxId);
            const text_box = $("#" + associatedTextBoxId);

            text_box.val(text_box.val() + emoji);
        });

        picker.togglePicker(button);
    });




    //좋아요
    let likeTmp = 0;
    function like(ele,id){
        if (is_login()) {
            if(likeTmp ===0) {
                $.ajax({
                    url:"/likeUp",
                    type:"post",
                    data:{id : id},
                    success:function(result){
                       console.log("success");
                       $(ele).find("i").attr("class", "fa-solid fa-thumbs-up").css("color", "#01b03f");
                        $(ele).find("span").text(result);
                       likeTmp = 1;
                    },error: function (xhr, status, error) {
                        console.log(xhr, status, error);
                    }
                });
            }else {
                $.ajax({
                    url:"/likeDown",
                    type:"post",
                    data:{id : id},
                    success:function(result){
                        console.log("success");
                        $(ele).find("i").attr("class", "fa-regular fa-thumbs-up").css("color","#999");
                        $(ele).find("span").text(result > 0 ? result : "");
                        likeTmp = 0;
                    },error: function (xhr, status, error) {
                        console.log(xhr, status, error);
                    }
                });

            }
        }
    };

    function myreviewDelete(id){
        if(confirm("게시물을 삭제 하시겠습까?")) {
            $.ajax({
                url: "/reviewDelete",
                data: {"id": id},
                type: "post",
                success: function (data) {
                    alert("삭제가 완료 되었습니다.");
                    hireview.back();
                }, error: function (xhr, status, error) {
                    console.log(xhr, status, error);
                }
            });
        }

    }


    //로그인여부 체크
    function is_login() {
        if(is_user === true) {
            return true;
        }else {
            alert("로그인 후 이용 가능합니다.");
            return false;
        }
    }
</script>
<%@include file="../include/footer.jsp" %>