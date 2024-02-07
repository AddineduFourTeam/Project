<%--
  Created by IntelliJ IDEA.
  User: dmswi
  Date: 2024-02-07
  Time: 오전 12:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<div class="con wrap reservation_wrap">
    <form>
        <select name>
            <option>1년</option>
        </select>
        <div class="years">
            <label for="year2024">2024</label>
            <input type="checkbox" name="year" id="year2024">
        </div>
        <div class="years">
            <label for="year2025">2025</label>
            <input type="checkbox" name="year" id="year2025">
        </div>
        <div class="years">
            <label for="year2026">2026</label>
            <input type="checkbox" name="year" id="year2026">
        </div>
        <div class="years">
            <label for="year2027">2027</label>
            <input type="checkbox" name="year" id="year2027">
        </div>
        <div class="years">
            <label for="year2028">2028</label>
            <input type="checkbox" name="year" id="year2028">
        </div>
        <div class="years">
            <label for="year2029">2029</label>
            <input type="checkbox" name="year" id="year2029">
        </div>
        <div class="years">
            <label for="year2030">2030</label>
            <input type="checkbox" name="year" id="year2030">
        </div>

    </form>
</div>
<%@include file="../include/footer.jsp" %>
