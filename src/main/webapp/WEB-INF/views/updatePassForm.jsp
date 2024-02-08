<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp" %>

<div class="con login-wrap">
    <div class="login-form">
            <h3>비밀번호 변경</h3>
            <h4>변경할 비밀번호를 입력해주세요</h4>
        <div class="m-top">
            <%--${ChangePass == true}--%>
            <form action="updatePass" method="post" id="updatePassForm">
                <ul>
                    <li class="join-input-box m-top">
                        <p>새로운 비밀번호 입력</p>
                        <input type="password" name="pass" id="pass" placeholder="비밀번호를 입력해주세요">
                    </li>
                    <li class="join-input-box m-top">
                        <p>비밀번호 확인</p>
                        <input type="password" name="repass" id="repass" placeholder="비밀번호를 한 번 더 입력해주세요">
                        <div id="checkRePassResult" style="font-size:0.8em; display:none;"></div>
                    </li>
                    <li>
                        <input id="updatePassBtn" class="btn-login m-top" type="submit" value="비밀번호 변경">
                    </li>
                </ul>
                <input type="hidden" name="memid">
            </form>
        </div>
    </div>
</div>
<script>
    $(()=>{
        const $passInput = $("#pass");
        const $repassInput = $("#repass");

        $repassInput.keyup(function() {
            if ($passInput.val() !== $repassInput.val()) {
                $("#checkRePassResult").show().css("color", "red").text("비밀번호가 일치하지 않습니다.");
                $("#updatePassBtn :submit").attr("disabled", true).css("background","#ddd");
            } else {
                $("#checkRePassResult").show().css("color", "#01b03f").text("비밀번호가 일치합니다.");
                $("#updatePassBtn :submit").attr("disabled", false).css("background","#01b03f");
            }
        });
    });

    $(()=>{
        $("form[id='myPagePassCheck']").submit(function(e){
            e.preventDefault();

            var formData = $(this).find('input[name="pass"]').val();

            var email = $("#loginEmail").val();
            var atIndex = email.indexOf("@");
            var a_email = email.substring(0,atIndex);
            var b_email = email.substring(atIndex+1);

            $.ajax({
                type:"POST",
                url:"/myPagePassCheck",
                data : {pass:formData},
                success:function(response){
                    if(response==true){
                        $("#updateMyInfo-wrap").show();
                        $("#myPagePassCheck").hide();

                        $("#a_email").val(a_email);
                        $("#b_email").val(b_email);

                    }else{
                        console.log("myPagePassCheck - error");
                    }
                }
            })
        })
    });
</script>
<%@include file="../include/footer.jsp" %>