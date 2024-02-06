<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<div class="wrap con">
    <%@include file="../include/board_search.jsp" %>
    <div class="board_con board_view">
        <div class="board_tb">
            <div class="board_view_tt">${story.storySubject}</div>
            <div class="board_view_top flex">
                <div class="board_view_writer">
                    <span><img src="${story.storyMemImg}" alt="" onerror="this.src='img/profileImg.png'"></span>${story.storyMemId}
                </div>
                <div class="board_view_date">
                    <fmt:parseDate value="${story.storyDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
                    <fmt:formatDate pattern="yyyy.MM.dd" value="${parsedDateTime}" />
                </div>
            </div>
            <div class="board_view_con">
                <c:if test="${not empty story.storyImg1}">
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
                </c:if>
                <div class="story_detail_con">
                    ${story.storyContent}
                </div>
            </div>
            <div class="story_reply">
                <div class="story_reply_top">
                    <h4>댓글 <span>100</span>개</h4>
                </div>
                <div class="story_reply_input">
                    <textarea name="" row="1" placeholder="댓글을 작성해주세요." id="message"></textarea>
                    <div class="btnFlex flex">
                        <button class="emoji_btn" value=""><i class="fa-solid fa-face-smile"></i></button>
                        <button type="button" class="">등록</button>
                    </div>
                </div>
                <div class="story_reply_list">
                    <ul>
                        <li>
                            <div class="sr_depth1">
                                <div class="sr_depth_flex">
                                    <div class="sr_name">depth1</div>
                                    <div class="sr_txt">
                                        depth1 content
                                    </div>
                                    <div class="sr_btm">
                                        <div class="sr_txt_btn">
                                            <a href="">수정</a>
                                            <a href="">삭제</a>
                                            <a href="">댓글달기</a>
                                        </div>
                                        <span class="sr_date">24.02.05</span>
                                    </div>
                                </div>
                                <div class="story_reply_input">
                                    <textarea name="" row="1" placeholder="댓글을 작성해주세요." id="message"></textarea>
                                    <div class="btnFlex flex">
                                        <button class="emoji_btn" value=""><i class="fa-solid fa-face-smile"></i></button>
                                        <button type="button" class="">등록</button>
                                    </div>
                                </div>
                            </div>
                            <ul class="sr_depth2">
                                <li>
                                    <div class="sr_depth_flex">
                                        <div class="sr_name">depth2</div>
                                        <div class="sr_txt">
                                            depth2 content
                                        </div>
                                        <div class="sr_btm">
                                            <div class="sr_txt_btn">
                                                <a href="">수정</a>
                                                <a href="">삭제</a>
                                            </div>
                                            <span class="sr_date">24.02.05</span>
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
    <div class="board_btn">
        <a href="/storyWrite?sno=${param.sno}">수정</a>
        <a href="javascript:void(0)" class="delete">삭제</a>
        <a href="/story">목록</a>
    </div>
</div>
<script>
    $(function(){
        $("textarea").on("keydown , keyup , keypress",function(){
            resize(this);
        });
    });

    function resize(obj) {
        obj.style.height = '1px';
        obj.style.height = (14 + obj.scrollHeight) + 'px';
    }
    const button = document.querySelector(".emoji_btn");
    const picker = new EmojiButton({
        //position: 'bottom-start',
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

    button.addEventListener('click', (target) => {
        let btn_val = target.value ;
        picker.togglePicker(button);
    });

    picker.on('emoji', emoji => {
        const text_box = document.querySelector('#message');
        text_box.value += emoji;
    });
</script>
<%@include file="../include/footer.jsp" %>