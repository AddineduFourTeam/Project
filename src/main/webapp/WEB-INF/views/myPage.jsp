<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp" %>

<div class="join-wrap">
    <div class="join-form">
        <form action="updateMyInfo" onsubmit="validateForm()" method="post" id="updateMyInfo" enctype="multipart/form-data">
            <ul style="list-style-type: none">
                <li>
                    <h3><p>${loginUser.memid}님 회원정보 변경</p></h3>
                </li>
                <li class="join-input-box">
                    <p>비밀번호</p>
                    <input type="password" name="pass" id="pass">
                </li>
                <li class="join-input-box">
                    <p>비밀번호 확인</p>
                    <input type="password" name="repass" id="repass">
                    <div id="checkRePassResult" style="font-size:0.8em; display:none;"></div>
                </li>
                <li class="join-input-box">
                    <p>이름</p>
                    <input name="name" id="name"  value="${loginUser.name}">
                    <div id="checkNameResult" style="font-size:0.8em; display:none;"></div>
                </li>
                <li class="join-input-box">
                    <p>생년월일</p>
                    <input name="birth" id="birth"  value="${loginUser.birth}">
                    <div id="checkBirthResult" style="font-size:0.8em; display:none;"></div>
                </li>
                <li class="join-input-box">
                    <p>휴대전화번호</p>
                    <input name="phone" id="phone"  value="${loginUser.phone}">
                    <div id="checkPhoneResult" style="font-size:0.8em; display:none;"></div>
                </li>
                <li>
                    <div class="email_box">
                        <div class="email-input-box">
                            <p>이메일</p>
                            <input type="text" name="email" id="email" class="form-control" value="${loginUser.email}">
                        </div>
                    </div>
                </li>
                <li class="file-top">
                    <p>프로필이미지</p>
                    <input type="file" name="file" id="file" class="btn-file">
                    <span class="modi_img" >
            <img src="" alt="" id="View">
          </span>
                </li>
                <li>
                    <input class="btn-join" type="submit" value="회원정보변경">
                </li>
            </ul>
        </form>
    </div>
</div>

<%@include file="../include/footer.jsp" %>