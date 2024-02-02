
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>

<div>
    <form action="forgotPassSubmit" method="post">
        <ul>
            <li>
                <h3>비밀번호 재설정</h3>
            </li>
            <li>
                <p>아이디</p>
                <input name="memid" id="memid">
            </li>
            <li>
                <p>이메일</p>
                <input type="email" name="email" id="email">
            </li>
            <li>
                <p>휴대전화번호</p>
                <input name="phone" id="phone">
            </li>
            <li>
                <input type="submit" value="비밀번호 재설정">
            </li>
        </ul>
    </form>
</div>
<div>
    <form id="newPass" method="post" style="display:none;">
        <li class="join-input-box">
            <p>비밀번호</p>
            <input type="password" name="pass" id="pass" placeholder="비밀번호를 입력해주세요">
        </li>
        <li class="join-input-box">
            <p>비밀번호 확인</p>
            <input type="password" name="repass" id="repass" placeholder="비밀번호를 한 번 더 입력해주세요">
            <div id="checkRePassResult" style="font-size:0.8em; display:none;"></div>
        </li>
    </form>
</div>
<script>
    // 아이디,메일,전화번호가 DB와 같으면 newPass
</script>
<%@ include file="../include/footer.jsp" %>