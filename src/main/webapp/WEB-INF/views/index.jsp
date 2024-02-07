<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-01-17
  Time: 오후 5:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<div class="mainImg">
    <img src="/img/mainimg.jpg"  alt="초원에 집에 있는 메인 이미지" class="wow fadeIn" data-wow-delay="0.2s">
</div>
<div class="con">
    <div class="wrap">
        <div class="maincon01">
            <div class="contt">
                <h4>지역별 농장 리스트</h4>
            </div>
            <div class="main_localList">
                <ul>
                    <li><a href="/list?local=서울">
                        <img src="/img/seoul02.jpg" alt="seoul">
                    </a></li>
                    <li><a href="/list?local=부산">
                        <img src="/img/busan.jpg" alt="busan">
                    </a></li>
                    <li><a href="/list?local=강원">
                        <img src="/img/gangwon02.jpg" alt="강원">
                    </a></li>
                    <li><a href="/list?local=충청">
                        <img src="/img/chungcheong.jpg" alt="충청">
                    </a></li>
                    <li><a href="/list?local=전라">
                        <img src="/img/jeolla02.jpg" alt="전라">
                    </a></li>
                    <li><a href="/list?local=경상">
                        <img src="/img/gyeongsang.png" alt="경상">
                    </a></li>

                </ul>
            </div>
        </div>
        <div class="maincon02">
            <div class="contt">
                <h4>나의 농장 스토리</h4>
            </div>
            <div class="mainstory">
                <ul>
                    <li>
                        <a href="/storyDetail?sno=1">
                            <img src="" alt="">
                            <div class="mainstory_txt">
                                <b>너무 좋아욤</b>
                                <p>행복행복 데스텡ㅎㅎㅎㅎ</p>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="maincon03">
        <div class="wrap">
            <div class="contt">
                <h4>도시 속 작은 농장, 당신의 주말을 초록으로 채워드립니다.</h4>
                <p class="">
                    Weekend Farm은 바쁜 일상 속에서 자연과 연결하는 기회를 제공합니다. 직접 농사를 지어 신선한 식탁을 경험 하고 , 일상의 스트레스를 해소할 수 있습니다.
                </p>
                <p>단순한 농작물 재배를 넘어, 도시인에게 자연을 통한 힐링과 가족 간의 소중한 추억을 만들어가는 장소로, 주말마다 삶에 풍성한 자연의 색감과 생명력을 더하는 재충전의 시간을 가져보세요.</p>
            </div>
        </div>
    </div>
</div>
<%@include file="../include/footer.jsp" %>

