<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<div class="con list-wrap">
     <form action="/search" name="search-form" class="search-form" method="get">
        <select name="select" id="select" class="list-select">
            <option value="location">지역명</option>
            <option value="title">농장명</option>
            <option value="theme">테마</option>
        </select>
        <input type="search" name="keyword" id="search" class="list-search" placeholder="검색해주세요" autocomplete= "on">
        <button><i class="fa-solid fa-magnifying-glass"></i></button>
    </form>
    <div class="container">
        <div class="farm-list">
            <ul>
                <c:forEach items="${farms}" var="farm">
                <li>
                    <a href="#">
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
                <c:if test="${nowPage > 0}">
                    <a href="list?page=1"><strong>&lt;&lt;</strong></a>
                    <a href="list?page=${nowPage}"><strong>&lt;</strong></a>
                </c:if>

                <c:forEach begin="${startPage}" end="${endPage}" var="i">
                    <c:choose>
                        <c:when test="${pageNumber == nowPage + 1 }">
                            <a href="list?page=${i}"><strong>${i}</strong></a>
                        </c:when>
                        <c:otherwise>
                            <a href="list?page=${i}">${i}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <c:if test="${nowPage < totalPages}">
                    <a href="list?page=${nowPage + 2}"><strong>&gt;</strong></a>
                    <a href="list?page=${totalPages}"><strong>&gt;&gt;</strong></a>
                </c:if>
            </div>

        </div>
        <div class="map-wrap">
            <div id="map" class="map"></div>
        </div>
    </div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=437827de1a7ca4ddf726ffe0bca1c156"></script>
<script>
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
