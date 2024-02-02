<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<div class="wrap con list-detail">
<%--
    이미지 /
    농장이름 /
    테마 /
    리뷰
    서비스
    농장소개 /
    이용정보
    위치 /
--%>
    <c:set var="farm" value="${listDetail}"/>
    <div class="gallery">
        <ul>
            <li><img src="${listDetail.wfImgUrl1}" alt="이미지1"></li>
            <li><img src="/img/placeholder.png" alt="placeholder image"></li>
            <li><img src="/img/placeholder.png" alt="placeholder image"></li>
            <li><img src="/img/placeholder.png" alt="placeholder image"></li>
            <li><img src="/img/placeholder.png" alt="placeholder image"></li>
        </ul>
    </div>
    <h1>${listDetail.wfSubject}</h1>
    <h3>${listDetail.wfTheme}</h3>
   <%-- <div class="farmSummary">
        <h4>농장소개</h4>
        <p class="summary_txt">딸기家 교육농장은 대구시내에 있는 농장으로 대구시민들이 대중교통을 이용해서도 바로 접근이 가능한 위치에 있는 딸기 전문체험교육농장입니다. 주말 가족단위의 체험과 평일 유치원 어린이집 등 단체체험을 전문으로 하는 농장입니다. 천적과 클로렐라를 이용한 안전한 딸기를 생산하는 농가로 현장에서 바로 따서 씻지 않고 먹을 수 있습니다. 딸기를 매개체로 초·중·고 교과과정과 연계한 교육으로 농업의 가치와 미래를 알리고 올바른 인성을 함양하는 힐링 농장. 농장에는 어린이와 가족들을 위한 체험동이 따로 준비되어 있고 커피와 음료 등을 마시고 아이들이 놀이방에서 놀면서 힐링을 할 수 있는 공간이 마련되어 있습니다. </p>
    </div>
    <div class="farmSummary">
        <h4>농장 주요시설</h4>
        <p class="summary_txt"> ○3연동의 생산 하우스시설(1800㎡), 1동의 연구하우스 시설(180㎡), 1동의 체험 놀이 시설(330㎡) </p>
    </div>
    <strong></strong>
    <div class="farmSummary">
        <h4>숙박·식사제공</h4>
        <p class="summary_txt">숙박(x/가족들이 사온 도시락이나 주변의 배달음식은 취식가능함),식사(x/대구시내에 위치하고 있어 호텔 및 모텔 등 이용 가능함) </p>
    </div>
    <div class="farmSummary">
        <h4>체험, 교육프로그램</h4>
        <p class="summary_txt"> ○딸기 밭 나들이 : 초, 중, 고 사회 과학 생태계와 환경, 식물과 에너지, 식물의 한 살이 등<br /> ○딸기 엄마가 될래요, 딸기 한 살이 프로젝트, 고품질 딸기 생산 현장실습, 스마트 팜 농업 경경실습 , 의료 관광 외국인을 위한 치유 농업 체험, 해외 농업인의 딸기 농업 연수현장 교육 <br />
        </p>
    </div>--%>
    <div class="farm-content">${listDetail.wfContent}</div>
    <div class="map-wrap">
        <h2>농장 위치</h2>
        <div id="map" class="map"></div>
    </div>
</div>
<script>
    /* empty strong tag */
    document.addEventListener('DOMContentLoaded', (event) => {
        const strongTag = document.querySelectorAll('.farm-content strong');
        //console.log(strongTag);
        strongTag.forEach((element) => {
            if (element.textContent.trim().length === 0) {
                console.log('Strong tag is empty');
                element.style.display = 'none';
            } else {
                console.log('Strong tag has content');
            }
        });
    });

    /* map영역 */
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    // 지도를 표시할 div와  지도 옵션으로  지도를 생성
    var map = new kakao.maps.Map(mapContainer, mapOption);

</script>
<%@include file="../include/footer.jsp" %>
