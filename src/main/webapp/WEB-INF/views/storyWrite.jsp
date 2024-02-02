<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<c:if test="${empty loginUser}">
    <script>
        alert("로그인 후 작성 가능합 니다.");
        location.href="/login";
    </script>
</c:if>
<div class="wrap con">
    <%@include file="../include/board_search.jsp" %>
    <div class="story_con">
        <form action="storyForm" method="post" enctype="multipart/form-data">
            <div class="storyW_tt"><label for="title" class="story_listtt">스토리 제목</label><input type="text" id="title" name="storySubject" value="" required></div>
            <div class="story_txt"><label for="content" class="story_listtt">스토리 내용</label><textarea id="content" name="storyContent" required></textarea></div>
            <div class="story_farm">
                <input type="hidden" id="farm_select" name="farm_select">
                <div class="story_listtt">농장 선택</div>
                <ul class="farm_select">
                    <c:forEach items="${localArray}" var="localArray" varStatus="idx">
                       <li>
                           <input type="radio" class="" id="farm_local${idx.index}" name="farm_local" value="">
                           <label for="farm_local${idx.index}">${localArray}</label>
                       </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="farm_list">
                <ul>
                    <li>
                        <input type="radio" id="storyWfIdx01" name="storyWfIdx" value="" class="">
                        <label for="storyWfIdx01">
                            <div class="farm_list_img">
                                <img src="http://www.nongsaro.go.kr/cms_contents/1096/229882_MF_BIMG_01.jpg" alt="" onerror="this.src=''">
                            </div>
                            <span class="farm_list_tt">농장데스네</span>
                        </label>
                    </li>
                </ul>
            </div>
            <div class="farm_img">
                <div class="story_listtt">
                    스토리 이미지
                </div>
                <ul>
                    <li>
                        <input id="fileInput" type="file" multiple name="file1" onchange='readFile(this)' hidden/>
                        <label for="fileInput">이미지 선택<span>(썸네일 이미지)</span><small>10mb 이하</small></label>
                    </li>
                    <li>
                        <input id="fileInput2" type="file" multiple name="file2" onchange='readFile(this)' hidden/>
                        <label for="fileInput2">이미지 선택<small>10mb 이하</small></label>
                    </li>
                    <li>
                        <input id="fileInput3" type="file" multiple name="file3" onchange='readFile(this)' hidden/>
                        <label for="fileInput3">이미지 선택<small>10mb 이하</small></label>
                    </li>
                </ul>
            </div>
            <div class="story_submit">
                <button>등록</button>
                <span class="btnimg"><img src="/img/sprout.png" alt="새싹"></span>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">
    function readFile(input) {
        readURL(input);

        const file = input.files[0]; // 첨부된 파일을 가져옴

        const reader = new FileReader();

        reader.readAsDataURL(file); // 파일을 base64로 변환

        reader.onload = function() {
            console.log(reader.result); // 읽은 파일 소스단에 출력
            //document.querySelector('img').src = reader.result;
        };

        reader.onerror = function() {
            console.log(reader.error);
        };

    }

    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                //console.log(input);
                $(input).next("label").html(`<img src='${"${e.target.result}"}'>`);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

</script>
<%@include file="../include/footer.jsp" %>