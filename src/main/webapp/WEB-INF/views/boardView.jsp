<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-01-17
  Time: 오후 5:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<div class="wrap con">
    <div class="boarder_top">
        <h2>고객센터</h2>
        <div class="search">
            <form action="">
                <input type="text" name="keyword" id="keyword" value="">
                <button type="submit">검색</button>
            </form>
        </div>
    </div>
    <div class="board_con board_view">
        <div class="board_tb">
            <div class="board_view_tt">title</div>
            <div class="board_view_con">content</div>
        </div>
    </div>
    <div class="board_btn">
        <a href="board.html">목록</a>
    </div>
</div>
<%@include file="../include/footer.jsp" %>