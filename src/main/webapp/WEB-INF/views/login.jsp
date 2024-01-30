
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp" %>

<div>
    <c:choose>
        <c:when test="${loginUser != null}">
            <b>${loginUser.memid}</b>님 환영
            <a href="logout">LOGOUT</a>
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
                        <input type="submit" value="LOGIN">
                    </li>
                </ul>
            </form>
        </c:otherwise>
    </c:choose>
</div>
<%@include file="../include/footer.jsp" %>