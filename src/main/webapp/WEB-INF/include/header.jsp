<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-01-17
  Time: 오후 5:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- 현재 페이지명 가져오기 -->
<c:set var="URI" value="${pageContext.request.requestURI}" />
<c:set var="basePath" value="/WEB-INF/views/" />
<c:set var="folderPath" value="${fn:substringAfter(URI, basePath)}" />
<c:set var="folderName" value="${fn:substringBefore(folderPath, '.jsp')}" />
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no,maximum-scale=1.0,minimum-scale=1.0,target-densitydpi=medium-dpi">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link rel="shortcut icon" type="image/x-icon" href="https://t1.daumcdn.net/cfile/tistory/271CD54255E7AEE707">
    <link href="https://t1.daumcdn.net/cfile/tistory/271CD54255E7AEE707" rel="icon">
    <link rel="canonical" href="">
    <meta name="author" itemprop="author" content="주말농장">

    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <script src="https://kit.fontawesome.com/256c666685.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/style.css">
    <title>메인</title>
</head>
<body>

<header>
    <ul class="tnb wrap">
        <li><a href="/login">login</a></li>
        <li><a href="/join">join</a></li>
    </ul>
    <nav>
        <div class="wrap">
            <h1><a href="/"><img src="/img/logo_w.png" alt="weekend farm"></a></h1>
            <ul class="gnb">
                <li><a href="/list">list</a></li>
                <li><a href="/board">board</a></li>
                <li><a href="/story">story</a></li>
            </ul>
        </div>
    </nav>
</header>

<script>
    $(document).ready(function(){
        $(window).scroll(function(){
            if($(this).scrollTop() > 100) {
                $("header").addClass("on");
                $("h1 img").attr("src","/img/logo.png");
            }else {
                $("header").removeClass("on");
                $("h1 img").attr("src","/img/logo_w.png");
            }
        });
    });
</script>

