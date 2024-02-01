<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<div class="wrap con">
    <%@include file="../include/board_search.jsp" %>
    <div class="story_con">
        <form action="storyForm" method="post" enctype="multipart/form-data">
            <div><label for="title"></label><input type="text" id="title" name="storySubject" value=""></div>
            <div><label for="content"></label><textarea id="content" name="storyContent"></textarea></div>
            <input id="fileInput" type="file" multiple name="file1" onchange='readFile(this)'/>
            <input id="fileInput2" type="file" multiple name="file2" onchange='readFile(this)'/>
            <input id="fileInput3" type="file" multiple name="file3" onchange='readFile(this)' />
            <button>등록</button>
        </form>
    </div>
</div>
<script type="text/javascript">
    function readFile(input) {
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

</script>
<%@include file="../include/footer.jsp" %>