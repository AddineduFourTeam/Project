<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<div class="join-wrap">
  <div class="join-form">
    <form action="memInsert" method="post" id="joinForm" modelAttribute="member" enctype="multipart/form-data">
      <ul style="list-style-type: none">
        <li>
          <h3>회원가입</h3>
        </li>
        <li class="join-input-box">
          <p>아이디</p>
          <input name="memid" id="memid" placeholder="영어 소문자+숫자 조합" required >
          <div id="checkIdResult" style="font-size:0.8em; display:none;"></div>
        </li>
        <li class="join-input-box">
          <p>비밀번호</p>
          <input type="password" name="pass" id="pass" placeholder="비밀번호를 입력해주세요" required>
        </li>
        <li class="join-input-box">
          <p>비밀번호 확인</p>
          <input type="password" name="repass" id="repass" placeholder="비밀번호를 한 번 더 입력해주세요" required>
          <div id="checkRePassResult" style="font-size:0.8em; display:none;"></div>
        </li>
        <li class="join-input-box">
          <p>이름</p>
          <input name="name" id="name" required>
          <div id="checkNameResult" style="font-size:0.8em; display:none;"></div>
        </li>
        <li class="join-input-box">
          <p>생년월일</p>
          <input name="birth" id="birth" placeholder="예시) 240131">
        </li>
        <li class="join-input-box">
          <p>전화번호</p>
          <input name="phone" id="phone" placeholder="'-'없이 번호만 입력해주세요" required>
        </li>
        <li class="join-input-box">
          <p>이메일</p>
          <input type="email" name="email" id="email" placeholder="예시) abc@gmail.com">
        </li>
        <li>
          <p>프로필이미지</p>
          <input type="file" name="file" id="file" class="btn-file">
          <span class="modi_img" >
            <img src="" alt="" id="View">
          </span>
        </li>
        <li>
          <input class="btn-join" type="submit" value="회원가입">
        </li>
      </ul>
    </form>
  </div>
</div>
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

      const $passInput = $("#pass");
      const $repassInput = $("#repass");
      $repassInput.keyup(function() {
        if ($passInput.val() !== $repassInput.val()) {
          $("#checkRePassResult").show().css("color", "red").text("비밀번호가 일치하지 않습니다.");
          $("#joinForm :submit").attr("disabled", true);
        } else {
          $("#checkRePassResult").show().css("color", "green").text("비밀번호가 일치합니다.");
          $("#joinForm :submit").attr("disabled", false);
        }
      });
    })


    $(function() {
      $("#file").on('change', function(){
        readURL(this);
      });
    });
    function readURL(input) {
      if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
          $('#View').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
      }
    }
</script>

<%@include file="../include/footer.jsp" %>