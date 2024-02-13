<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp" %>
<div style="height:300px; margin-top:20px;">
    진짜 탈퇴를 할겨?
    <br>
    <c:choose>
        <c:when test="${isOutUser==false}">
            <p class="fail_check">
                <b>비밀번호가 일치하지 않습니다</b>
            </p>
        </c:when>
    </c:choose>
    <form action="cancelAccountForm" method="post">
        비밀번호 입력
        <input type="password" name="cancelPass">
        <input type="submit" value="응 할겨">
    </form>


</div>

<%@include file="../include/footer.jsp" %>