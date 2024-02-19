<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../include/header.jsp" %>
<div class="con wrap">
    <%@include file="../include/mypg_menu.jsp" %>
    <div class="my-wrap">
        <div class="info_wrap">
            <c:choose>
                <c:when test="${not empty reservations}">
                    <c:forEach var="resv" items="${reservations}" varStatus="i">
<%--                    <fmt:parseDate value="${resv.rvDate}" pattern="yy. M. d. a h:mm" var="parsedDateTime" type="both" />--%>
                        <div class="rv_info">
                            <div class="info_list">
                        <div class="data">
                            <p class="farm_name">${wfSubjects.get(i.index)}</p>
                            <p class="date">
                                ${resv.rvDate}
                            </p>
                        </div>
                        <div class="arrow_wrap">
                            <span class="arrow-top">
                                <i class="fa-solid fa-caret-down"></i>
                            </span>
                        </div>
                    </div>
                            <div class="info_con">
                        <ul>
                            <li>
                                <p class="tit">예약 여부</p>
                                <div class="badge">
                                    <span>${resv.status}</span>
                                </div>
                            </li>
                            <li>
                                <p class="tit">이용 기간</p>
                                <p class="txt">${resv.rvUseDate}년</p>
                            </li>
                            <li>
                                <p class="tit">평 수</p>
                                <p class="txt">${resv.rvFeet}평</p>
                            </li>
                            <li>
                                <p class="tit">옵션</p>
                                <div class="txt">
                                    <span class="option">
                                        <i class="fa-solid fa-seedling"></i>
                                        ${resv.rvOptionSeeding}
                                    </span>
                                    <span class="option">
                                        <i class="fa-solid fa-tractor"></i>
                                        ${resv.rvOptionPlow}
                                    </span>
                                    <span class="option">
                                        <i class="fa-solid fa-droplet"></i>
                                         ${resv.rvOptionWatering}
                                    </span>
                                    <span class="option">
                                        <i class="fa-solid fa-sack-xmark"></i>
                                        ${resv.rvOptionCompost}
                                    </span>
                                </div>
                            </li>
                            <li>
                                <p class="tit">총 금액</p>
                                <p class="txt price">${resv.rvPrice}원</p>
                            </li>
                        </ul>
                        <div class="btn_wrap">
                            <a href="../listDetail" class="update">수정</a>
                            <a href="#" class="del">삭제</a>
                        </div>
                    </div>
                        </div>
                    </c:forEach>
                </c:when>
            </c:choose>
        </div>
    </div>
</div>
</div>
</div>
<%@include file="../include/footer.jsp" %>
<%@include file="../include/modal.jsp" %>
<script>

    /* 아코디언 리스트 */
    $(".info_list").click(function () {
        $(this).next(".info_con").stop().slideToggle(300);
        $(this).toggleClass('on').siblings().removeClass('on');
        $(this).next(".info_con").siblings(".info_con").slideDown(300);
    });
</script>