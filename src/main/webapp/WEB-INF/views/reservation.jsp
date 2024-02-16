<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%--<%@include file="../include/header.jsp" %>--%>
<!-- 현재날짜 -->
<c:set var="today" value="<%=new java.util.Date()%>"/>
<!-- 현재년도 -->
<c:set var="year"><fmt:formatDate value="${today}" pattern="yyyy"/></c:set>
<%--<c:if test="${empty loginUser}">
    <script>
        alert("로그인 후 작성 가능합 니다.");
        location.href="/login";
    </script>
</c:if>--%>

<div class="con wrap reservation_wrap">
    <div class="reservation">
        <div>
            <h3>이용 기간</h3>
            <div class="date_wrap">
                <c:forEach begin="${year}" end="${year+5}" var="year">
                    <div class="date">
                        <label for="year${year}">
                            <input type="checkbox" name="year" id="year${year}">
                            <span class="txt">${year}</span>
                        </label>
                    </div>
                </c:forEach>
            </div>
        </div>

        <div>
            <h3>평 수</h3>
            <div class="field_wrap">
                <c:forEach begin="1" end="9" varStatus="index">
                    <div class="field">
                        <input type="checkbox" value="feet" name="feet" id="feet${index.count}">
                        <label for="feet${index.count}">
                            <img src="../img/field.png">
                        </label>
                    </div>
                </c:forEach>
            </div>
            <div class="feet_wrap">
                <p class="feet"><span></span>평<b>(밭 하나당 3평)</b></p>
            </div>
        </div>

        <div>
            <h3>추가 옵션</h3>
            <div class="option">
                <div class="checkbox_wrap">
                    <label for="op1">
                        <input class="checkbox-input" type="checkbox" name="option" value="seeding" id="op1">
                        <span class="tit">
                            <i class="fa-solid fa-seedling"></i>
                            <span class="txt">모종제공</span>
                        </span>
                    </label>
                </div>
                <div class="checkbox_wrap">
                    <label for="op2">
                        <input class="checkbox-input" type="checkbox" name="option" value="plow" id="op2">
                        <span class="tit">
                            <i class="fa-solid fa-tractor"></i>
                            <span class="txt">밭갈기</span>
                        </span>
                    </label>
                </div>
                <div class="checkbox_wrap">
                    <label for="op3">
                        <input class="checkbox-input" type="checkbox" name="option" value="watering" id="op3">
                        <span class="tit">
                            <i class="fa-solid fa-droplet"></i>
                            <span class="txt">물주기</span>
                        </span>
                    </label>
                </div>
                <div class="checkbox_wrap">
                    <label for="op4">
                        <input class="checkbox-input" type="checkbox" name="option" value="compost" id="op4">
                        <span class="tit">
                            <i class="fa-solid fa-sack-xmark"></i>
                            <span class="txt">퇴비뿌리기</span>
                        </span>
                    </label>
                </div>
            </div>
        </div>

        <div>
            <h3>예약정보</h3>
            <div class="info_wrap">
                <ul>
                    <li>
                        <h4>농장이름</h4>
                        <p>${listDetail.wfSubject}</p>
                    </li>
                    <li>
                        <h4>분양 기간</h4>
                        <p class="rs_year"></p>
                    </li>
                    <li>
                        <h4>분양할 평수</h4>
                        <p class="rs_feet"></p>
                    </li>
                    <li>
                        <h4>추가 옵션</h4>
                        <p class="rs_option"></p>
                    </li>
                    <li>
                        <h4>금액</h4>
                        <p class="rs_total_price"></p>
                    </li>
                </ul>
            </div>
        </div>
        <button type="button" class="booking_btn">등록</button>
    </div>
</div>
<script>
    <%--$(document).ready(function () {--%>
    <%--    let price = "${farm.wfPrice}";--%>
    <%--    let option_price = "${farm.wfOptionPrice}";--%>
    <%--    //console.log(option_price);--%>
    <%--    let isChecked = $("input[name='feet']");--%>
    <%--    let src;--%>
    <%--    isChecked.change(function () {--%>
    <%--        if ($(this).is(':checked')) {--%>
    <%--            src = "../img/field_on.png";--%>
    <%--        } else {--%>
    <%--            src = "../img/field.png";--%>
    <%--        }--%>
    <%--        $(this).siblings("label").find("img").attr('src', src);--%>
    <%--    });--%>

    <%--    let year_leng = 0;--%>
    <%--    let option_leng = 0;--%>

    <%--    $("input[type='checkbox']").change(function () {--%>
    <%--        let name = $(this).attr("name");--%>

    <%--        let count = $("input[name='feet']:checked").length * 3;--%>
    <%--        if (name === "option") {--%>
    <%--            let content = $("input[name='option']:checked");--%>
    <%--            option_leng = $("input[name='option']:checked").length;--%>
    <%--            let value = content.siblings().children('.txt').text();--%>
    <%--            $(".rs_option").text(value);--%>
    <%--        } else {--%>
    <%--            year_leng = $("input[name='year']:checked").length;--%>
    <%--            $(".rs_year").text(year_leng);--%>
    <%--            $(".rs_feet").text(count);--%>
    <%--            $('.feet > span').html(count);--%>
    <%--        }--%>
    <%--        console.log((year_leng * count / 3 * price) + "/" + (option_leng * option_price));--%>
    <%--        $(".rs_total_price").text(parseInt((year_leng * count / 3 * price) + (option_leng * option_price)));--%>
    <%--    });--%>

    <%--});--%>

    <%--$("#rv_btn").click(function(e){--%>
    <%--    //e.preventDefault();--%>
    <%--    function getOptionValue(selector) {--%>
    <%--        return $(selector).is(":checked") ? "Y" : "N";--%>
    <%--    }--%>
    <%--    let rvOptions = [];--%>
    <%--    for (let i = 1; i <= 4; i++) {--%>
    <%--        rvOptions.push(getOptionValue(`#op${i}`));--%>
    <%--    }--%>
    <%--    //console.log(validate());--%>
    <%--    if(validate()) {--%>
    <%--        $.ajax({--%>
    <%--            type: 'POST',--%>
    <%--            url: "/reservationSave",--%>
    <%--            data: {--%>
    <%--                "rvMemIdx" : ${loginUser.memIdx},--%>
    <%--                "rvFarmIdx" : ${param.id},--%>
    <%--                "rvUseDate" : $(".rs_year").text(),--%>
    <%--                "status" : "Y",--%>
    <%--                "rvPrice" :  $(".rs_total_price").text(),--%>
    <%--                "rvFeet" : $(".rs_feet").text(),--%>
    <%--                "rvOptionSeeding": rvOptions[0],--%>
    <%--                "rvOptionPlow": rvOptions[1],--%>
    <%--                "rvOptionWatering": rvOptions[2],--%>
    <%--                "rvOptionCompost": rvOptions[3]--%>
    <%--            },--%>
    <%--            success: function (){--%>
    <%--                console.log("성공");--%>
    <%--                window.location.href = "/list";--%>
    <%--            },--%>
    <%--            error: function(){--%>
    <%--                console.log("실패");--%>
    <%--            }--%>
    <%--        })--%>
    <%--    }--%>

    <%--});--%>

    <%--function validate(){--%>
    <%--    let year = $(".rs_year").text();--%>
    <%--    let feet = $(".rs_feet").text();--%>

    <%--    if(year < 1){--%>
    <%--        alert("기한을 선택해주세요");--%>
    <%--        $("input[name='year']").focus();--%>
    <%--        return false;--%>
    <%--    }else if(feet < 1){--%>
    <%--        alert("평 수를 선택해주세요");--%>
    <%--        $("input[name='feet']").focus();--%>
    <%--        return false;--%>
    <%--    }else{--%>
    <%--        return true;--%>
    <%--    }--%>
    <%--}--%>


    // 날짜 생성
    <%--function createDateList() {--%>
    <%--    const today = new Date();--%>
    <%--    today.setHours(0, 0, 0, 0);--%>
    <%--    const dates = [];--%>
    <%--    const weekDays = ["일", "월", "화", "수", "목", "금", "토"];--%>

    <%--    for (let i = 0; i < 30; i++) {--%>
    <%--        const futureDate = new Date(today);--%>
    <%--        futureDate.setDate(futureDate.getDate() + i);--%>
    <%--        const dayOfWeek = weekDays[futureDate.getDay()];--%>
    <%--        const formattedDate = `${"${futureDate.getMonth() + 1}"}월 ${"${futureDate.getDate()}일"}`;--%>

    <%--        // 오늘 날짜와 비교--%>
    <%--        let label = "(" + dayOfWeek + ")";--%>
    <%--        if (futureDate.getTime() === today.getTime()) {--%>
    <%--            label = "(오늘)";--%>
    <%--        }--%>

    <%--        dates.push({date: formattedDate, day: label});--%>
    <%--    }--%>
    <%--    return dates;--%>
    <%--}--%>
</script>