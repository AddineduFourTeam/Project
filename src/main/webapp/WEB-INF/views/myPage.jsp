<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp" %>

<div class="con wrap">
    <div class="my-full-wrap">
        <h3><p>${loginUser.memid}님 회원정보</p></h3>
        <div class="tap-wrap">
            <div class="my-tap">
                <ul>
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
                </ul>
            </div>

            <div class="my-wrap">
                <ul class="my-info" style="list-style-type: none;">
                    <li class="file-top my-img">
                        <p>프로필이미지</p>
                        <span>
                            <img src="${loginUser.memImg}" onerror="this.src='img/profileImg_w.png'">
                        </span>
                    </li>
                    <li class="my-input-box">
                        <p>이름</p>
                        <input name="name" id="name"  value="${loginUser.name}" readonly>
                        <p>생년월일</p>
                        <input name="birth" id="birth"  value="${loginUser.birth}" readonly>
                        <p>이메일</p>
                        <input type="text" name="email" id="email" class="form-control" value="${loginUser.email}" readonly>
                    </li>
                </ul>
            </div>
        </div>

    </div>
</div>

<%@include file="../include/footer.jsp" %>