
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp" %>

<div class="con login-wrap">
    <div class="login-form">
        <c:choose>
            <c:when test="${loginUser != null}">
                <b>${loginUser.memid}</b>님 환영
                <a href="logout">LOGOUT</a>
            </c:when>
            <c:otherwise>
                <form action="loginForm" method="post">
                    <ul>
                        <li>
                            <h3>LOGIN</h3>
                        </li>
                        <li class="login-input-box">
                            <input name="memid" id="id" placeholder="ID">
                        </li>
                        <li class="login-input-box">
                            <input type="password" name="pass" id="pass" placeholder="PASSWORD">
                        </li>
                        <li class="forgot-pass">
                            <a href="forgotPass">비밀번호 찾기</a>
                        </li>
                        <li>
                            <input class="btn-login" type="submit" value="LOGIN">
                        </li>
                    </ul>
                </form>
            </c:otherwise>
        </c:choose>
    </div>
</div>
<%@include file="../include/footer.jsp" %>