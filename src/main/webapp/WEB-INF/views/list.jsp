<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<div class="con list-wrap">
     <form action="" class="search-form" method="get">
            <select name="select" id="select" class="list-select">
                <option value="location">지역명</option>
                <option value="farm-name">농장명</option>
            </select>
            <input type="search" name="search" id="search" class="list-search" placeholder="지역검색">
            <button><i class="fa-solid fa-magnifying-glass"></i></button>
        </form>
    <div class="container">
        <div class="farm-list">
            <ul>
                <c:forEach items="${farm}" var="farm">
                <li>
                    <a href="#">
                        <div class="view">
                            <img src="http://www.nongsaro.go.kr/cms_contents/1096/229873_MF_BIMG_12.jpg">
                        </div>
                        <div class="desc">
                            <div class="left">
                                <p class="title">${farm.wfSubject}</p>
                                <span class="theme">천연염색 </span>
                            </div>
                            <div class="right">
                                <i class="fa-solid fa-star"></i>
                                <span class="score">4.5</span>
                            </div>
                        </div>
                    </a>
                </li>
                </c:forEach>
            </ul>
            <div style="text-align:center">
                <c:if test="${nowPage > 0}">
                    <a href="list?nowPage=${nowPage - 1}">Prev...</a>
                </c:if>

                <c:forEach var="pageNumber" begin="0" end="${totalPages - 1}" step="1">
                    <c:choose>
                        <c:when test="${pageNumber == nowPage}">
                            <strong>[${pageNumber + 1}]</strong>
                        </c:when>
                        <c:otherwise>
                            <a href="list?nowPage=${pageNumber + 1}">[${pageNumber + 1}]</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <c:if test="${nowPage < totalPages - 1}">
                    <a href="list?nowPage=${nowPage + 1}">...Next</a>
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
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
    var map = new kakao.maps.Map(mapContainer, mapOption);
</script>

<%@include file="../include/footer.jsp" %>
