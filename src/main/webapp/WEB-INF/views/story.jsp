<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<div class="wrap con">
    <%@include file="../include/board_search.jsp" %>
    <div class="story_list">
        <c:if test="${not empty list}">
            <c:forEach var="list" items="${list}" varStatus="status">
                <div class="story_items">
                    <div class="story_content">
                        <div class="story_tt">
                            <a href="/storyDetail?sno=${list.storyIdx}">
                                <img src="${list.storyMemImg}" alt="">
                            </a>
                            <b>${list.storyMemId}</b>
                        </div>
                        <div class="story_img">
                            <img src="/image/${list.storyIdx}/1" alt="Image">
                        </div>
                        <div class="story_txt">
                            <div class="story_subject"><a
                                    href="/storyDetail?sno=${list.storyIdx}">${list.storySubject}</a></div>
                            <div class="story_content ellipsis">${list.storyContent}</div>
                            <div class="story_tag">
                                    ${list.storyTag}
                            </div>
                            <div class="story_date">
                                <fmt:formatDate value="${list.storyDate}" pattern="yyyy-MM-dd"/>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:if>
        <c:if test="${empty list}">
            <!-- list 데이터가 없을 때 수행할 작업 -->
            <div class="notable">
                자료가 없습니다.
            </div>
        </c:if>
    </div>
    <div class="storybtn">
        <a href="/storyWrite" class=" btn">스토리 올리기</a>
        <span class="btnimg"><img src="/img/sprout.png" alt="새싹"></span>
    </div>
    <%@include file="../include/paging.jsp" %>
</div>
<%@include file="../include/footer.jsp" %>