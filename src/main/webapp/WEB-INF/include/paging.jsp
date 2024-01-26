<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-01-25
  Time: 오후 4:13
  To change this template use File | Settings | File Templates.
--%>

<!-- 페이징 영역 시작 -->
<div class="text-xs-center">
    <ul class="pagination justify-content-center">
        <!-- 이전 -->
        <li class="page-item"><a class="page-link" href="/list?page=1">처음</a></li>
        <li class="page-item"><a class="page-link" href="/list?page=${pageNumber - 1 < 0 ? 0 : pageNumber - 1}">&larr;</a></li>

        <!-- 페이지 그룹 -->
        <c:forEach begin="${startBlockPage}" end="${endBlockPage}" var="i">
            <c:choose>
                <c:when test="${pageNumber + 1 == i}">
                    <li class="page-item disabled"><a class="page-link" href="/list?page=${i}">${i}</a></li>
                </c:when>
                <c:otherwise>
                    <li class="page-item"><a class="page-link" href="/list?page=${i}">${i}</a></li>
                </c:otherwise>
            </c:choose>
            <%--<li class="page-item disabled"><a class="page-link" href="/list?page=${i}">${i}</a></li>--%>
        </c:forEach>

        <!-- 다음 -->
        <c:choose>
            <c:when test="pageNumber == totalPages ">
                <li class="page-item "><a class="page-link" href="/list?page=${pageNumber}">&rarr;</a></li>
            </c:when>
            <c:otherwise>
                <li class="page-item "><a class="page-link" href="/list?page=${pageNumber+1}">&rarr;</a></li>
            </c:otherwise>
        </c:choose>
        <li class="page-item "><a class="page-link" href="/list?page=${totalPages}">마지막</a></li>

    </ul>
</div>
<!-- 페이징 영역 끝 -->