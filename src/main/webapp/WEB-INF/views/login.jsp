<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-01-30
  Time: 오후 2:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<div class="wrap con">
    <a href="memInsertForm">회원가입</a>
    <div>
        <%-- 로그인 --%>
        <c:choose>
            <c:when test="${loginUser != null}">
                <b>${loginUser.memid}</b>님 환영
                <a href="logout">로그아웃</a>
            </c:when>
            <c:otherwise>
                <form action="login" method="post">
                    <ul>
                        <li>
                            <label for="id">ID</label>
                            <input name="memid" id="id">
                        </li>
                        <li>
                            <label for="pass">PWD</label>
                            <input type="password" name="pass" id="pass">
                        </li>
                        <li>
                            <input type="submit" value="로그인">
                        </li>
                    </ul>
                </form>

            </c:otherwise>
        </c:choose>
    </div>
</div>
<%@include file="../include/footer.jsp" %>