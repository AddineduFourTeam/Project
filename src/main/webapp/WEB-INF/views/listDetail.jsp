<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../include/header.jsp" %>
<c:set var="farm" value="${listDetail}"/>
    <nav class="list_nav">
        <div class="wrap">
            <div class="list_wrap">
                <ul>
                    <li><a href="#">안녕</a></li>
                    <li><a href="#">나는</a></li>
                    <li><a href="#">지금</a></li>
                    <li><a href="#">너무</a></li>
                    <li><a href="#">배불러</a></li>
                </ul>
            </div>
            <div class="btn_wrap">
                <a href="/reservation?id=${listDetail.wfIdx}" id="dtn">
                    <span>예약하기</span>
                </a>
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
            <li><img src="${listDetail.wfImgUrl1}" alt="이미지1"></li>
            <li><img src="/img/placeholder.png" alt="placeholder image"></li>
            <li><img src="/img/placeholder.png" alt="placeholder image"></li>
            <li><img src="/img/placeholder.png" alt="placeholder image"></li>
            <li><img src="/img/placeholder.png" alt="placeholder image"></li>
        </ul>
    </div>
    <h1>${listDetail.wfSubject}</h1>
    <h3>${listDetail.wfTheme}</h3>
    <div class="farm-content">${listDetail.wfContent}</div>
    <div class="map-wrap">
        <h2>농장 위치</h2>
        <div id="map" class="map"></div>
        <div id="result">여기에 결과가 표시됩니다</div>
    </div>

    <%-- 모달창 --%>
     <div class="background">
            <div class="window">
                <div class="popup">
                    <h2>${listDetail.wfSubject}</h2>
                    <button class="close"><i class="fa-solid fa-xmark"></i></button>
                    <div class="swiper">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide"><img src="${listDetail.wfImgUrl1}" alt="이미지1"></div>
                            <div class="swiper-slide"><img src="/img/placeholder.png" alt="placeholder image"></div>
                            <div class="swiper-slide"><img src="/img/placeholder.png" alt="placeholder image"></div>
                            <div class="swiper-slide"><img src="/img/placeholder.png" alt="placeholder image"></div>
                            <div class="swiper-slide"><img src="/img/placeholder.png" alt="placeholder image"></div>
                            <div class="swiper-slide"><img src="/img/placeholder.png" alt="placeholder image"></div>
                            <div class="swiper-slide"><img src="/img/placeholder.png" alt="placeholder image"></div>
                        </div>
                    </div>
                    <div class="swiper-button-prev"><i class="fa-solid fa-angle-left"></i></div>
                    <div class="swiper-button-next"><i class="fa-solid fa-angle-right"></i></div>
                </div>
            </div>
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

    /* modal */
   document.addEventListener('DOMContentLoaded', () => {
        const galleryItems = document.querySelectorAll(".gallery > ul >  li");
        const modal = document.querySelector(".background");
        const closeButton = document.querySelector(".close");

        /* reservation */
        // const btn = document.querySelector(".btn_wrap > button ");
        // btn.addEventListener('click', () => showModal(modal));

        galleryItems.forEach((li, index) => {
            li.addEventListener('click', () => {
                swiper.slideTo(index, 0, false)
                showModal(modal);
            });
        });
        closeButton.addEventListener('click', () => closeModal(modal));
    });
    const showModal = (modal) => {
        modal.className = "background show";
        document.querySelector(".popup").className = "popup animate__animated animate__zoomIn animate__faster";
    }
    const closeModal = (modal) => {
        document.querySelector(".popup").className = "popup animate__animated animate__zoomOut animate__faster"
        setTimeout(function (){
             modal.className = "background";
        },200)
    }

    /* 갤러리 */
    var swiper = new Swiper(".swiper", {
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
    });

    /* map영역 */
    // 지도 생성 및 초기화
    function initMap() {
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 초기 중심좌표
                level: 3 // 지도의 초기 확대 레벨
            };

        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

        return map;
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
            },
            error: function (xhr, status, error) {
                alert("위치를 불러오는데 실패했습니다: " + error); // 사용자 친화적인 에러 처리
            }
        });
    }

    $(document).ready(function () {
        var map = initMap(); // 지도 초기화
        updateMarkerByAddress(map); // 주소 기반으로 마커 업데이트
    });

</script>
<%@include file="../include/footer.jsp" %>
