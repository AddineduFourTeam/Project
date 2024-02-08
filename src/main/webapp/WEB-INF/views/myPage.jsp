<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp" %>

<div class="join-wrap">
    <div class="join-form">
        <ul style="list-style-type: none">
            <li>
                <h3><p>${loginUser.memid}님 회원정보</p></h3>
            </li>
            <li class="join-input-box">
                <p>이름</p>
                <input name="name" id="name"  value="${loginUser.name}" readonly>
                <div id="checkNameResult" style="font-size:0.8em; display:none;"></div>
            </li>
            <li class="join-input-box">
                <p>생년월일</p>
                <input name="birth" id="birth"  value="${loginUser.birth}" readonly>
                <div id="checkBirthResult" style="font-size:0.8em; display:none;"></div>
            </li>
            <li class="join-input-box">
                <p>휴대전화번호</p>
                <input name="phone" id="phone"  value="${loginUser.phone}" readonly>
                <div id="checkPhoneResult" style="font-size:0.8em; display:none;"></div>
            </li>
            <li>
                <div class="join-input-box">
                    <p>이메일</p>
                    <input type="text" name="email" id="email" class="form-control" value="${loginUser.email}">
                </div>
            </li>
            <li class="file-top">
                <p>프로필이미지</p>
                <span>
                    <img src="${loginUser.memImg}" onerror="this.src='img/profileImg_w.png'">
                </span>
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
                <input id="myContent" class="btn-join" type="button" value="내가 쓴 글 보기">
            </li>
        </ul>
    </div>
</div>

<%@include file="../include/footer.jsp" %>