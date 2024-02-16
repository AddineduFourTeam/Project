<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../include/header.jsp" %>
<c:set var="farm" value="${listDetail}"/>
<nav class="list_nav">
    <div class="wrap">
        <div class="list_wrap">
            <ul>
                <li><a href="#">소개</a></li>
                <li><a href="#">나는</a></li>
                <li><a href="#">지금</a></li>
                <li><a href="#">위치</a></li>
                <li><a href="#">리뷰</a></li>
            </ul>
        </div>
        <div class="btn_wrap">
<%--            <a href="/reservation?id=${listDetail.wfIdx}" id="dtn">--%>
<%--                <span>예약하기</span>--%>
<%--            </a>--%>
            <button class="rv_btn">
                <span onclick="showModal('reservation')">예약하기</span>
            </button>
        </div>
    </div>
</nav>
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

    <div class="gallery">
        <ul>
            <li><img src="${farm.wfImgUrl1}" alt="이미지1" onerror="this.src='/img/placeholder.png'"></li>
            <c:forEach begin="0" end="3">
            <li><img src="" alt="placeholder image" onerror="this.src='/img/placeholder.png'"></li>
            </c:forEach>
        </ul>
    </div>
    <h2>${listDetail.wfSubject}</h2>
    <h3>${listDetail.wfTheme}</h3>
    <div class="farm-content">${listDetail.wfContent}</div>
    <div class="map-wrap">
        <h2>농장 위치</h2>
        <div id="map" class="map"></div>
        <div class="zoomcontrol">
            <span onclick="zoomIn()"><i class="fa-solid fa-plus"></i></span>
            <span onclick="zoomOut()"><i class="fa-solid fa-minus"></i></span>
        </div>
        <div class="addr_con">
            <p class="addr">${listDetail.wfAddr}</p>
            <button class="copy" type="button">
                <i class="fa-solid fa-copy"></i>
                <span>주소 복사</span>
            </button>
        </div>
        <div class="toast_message">복사가 완료되었어요!</div>
    </div>
</div>
<%-- 모달창 --%>
<%@include file="../include/modal.jsp" %>
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
    // 지도 생성 및 초기화

    var map; // 전역 변수로 map 객체 선언

    function initMap() {
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 초기 중심좌표
                level: 3 // 지도의 초기 확대 레벨
            };

         map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

        return map;
    }
    // 지도 확대 함수
    function zoomIn() {
        if(map) map.setLevel(map.getLevel() - 1);
    }

    // 지도 축소 함수
    function zoomOut() {
        if(map) map.setLevel(map.getLevel() + 1);
    }

    // 주소에 따른 마커 업데이트
    function updateMarkerByAddress(map) {
        //console.log(`${listDetail.wfAddr}`);
        $.ajax({
            url: '/api/coordinates',
            type: 'GET',
            data: {address: `${listDetail.wfAddr}`},
            success: function (response) {
                console.log(`${listDetail.wfAddr}`);
                // 지도의 중심을 결과 좌표로 이동시키고 마커 업데이트
                var newPosition = new kakao.maps.LatLng(response.y, response.x);
                map.setCenter(newPosition);

                var imageSrc = '/img/location.svg', // 마커이미지의 주소입니다
                    imageSize = new kakao.maps.Size(44, 50), // 마커이미지의 크기입니다
                    imageOption = {offset: new kakao.maps.Point(21, 47)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

                // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
                var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)

                var marker = new kakao.maps.Marker({
                    position: newPosition,
                    image: markerImage
                });
                marker.setMap(map);

                var iwContent = '<div style="padding:5px;">${listDetail.wfSubject} <br><a href="https://map.kakao.com/link/map/${listDetail.wfSubject},'+response.y+','+response.x+'" target="_blank">지도보기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                    iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

                var infowindow = new kakao.maps.InfoWindow({
                    position : iwPosition,
                    content : iwContent
                });

                infowindow.open(map, marker);
            },
            error: function (xhr, status, error) {
                console.log("error");
                alert("위치를 불러오는데 실패했습니다: " + error);
            }
        });
    }

    $(document).ready(function () {
        var map = initMap(); // 지도 초기화
        updateMarkerByAddress(map); // 주소 기반으로 마커 업데이트
    });

    /* copy & toast*/
    const text = document.querySelector(".addr");
    let tostBtn = document.querySelector('.copy');

    // 토스트 메세지
    let tostMessage = document.querySelector('.toast_message');

    tostBtn.addEventListener('click', () => {
        window.navigator.clipboard.writeText(text.textContent).then(() => {
            // alert("복사가 완료되었습니다.");
            tostOn();
        })
    });

    function tostOn(){
        tostMessage.classList.add('active');
        setTimeout(function(){
            tostMessage.classList.remove('active');
        },2000);
    }

    //3. 토스트 버튼에 이벤트 연결
    tostBtn.addEventListener('click',function(){
        console.log('해치웠나???');
        tostOn()
    });

</script>
<%@include file="../include/footer.jsp" %>