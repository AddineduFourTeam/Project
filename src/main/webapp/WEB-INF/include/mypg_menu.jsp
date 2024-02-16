<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="my-full-wrap">
    <div class="boarder_top">
        <h2>
            마이페이지
            <c:if test="${fn:contains(folderName, 'myPage')}">
                - 홈
            </c:if>
            <c:if test="${fn:contains(folderName, 'updatePass')}">
                - 비밀번호 변경
            </c:if>
            <c:if test="${fn:contains(folderName, 'updateMyInfo')}">
                - 회원정보 변경
            </c:if>
        </h2>
    </div>
    <input type="hidden" name="memid" value="${loginUser.memid}">
    <div class="my-tap-wrap">
<div class="my-tap">
    <ul>
        <li>
            <a href="myPage">
                <input class="btn-join" type="button" value="홈">
            </a>
        </li>
        <li>
            <a href="updateMyInfo">
                <input class="btn-join" type="button" value="회원정보변경">
            </a>
        </li>
        <li>
            <a href="updatePass">
                <input class="btn-join" type="button" value="비밀번호변경">
            </a>
        </li>
        <li>
            <a href="cancelAccount">
                <input class="btn-join" type="button" value="회원탈퇴">
            </a>
        </li>
        <li>
            <a href="#">
                <input class="btn-join" type="button" value="예약내역">
            </a>
        </li>
        <li>
            <a href="#">
                <input class="btn-join" type="button" value="리뷰내역">
            </a>
        </li>
    </ul>
</div>