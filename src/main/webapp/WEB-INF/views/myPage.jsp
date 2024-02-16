<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp" %>
<c:if test="${empty loginUser}">
    <script>
        alert("로그인 후 작성 가능합 니다.");
        location.href="/login";
    </script>
</c:if>
<div class="con wrap">
    <%@include file="../include/mypg_menu.jsp" %>
            <div class="my-wrap">
                <ul class="my-info-wrap">
                    <li class="file-top my-img">
                        <p>프로필이미지</p>
                        <span>
                            <img src="${loginUser.memImg}" onerror="this.src='img/profileImg_w.png'">
                        </span>
                    </li>
                    <li class="my-info">
                        <p>이름</p>
                        <input name="name" id="name"  value="${loginUser.name}" readonly>
                        <p>생년월일</p>
                        <input name="birth" id="birth"  value="${loginUser.birth}" readonly>
                        <p>이메일</p>
                        <input type="text" name="email" id="email" class="form-control" value="${loginUser.email}" readonly>
                    </li>
                </ul>
                <div class="my-resv-wrap">
                    <h4>최근 예약내역</h4>
                    <table>
                        <thead>
                        <tr>
                            <th>예약상태</th>
                            <th>No</th>
                            <th>예약한 농장</th>
                            <th>예약기간</th>
                            <th>예약날짜</th>
                            <th>예약상세</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:choose>
                            <c:when test="${reservations ne null}">
                                <c:forEach var="resv" items="${reservations}" varStatus="i">

                                    <fmt:parseDate value="${resv.rvDate}" pattern="yy. M. d. a h:mm" var="parsedDateTime" type="both" />
                                    <tr>
                                        <td>${resv.status}</td>
                                        <td>${i.count}</td>
                                        <td><a href="listDetail?id=${resv.rvFarmIdx}">(${resv.rvFarmIdx})${wfSubject.get(i.index)}</a></td>
                                        <td>${resv.rvUseDate}년</td>
                                        <td><fmt:formatDate pattern="yyyy.MM.dd" value="${parsedDateTime}" /></td>
                                        <td><a href="mypagereservation?id=${resv.rvIdx}" class="ellipsis">상세보기</a></td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="3">자료가 없습니다.</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                        </tbody>
                    </table>
                </div>
                <div class="my-review-wrap">
                    최근 리뷰
                    <table>
                        <thead>
                        <tr>
                            <th>No</th>
                            <th>제목</th>
                            <th>리뷰작성일자</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:choose>
                            <c:when test="${reviews ne null}">
                                <c:forEach var="review" items="${reviews}" varStatus="i">
                                    <fmt:parseDate value="${review.reviewDate}" pattern="yy. M. d. a h:mm" var="parsedDateTime" type="both" />
                                    <tr>
                                        <td>${i.count}</td>
                                        <td><a href="reviewDetail?id=${review.reviewIdx}" class="ellipsis">${review.reviewSubject}</a></td>
                                        <td><fmt:formatDate pattern="yyyy.MM.dd" value="${parsedDateTime}" /></td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="3">자료가 없습니다.</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                        </tbody>
                    </table>
                </div>
                <div class="my-story-wrap">
                    <h3>스토리</h3>
                    <div class="story_wrap">
                        <c:choose>
                            <c:when test="${stories ne null}">
                            <c:forEach var="story" items="${stories}" varStatus="i">
                                <fmt:parseDate value="${story.storyDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
                                <div class="story_items">
                                    <a href="/storyDetail?id=${story.storyIdx}">
                                        <div class="story_img">
                                            <img src="/image/${story.storyIdx}/1" alt="Image" onerror="this.src='img/logoimg.png'">
                                        </div>

                                        <div class="my-story_subject">
                                            ${story.storySubject}
                                        </div>
                                    </a>

                                </div>

                            </c:forEach>
                            </c:when>
                            <c:otherwise>
                                    <div class="empty">자료가 없습니다.</div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>

        </div>

    </div>
</div>

<%@include file="../include/footer.jsp" %>