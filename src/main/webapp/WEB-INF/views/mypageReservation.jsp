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
                <div class="arrow_wrap">
                    <span class="arrow-top">
                        <i class="xi-caret-up-min"></i>
                    </span>
                </div>
            </div>
            <div class="info_con">
                <ul>
                    <li>
                        <p class="tit">예약 여부</p>
                        <div class="badge">
                            <span>확정</span>
                        </div>
                    </li>
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
                            <span class="option"><i class="fa-solid fa-seedling"></i></span>
                            <span class="option"><i class="fa-solid fa-tractor"></i></span>
                            <span class="option"><i class="fa-solid fa-droplet"></i></span>
                            <span class="option"><i class="fa-solid fa-sack-xmark"></i></span>
                        </div>
                    </li>
                    <li>
                        <p class="tit">총 금액</p>
                        <p class="txt price">300,000원</p>
                    </li>
                </ul>
                <div class="btn_wrap">
                    <a href="../listDetail" class="update">수정</a>
                    <a href="#" class="del">삭제</a>
                </div>
            </div>

        </div>
    </div>
</div>
<%@include file="../include/modal.jsp" %>
<script>
    $(".info_list").click(function() {
        $(this).next(".info_con").stop().slideToggle(300);
        $(this).toggleClass('on').siblings().removeClass('on');
        $(this).next(".info_con").siblings(".info_con").slideDown(300);
    });
</script>