<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../include/header.jsp" %>
<div class="wrap con">
    <div class="info_wrap">
        <div class="rv_info">
            <div class="info_list">
                <div class="data">
                    <p class="farm_name">주말농장</p>
                    <p class="date">24. 2. 16 오후 2:30</p>
                </div>
                <div class="arrow">
                    <span class="arrow-top">열림</span>
                    <span class="arrow-bottom">닫힘</span>
                </div>
            </div>
            <div class="info_con">
                <div class="badge">
                    <span>확정</span>
                </div>
                <ul>
                    <li>
                        <p class="tit">이용 기간</p>
                        <p class="txt">3년 (2024 ~ 2026)</p>
                    </li>
                    <li>
                        <p class="tit">평 수</p>
                        <p class="txt">6평</p>
                    </li>
                    <li>
                        <p class="tit">옵션</p>
                        <div class="txt">
                            <span class="option"><i></i></span>
                            <span class="option"><i></i></span>
                            <span class="option"><i></i></span>
                            <span class="option"><i></i></span>
                        </div>
                    </li>
                    <li>
                        <p class="tit">총 금액</p>
                        <p class="txt">300,000원</p>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<%@include file="../include/modal.jsp" %>
<script>
    $(".info_list").click(function() {
        $(this).next(".info_con").stop().slideToggle(300);
        $(this).toggleClass('on').siblings().removeClass('on');
        $(this).next(".info_con").siblings(".info_con").slideUp(300);
    });
</script>