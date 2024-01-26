<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<form action="memInsert" method="post">
    <ul style="list-style-type: none">
      <li>
        <label for="id">ID</label>
        <input name="id" required>
      </li>
      <li>
        <label for="pass">PWD</label>
        <input type="password" name="pass" required>
      </li>
      <li>
        <label for="name">NAME</label>
        <input name="name">
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

<%@include file="../include/footer.jsp" %>