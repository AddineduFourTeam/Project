<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-01-26
  Time: 오후 4:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="boarder_top">
    <h2>
        <c:if test="${fn:contains(folderName, 'board')}">
            고객센터
        </c:if>
        <c:if test="${fn:contains(folderName, 'story')}">
            농장 스토리
        </c:if>
    </h2>
    <div class="search">
        <form action="search">
            <select name="type" id="type">
                <option value="title">제목</option>
                <option value="content">내용</option>
            </select>
            <input type="text" name="keyword" id="keyword" value="${param.keyword}">
            <button type="submit">검색</button>
        </form>
    </div>
</div>
