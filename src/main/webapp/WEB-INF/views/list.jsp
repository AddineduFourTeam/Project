<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<div class="con wrap list-wrap">
    <div class="container">
        <h3>지역 선택</h3>
        <div class="filter">
            <input type="hidden" id="farm_select" name="farm_select">
            <ul class="swiper-wrapper">
                <div class="selector"></div>
                <c:forEach items="${localArray}" var="localArray" varStatus="idx">
                    <c:choose>
                        <c:when test="${idx.index == 0}">
                            <li class="swiper-slide">
                                <input type="radio" class="" id="farm_local${idx.index}" name="farm_local" value="${localArray}" checked>
                                <label for="farm_local${idx.index}">${localArray}</label>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="swiper-slide">
                                <input type="radio" class="" id="farm_local${idx.index}" name="farm_local" value="${localArray}">
                                <label for="farm_local${idx.index}">${localArray}</label>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </ul>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
        </div>
        <div class="farm-list">
            <ul>
                <c:forEach items="${farms}" var="farm">
                <li>
                    <a href="/listDetail?id=${farm.wfIdx}">
                        <div class="view">
                            <div class="view-img">
                                <img src="${farm.wfImgUrl1}">
                            </div>
                        </div>
                        <div class="desc">
                            <div class="left">
                                <p class="title">${farm.wfSubject}</p>
                                <span class="theme">${farm.wfTheme}</span>
                            </div>
                            <div class="right">
                                <i class="fa-solid fa-star"></i>
                                <span class="score">${farm.wfRating}</span>
                            </div>
                        </div>
                    </a>
                </li>
                </c:forEach>
            </ul>
            <div class="pagination">
                <!-- 이전페이지 -->
                <c:choose>
                    <c:when test="${pageNumber > 1}">
                        <a href="list?page=1"><i class="fa-solid fa-angles-left"></i></a>
                        <a href="list?page=${nowPage}"><i class="fa-solid fa-angle-left"></i></a>
                    </c:when>
                    <c:otherwise>
                        <a href="javascript:void(0)"><i class="fa-solid fa-angles-left"></i></a>
                        <a href="javascript:void(0)"><i class="fa-solid fa-angle-left"></i></a>
                    </c:otherwise>
                </c:choose>

                <!-- pagination -->
                <c:forEach begin="${startPage}" end="${endPage}" var="i">
                    <a class="<c:if test='${param.page eq i}'>on</c:if>" href="list?page=${i}"><strong>${i}</strong></a>
                </c:forEach>

                <!-- 다음페이지 -->
                <c:choose>
                    <c:when test="${pageNumber < totalPages}">
                        <a href="list?page=${nowPage + 2}"><i class="fa-solid fa-angle-right"></i></a>
                        <a href="list?page=${totalPages}"><i class="fa-solid fa-angles-right"></i></a>
                    </c:when>
                    <c:otherwise>
                        <a href="javascript:void(0)"><i class="fa-solid fa-angle-right"></i></a>
                        <a href="javascript:void(0)"><i class="fa-solid fa-angles-right"></i></a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
<%--        <div class="map-wrap">--%>
<%--            <div id="map" class="map"></div>--%>
<%--        </div>--%>
    </div>
</div>
<script>
    // /* map영역 */
    // var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    //     mapOption = {
    //         center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    //         level: 3 // 지도의 확대 레벨
    //     };
    //
    // // 지도를 표시할 div와  지도 옵션으로  지도를 생성
    // var map = new kakao.maps.Map(mapContainer, mapOption);

    /* swiper */
    var swiper = new Swiper(".filter", {
        slidesPerView : 9,
        spaceBetween: 0,
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
    });

    document.addEventListener("DOMContentLoaded", function() {
        let tabs = document.querySelectorAll(".filter ul li label");
        let selector = document.querySelector(".selector");

        if(tabs.length > 0) {
            filter({currentTarget: tabs[0]});
        }

        for (let i = 0; i < tabs.length; i++) {
            tabs[i].addEventListener("click", filter);
        }

        function filter(event) {
            let label = event.currentTarget;
            let selectorHeight = selector.offsetHeight;

            selector.style.left = label.offsetLeft + "px";
            selector.style.width = label.offsetWidth + "px";
            selector.style.top = (label.offsetTop + label.offsetHeight / 2 - selectorHeight / 2) + "px";
        }
    });



</script>

<%@include file="../include/footer.jsp" %>
