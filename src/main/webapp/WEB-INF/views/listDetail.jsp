<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header_2.jsp" %>
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
    <div class="farm-content">${listDetail.wfContent}</div>
    <div class="map-wrap">
        <h2>농장 위치</h2>
        <div id="map" class="map"></div>
        <div id="result">여기에 결과가 표시됩니다</div>
    </div>

    <div class="background">
        <div class="window">
            <div class="popup">
                <h2>${listDetail.wfSubject}</h2>
                <button class="close"><i class="fa-solid fa-xmark"></i></button>
                <div style="--swiper-navigation-color: #000; --swiper-pagination-color: #000" class="swiper mySwiper2">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <img src="${listDetail.wfImgUrl1}" alt="이미지1" />
                        </div>
                        <div class="swiper-slide">
                            <img src="/img/placeholder.png" alt="placeholder image" />
                        </div>
                        <div class="swiper-slide">
                            <img src="/img/placeholder.png" alt="placeholder image" />
                        </div>
                        <div class="swiper-slide">
                            <img src="/img/placeholder.png" alt="placeholder image" />
                        </div>
                        <div class="swiper-slide">
                            <img src="/img/placeholder.png" alt="placeholder image" />
                        </div>
                        <div class="swiper-slide">
                            <img src="/img/placeholder.png" alt="placeholder image" />
                        </div>
                        <div class="swiper-slide">
                            <img src="/img/placeholder.png" alt="placeholder image" />
                        </div>
                        <div class="swiper-slide">
                            <img src="/img/placeholder.png" alt="placeholder image" />
                        </div>
                        <div class="swiper-slide">
                            <img src="/img/placeholder.png" alt="placeholder image" />
                        </div>
                        <div class="swiper-slide">
                            <img src="/img/placeholder.png" alt="placeholder image" />
                        </div>
                    </div>

                    <div class="swiper-button-next"><i class="fa-solid fa-angle-right"></i></div>
                    <div class="swiper-button-prev"><i class="fa-solid fa-angle-left"></i></div>

                </div>
                <div thumbsSlider="" class="swiper mySwiper">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <img src="${listDetail.wfImgUrl1}" alt="이미지1" />
                        </div>
                        <div class="swiper-slide">
                            <img src="/img/placeholder.png" alt="placeholder image" />
                        </div>
                        <div class="swiper-slide">
                            <img src="/img/placeholder.png" alt="placeholder image" />
                        </div>
                        <div class="swiper-slide">
                            <img src="/img/placeholder.png" alt="placeholder image" />
                        </div>
                        <div class="swiper-slide">
                            <img src="/img/placeholder.png" alt="placeholder image" />
                        </div>
                        <div class="swiper-slide">
                            <img src="/img/placeholder.png" alt="placeholder image" />
                        </div>
                        <div class="swiper-slide">
                            <img src="/img/placeholder.png" alt="placeholder image" />
                        </div>
                        <div class="swiper-slide">
                            <img src="/img/placeholder.png" alt="placeholder image" />
                        </div>
                        <div class="swiper-slide">
                            <img src="/img/placeholder.png" alt="placeholder image" />
                        </div>
                        <div class="swiper-slide">
                            <img src="/img/placeholder.png" alt="placeholder image" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

    /* modal */
    document.addEventListener('DOMContentLoaded', () => {
        const galleryItems = document.querySelectorAll(".gallery ul li");
        const modal = document.querySelector(".background");
        const closeButton = document.querySelector(".close");

        galleryItems.forEach(li => li.addEventListener('click', () => showModal(modal)));
        closeButton.addEventListener('click', () => closeModal(modal));
        // modal.addEventListener('click', () => closeModal(modal));
    });

    const showModal = (modal) => modal.className = "background show";
    const closeModal = (modal) => modal.className = "background";


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

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    // 마커가 표시될 위치입니다
    var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667);

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: markerPosition
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);



    /* 지도 좌표 가져오기 */
    $(document).ready(function(){
        console.log(`${listDetail.wfAddr}`);
        $.ajax({
            url: '/api/coordinates',
            type: 'GET',
            data: {
                address: `${listDetail.wfAddr}`
            },
            success: function(response) {
                console.log(response)
                // 요청이 성공했을 때 실행할 함수
                $('#result').html('경도: ' + response.x + ', 위도: ' + response.y);
            },
            error: function(xhr, status, error) {
                // 요청이 실패했을 때 실행할 함수
                $('#result').html('에러: ' + error);
            }
        });
    });



    /* 갤러리 */
    var swiper = new Swiper(".mySwiper", {
        spaceBetween: 10,
        slidesPerView: 6,
        freeMode: true,
        watchSlidesProgress: true,
    });
    var swiper2 = new Swiper(".mySwiper2", {
        spaceBetween: 10,
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
        thumbs: {
            swiper: swiper,
        },
    });

</script>
<%@include file="../include/footer.jsp" %>
