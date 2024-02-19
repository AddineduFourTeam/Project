<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../include/header.jsp" %>
<c:set var="farm" value="${listDetail}"/>
<nav class="list_nav">
    <div class="wrap">
        <div class="list_wrap">
            <div class="line"></div>
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
        서비스/
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
    <h4>${listDetail.wfTheme}</h4>
    <div class="preview">
        <div class="point">
           <i class="fa-solid fa-star"></i>
            <span>${listDetail.wfRating}</span>
            <a href="#">리뷰보기</a>
        </div>
        <div class="preview_wrap">
            <div class="preview_swiper">
                <ul class="swiper-wrapper">
                    <c:forEach begin="0" end="10">
                        <li class="swiper-slide">
                            <i class="fa-solid fa-quote-left"></i>
                            <div class="slide_wrap">
                                <p>안녕하세요 지금은 배고픈 시간입니다 :)</p>
                                <div class="user_info">
                                    <p class="nickname">이시영바보</p>
                                    <span class="date">리뷰를 단 날짜가 들어가는 자리입니당</span>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="preview-button-prev"><i class="fa-solid fa-angle-left"></i></div>
            <div class="preview-button-next"><i class="fa-solid fa-angle-right"></i></div>
        </div>
    </div>
    <div class="farm-content">
        <h2>농장 소개</h2>
        ${listDetail.wfContent}
    </div>
    <div class="service">
        <h2>서비스</h2>
        <div class="service_wrap">
            <div>
                <i class="fa-solid fa-wifi"></i>
                <span>와이파이</span>
            </div>
            <div>
                <i class="fa-solid fa-square-parking"></i>
                <span>무료주차</span>
            </div>
            <div>
                <i class="fa-solid fa-trowel"></i>
                <span>도구대여</span>
            </div>
            <div>
                <i class="fa-solid fa-faucet-drip"></i>
                <span>개수대 완비</span>
            </div>
            <div>
                <i class="fa-solid fa-truck-monster"></i>
                <span>농기구대여</span>
            </div>
            <div>
                <i class="fa-solid fa-couch"></i>
                <span>휴게공간</span>
            </div>
            <div>
                <i class="fa-solid fa-tent"></i>
                <span>비닐하우스</span>
            </div>
            <div>
                <i class="fa-solid fa-shower"></i>
                <span>샤워실 완비</span>
            </div>
            <div>
                <i class="fa-solid fa-restroom"></i>
                <span>화장실</span>
            </div>
            <div>
                <i class="fa-regular fa-credit-card"></i>
                <span>카드결제</span>
            </div>
            <div>
                <i class="fa-solid fa-ban-smoking"></i>
                <span>금연</span>
            </div>
        </div>
    </div>
    <div class="farmer-info">
        <h2>농장주정보</h2>
        <p><i class="fa-solid fa-phone"></i>${farm.wfTel}</p>
    </div>
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
<%--    <c:choose>--%>
<%--        <c:when test="${not empty reviews}">--%>
<%--            <c:forEach var="review" items="${reviews}" varStatus="i">--%>
<%--                <fmt:parseDate value="${review.reviewDate}" pattern="yy. M. d. a h:mm" var="parsedDateTime" type="both" />--%>
<%--                <tr>--%>
<%--                    <td>${i.count}</td>--%>
<%--                    <td><a href="mypageReservation?id=${review.reviewIdx}" class="ellipsis">${review.reviewSubject}</a></td>--%>
<%--                    <td><fmt:formatDate pattern="yyyy.MM.dd" value="${parsedDateTime}" /></td>--%>
<%--                </tr>--%>
<%--            </c:forEach>--%>
<%--        </c:when>--%>
<%--        <c:otherwise>--%>
<%--            <tr>--%>
<%--                <td colspan="3">자료가 없습니다.</td>--%>
<%--            </tr>--%>
<%--        </c:otherwise>--%>
<%--    </c:choose>--%>
    <div class="review">
        <h2>농장 후기</h2>
        <c:forEach begin="0" end="5">
            <div class="review_wrap">
                <div class="user_info">
                    <span class="user_img"><img src="img/profileImg.png"/></span>
                    <p class="nickname">이시영바보</p>
                    <span class="date">리뷰를 단 날짜</span>
                </div>
                <div class="review_flex">
                    <div class="review_swiper_wrap">
                        <div class="point">
                            <i class="fa-solid fa-star"></i>
                            <span>${listDetail.wfRating}</span>
                        </div>
                        <div class="review_swiper">
                            <ul class="swiper-wrapper">
                                <c:forEach begin="0" end="10">
                                    <li class="swiper-slide">
                                        <div class="slide_wrap">
                                            <img src="${farm.wfImgUrl1}" alt="이미지1" onerror="this.src='/img/placeholder.png'">
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                            <div class="review-button-prev"><i class="fa-solid fa-angle-left"></i></div>
                            <div class="review-button-next"><i class="fa-solid fa-angle-right"></i></div>
                        </div>
                    <div class="review_txt">
                        <p>솔직히 말할게 많이 기다려 왔어
                            너도 그랬을 거라 믿어
                            오늘이 오길
                            매일같이 달력을 보면서
                            솔직히 나에게도
                            지금 이 순간은
                            꿈만 같아 너와 함께라
                            오늘을 위해
                            꽤 많은 걸 준비해 봤어
                            All about you and I
                            다른 건 다 제쳐 두고
                            Now come with me
                            Take my hand
                            아름다운 청춘의 한 장
                            함께 써내려 가자
                            너와의 추억들로
                            가득 채울래
                            (Come on!)
                            아무 걱정도 하지는 마
                            나에게 다 맡겨 봐
                            지금 이 순간이
                            다시 넘겨볼 수 있는
                            한 페이지가 될 수 있게
                            솔직히 말할게 많이 기다려 왔어
                            너도 그랬을 거라 믿어
                            오늘이 오길
                            매일같이 달력을 보면서
                            솔직히 나에게도
                            지금 이 순간은
                            꿈만 같아 너와 함께라
                            오늘을 위해
                            꽤 많은 걸 준비해 봤어
                            All about you and I
                            다른 건 다 제쳐 두고
                            Now come with me
                            Take my hand
                            아름다운 청춘의 한 장
                            함께 써내려 가자
                            너와의 추억들로
                            가득 채울래
                            (Come on!)
                            아무 걱정도 하지는 마
                            나에게 다 맡겨 봐
                            지금 이 순간이
                            다시 넘겨볼 수 있는
                            한 페이지가 될 수 있게
                            솔직히 말할게 많이 기다려 왔어
                            너도 그랬을 거라 믿어
                            오늘이 오길
                            매일같이 달력을 보면서
                            솔직히 나에게도
                            지금 이 순간은
                            꿈만 같아 너와 함께라
                            오늘을 위해
                            꽤 많은 걸 준비해 봤어
                            All about you and I
                            다른 건 다 제쳐 두고
                            Now come with me
                            Take my hand
                            아름다운 청춘의 한 장
                            함께 써내려 가자
                            너와의 추억들로
                            가득 채울래
                            (Come on!)
                            아무 걱정도 하지는 마
                            나에게 다 맡겨 봐
                            지금 이 순간이
                            다시 넘겨볼 수 있는
                            한 페이지가 될 수 있게
                            솔직히 말할게 많이 기다려 왔어
                            너도 그랬을 거라 믿어
                            오늘이 오길
                            매일같이 달력을 보면서
                            솔직히 나에게도
                            지금 이 순간은
                            꿈만 같아 너와 함께라
                            오늘을 위해
                            꽤 많은 걸 준비해 봤어
                            All about you and I
                            다른 건 다 제쳐 두고
                            Now come with me
                            Take my hand
                            아름다운 청춘의 한 장
                            함께 써내려 가자
                            너와의 추억들로
                            가득 채울래
                            (Come on!)
                            아무 걱정도 하지는 마
                            나에게 다 맡겨 봐
                            지금 이 순간이
                            다시 넘겨볼 수 있는
                            한 페이지가 될 수 있게
                        </p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<%-- 모달창 --%>
<%@include file="../include/modal.jsp" %>
<script>

    /* nav */
    document.addEventListener('DOMContentLoaded', (event) => {
        let tabs = document.querySelectorAll(".list_wrap ul li");
        let underLine = document.querySelector(".line");

        for (let i = 0; i < tabs.length; i++) {
            tabs[i].addEventListener("click", filter);
        }

        function filter(event) {
            underLine.style.left = event.currentTarget.offsetLeft + "px";
            underLine.style.width = event.currentTarget.offsetWidth + "px";
            underLine.style.top = event.currentTarget.offsetTop + event.currentTarget.offsetHight + "px";
        }
    });

    /* swiper*/
    var swipe1 = new Swiper(".preview_swiper", {
        slidesPerView : 3,
        spaceBetween: 30,
        navigation: {
            nextEl: ".preview-button-next",
            prevEl: ".preview-button-prev",
        },
    });
    var swiper2 = new Swiper(".review_swiper", {
        slidesPerView : 3,
        spaceBetween: 30,
        navigation: {
            nextEl: ".review-button-next",
            prevEl: ".review-button-prev",
        },
    });

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

                var infoContent = '<div class="customoverlay">' +
                    '  <a href="https://map.kakao.com/link/map/${listDetail.wfSubject},'+response.y+','+response.x+'" target="_blank">' +
                    '    <span class="title">${listDetail.wfSubject}</span>' +
                    '  </a>' +
                    '</div>';

                var customOverlay = new kakao.maps.CustomOverlay({
                    position: newPosition,
                    content: infoContent,
                    yAnchor: 1
                });

                customOverlay.setMap(map);

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