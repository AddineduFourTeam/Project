<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<div class="wrap con">
    <%@include file="../include/board_search.jsp" %>
    <div class="board_con">
        <div class="board_tb">
            <table>
                <tr>
                    <th>NO.</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>등록일</th>
                    <th>이미지</th>
                </tr>
                <c:if test="${not empty list}">
                    <!-- list 데이터가 있을 때 수행할 작업 -->
                    <c:forEach var="list" items="${list}" varStatus="status">
                        <tr>
                            <td>${status.count}</td>
                            <td><a href="/storyDetail?sno=${list.storyIdx}">${list.storySubject}</a></td>
                            <td>${list.storyMemName}</td>
                            <td><fmt:formatDate value="${list.storyDate}" pattern="yyyy-MM-dd" /></td>
                            <td><img src="/image/${list.storyIdx}" alt=""></td>
                        </tr>
                    </c:forEach>
                </c:if>
                <c:if test="${empty list}">
                    <!-- list 데이터가 없을 때 수행할 작업 -->
                    <tr>
                        <td colspan="5">자료가 없습니다.</td>
                    </tr>
                </c:if>
            </table>
        </div>
        <a href="" class="storybtn">스토리 올리기</a>
        <%@include file="../include/paging.jsp" %>
    </div>
</div>
<%@include file="../include/footer.jsp" %>