<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-01-17
  Time: 오후 5:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<div class="mainImg">
    <img src="/img/mainimg.jpg" alt="초원에 집에 있는 메인 이미지">
</div>
<div class="wrap con">
    <div class="con01">

    </div>

<c:choose>
    <c:when test="${loginUser != null}">
        <b>${loginUser.memid}</b>님 환영
        <a href="logout">LOGOUT</a>
        <img src="${loginUser.memImg}">
    </c:when>
    <c:otherwise>
        <a href="memInsertForm">회원가입</a>
        <a href="loginForm">로그인</a>
    </c:otherwise>
</c:choose>
</div>
<%@include file="../include/footer.jsp" %>

