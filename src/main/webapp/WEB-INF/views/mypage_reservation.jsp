<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../include/header.jsp" %>
<div class="wrap con">
    <div class="info_wrap">
        <div class="rv_info">
            <div class="info_list">
                <div class="data">
                    <p class="farm_name">주말농장</p>
                    <p class="date">날짜</p>
                </div>
                <div class="arrow">
                    <span class="arrow-top">열림</span>
                    <span class="arrow-bottom">닫힘</span>
                </div>
            </div>
            <div class="info_con">
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
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