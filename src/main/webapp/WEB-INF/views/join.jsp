<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<form action="memInsert" method="post" id="joinForm" enctype="multipart/form-data">
    <ul style="list-style-type: none">
      <li>
        <input type="file" name="file">
      </li>
      <li>
        <label for="memid">ID</label>
        <input name="memid" id="memid" required>
        <div id="checkIdResult" style="font-size:0.8em; display:none;"></div>
      </li>
      <li>
        <label for="pass">PWD</label>
        <input type="password" name="pass" required>
      </li>
      <li>
        <label for="name">NAME</label>
        <input name="name" id="name">
        <div id="checkNameResult" style="font-size:0.8em; display:none;"></div>
      </li>
      <li>
        <label for="birth">birth</label>
        <input name="birth">
      </li>
      <li>
        <label for="phone">phone</label>
        <input name="phone">
      </li>
      <li>
        <label for="email">email</label>
        <input type="email" name="email">
      </li>
      <li>
        <input type="submit" value="회원가입">
        <input type="reset" value="초기화">
      </li>
    </ul>
</form>

<script>
    $(()=>{
        const $idInput = $("#memid");
        const $nameInput = $("#name");
        const nameValidate = /^[가-힣]{2,}$/;
        const idValidate = /^[a-z][a-z\d]{3,11}$/;

        $idInput.keyup(function(){
            if(idValidate.test($idInput.val())){
                if($idInput.val().length >= 5){
                    $.ajax({
                        url: "idCheck",
                        data : {id: $idInput.val()},
                        success:function(result){
                            if(result){
                                $("#checkIdResult").show().css("color","red").text("중복된 아이디가 존재합니다");
                                $("#joinForm :submit").attr("disabled",true);
                            }else{
                                $("#checkIdResult").show().css("color","green").text("사용가능한 아이디 입니다");
                                $("#joinForm :submit").attr("disabled", false);
                            }
                        },
                        error:function(){
                            console.log("아이디 중복체크용 ajax 실패");
                        }
                    })
                }else{
                    $("#checkIdResult").show();
                    $("#checkIdResult").css("color","gray").text("아이디를 5자 이상 입력해주세요");
                    $("#joinForm :submit").attr("disabled",true);
                }
            }else{
                $("#checkIdResult").show().css("color","red").text("올바른 아이디 형식이 아닙니다");
                $("#joinForm :submit").attr("disabled",true);
            }
        })

        $nameInput.keyup(function(){
            if($nameInput.val().length >= 2){
                if(nameValidate.test($nameInput.val())){
                    $("#checkNameResult").hide().css("color", "");
                    $("#joinForm :submit").attr("disabled", false);
                }else{
                    $("#checkNameResult").show().css("color","red").text("올바른 이름 형식이 아닙니다");
                    $("#joinForm :submit").attr("disabled",true);
                }
            }
        })
    })
</script>

<%@include file="../include/footer.jsp" %>