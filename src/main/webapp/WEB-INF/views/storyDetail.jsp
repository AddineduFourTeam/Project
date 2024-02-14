<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../include/header.jsp" %>
<div class="wrap con">
    <%@include file="../include/board_search.jsp" %>
    <div class="board_con board_view">
        <div class="board_tb">
            <div class="board_view_tt">${story.storySubject}</div>
            <div class="board_view_top flex">
                <div class="board_view_writer">
                    <span><img src="${story.storyMemImg}" alt=""
                               onerror="this.src='img/profileImg.png'"></span>${story.storyMemId}
                </div>
                <div class="board_view_date">
                    <fmt:parseDate value="${story.storyDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime"
                                   type="both"/>
                    <fmt:formatDate pattern="yyyy.MM.dd" value="${parsedDateTime}"/>
                </div>
            </div>
            <div class="board_view_con">
                <c:if test="${not empty story.storyImg1}">
                    <div class="story_detail_slide">
                        <button type="button" class="prev"><i class="fa-solid fa-angle-left" aria-hidden="true"></i>
                        </button>
                        <div class="story_detail_img">
                            <div class="story_detail_img_list">
                                <c:if test="${not empty story.storyImg1}">
                                    <img src="/image/${story.storyIdx}/1" alt="Image">
                                </c:if>
                            </div>
                            <div class="story_detail_img_list">
                                <c:if test="${not empty story.storyImg2}">
                                    <img src="/image/${story.storyIdx}/2" alt="Image">
                                </c:if>
                            </div>
                            <div class="story_detail_img_list">
                                <c:if test="${not empty story.storyImg3}">
                                    <img src="/image/${story.storyIdx}/3" alt="Image">
                                </c:if>
                            </div>
                        </div>
                        <button type="button" class="next"><i class="fa-solid fa-angle-right" aria-hidden="true"></i>
                        </button>
                    </div>

                </c:if>
                <div class="story_detail_con">
                    ${story.storyContent}
                </div>
            </div>
            <div class="board_btn">
                <a href="/storyWrite?sno=${param.sno}">수정</a>
                <a href="javascript:void(0)" class="delete">삭제</a>
                <a href="/story">목록</a>
            </div>
            <div class="story_reply">
                <div class="story_reply_top">
                    <h4>댓글 <span>100</span>개</h4>
                </div>
                <div class="story_reply_input">
                    <textarea name="" row="1" placeholder="댓글을 작성해주세요." id="message_textbox"></textarea>
                    <div class="btnFlex flex">
                        <button class="emoji_btn" data-target-textbox="message_textbox"><i
                                class="fa-regular fa-face-smile"></i></button>
                        <button type="button" class="reply_submit" id="reply_submit" disabled="disabled">등록</button>
                    </div>
                </div>
                <div class="story_reply_list">
                    <ul>
                        <li>
                            <div class="sr_depth1">
                                <div class="sr_depth_flex">
                                    <div class="sr_img"><img src="" alt="" onerror="this.src='img/profileImg.png'">
                                    </div>
                                    <div class="sr_reply_right">
                                        <div class="sr_name">@depth1</div>
                                        <div class="sr_txt">
                                            depth1 content
                                        </div>
                                        <div class="sr_btm">
                                            <div class="sr_txt_btn">
                                                <a href="javascript:void(0);"><i
                                                        class="fa-regular fa-thumbs-up"></i><span></span></a>
                                                <a href="">수정</a>
                                                <a href="">삭제</a>
                                                <a href="">댓글달기</a>
                                            </div>
                                            <span class="sr_date">24.02.05</span>
                                        </div>
                                        <div class="story_reply_input">
                                            <textarea name="" row="1" placeholder="댓글을 작성해주세요."
                                                      id="message_textbox1"></textarea>
                                            <div class="btnFlex flex">
                                                <button class="emoji_btn" data-target-textbox="message_textbox1"><i
                                                        class="fa-regular fa-face-smile"></i></button>
                                                <button type="button" class="reply_submit" disabled="disabled">등록
                                                </button>
                                            </div>
                                        </div>
                                    </div>

                                </div>


                            </div>
                            <ul class="sr_depth2">
                                <li>
                                    <div class="sr_depth_flex">
                                        <div class="sr_img"><img src="" alt="" onerror="this.src='img/profileImg.png'">
                                        </div>
                                        <div class="sr_reply_right">
                                            <div class="sr_name">depth2</div>
                                            <div class="sr_txt">
                                                depth2 content
                                            </div>
                                            <div class="sr_btm">
                                                <div class="sr_txt_btn">
                                                    <a href="javascript:void(0);"><i
                                                            class="fa-regular fa-thumbs-up"></i><span></span></a>
                                                    <a href="">수정</a>
                                                    <a href="">삭제</a>
                                                </div>
                                                <span class="sr_date">24.02.05</span>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(function () {
        let slideItemWidth = 0;
        let storySlideWidth = $(".story_detail_img").outerWidth();
        $(window).on('load', function () {
            $(".story_detail_img_list").each(function () {
                slideItemWidth += $(this).innerWidth();
            });
            //console.log("slideItemWidth : " + slideItemWidth + "/ storySlideWidth : " + storySlideWidth);
            if (storySlideWidth < slideItemWidth) {
                story_slick();
            }
        });

        $("#reply_submit").click(function () {
            <c:choose>
            <c:when test="${loginUser ne null}">
            let text = $("#message_textbox").val();
            text = text.replace(/(?:\r\n|\r|\n)/g, '<br>');

            $.ajax({
                url: "/storyReplySave",
                data: {"id":${param.id}, "srMemIdx":${loginUser.memIdx}, "srDepth": 1, "srContent": text},
                type: "post",
                success: function (result) {
                    console.log("success");
                    let content = `<li>
                        <div class="sr_depth1">
                        <div class="sr_depth_flex">
                        <div class="sr_img"><img src="" alt="" onerror="this.src='img/profileImg.png'"></div>
                        <div class="sr_reply_right">
                        <div class="sr_name"><a href="/story?name=1"></a></div>
                        <div class="sr_txt">
                        ${result.srContent}
                        </div>
                        <div class="sr_btm">
                        <div class="sr_txt_btn">
                        <a href="javascript:void(0);"><i class="fa-regular fa-thumbs-up"></i><span></span></a>
                        <a href="">수정</a>
                        <a href="">삭제</a>
                        <a href="javascript:void(0);" class="reply_submit_btn" id="reply_submit_${result.srIdx}" data-target-id="${result.srIdx}">댓글달기</a>
                        </div>
                        <span class="sr_date">${result.srDate}</span>
                        </div>
                        </div>
                        </div>
                        </div>
                        </li>`;
                    $(".story_reply_list ul").prepend(content);
                },
                error: function () {
                    console.log("error");
                }
            });
            </c:when>
            <c:otherwise>
            alert("로그인 후 이용 가능합니다.")
            </c:otherwise>
            </c:choose>
        });


    });

    function story_slick() {
        //story slick
        $(".story_detail_img").slick({
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

    // 각 버튼에 대한 정보를 배열로 저장
    const emojiButtons = document.querySelectorAll(".emoji_btn");

    emojiButtons.forEach(button => {
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

        button.addEventListener('click', () => {
            picker.togglePicker(button);
        });

        picker.on('emoji', emoji => {
            const associatedTextBoxId = button.dataset.targetTextbox;
            //console.log(associatedTextBoxId);
            const text_box = document.querySelector("#" + associatedTextBoxId);

            text_box.value += emoji;

        });
    });
</script>
<%@include file="../include/footer.jsp" %>