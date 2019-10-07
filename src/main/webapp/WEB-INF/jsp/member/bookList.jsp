<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<div class="container">

	<form action="bDelete" method="post" name="form">
		<div class="container">
			<table class="table table-bordered">


				<tr class="header">
					<th>선 택</th>
					<th>예약번호</th>
					<th>오빠이름</th>
					<th>요청사항</th>
					<th>예약날짜</th>
					<th>요금결제</th>
					<th>요 금</th>
					<th>작성날짜</th>
					<th>진행상황</th>
				</tr>
				<c:forEach var="bookVO" items="${myBook}">
					<tr class="header">
						<td><input type="checkbox" name="b_check" id="b_chk"
							value="${bookVO.book_num}"></td>

						<td>${bookVO.book_num}</td>
						<td>${bookVO.model}</td>
						<td>
							<p style="color: blue">자세히보기</p>
						</td>
						<td><fmt:parseDate var="bookDate" value="${bookVO.book_date}"
								pattern="yyyy-MM-dd" /> <fmt:formatDate value="${bookDate}"
								pattern="yyyy-MM-dd" /></td>
						<td><c:choose>
								<c:when test="${bookVO.type eq 'F'}">결제미완료</c:when>
								<c:otherwise>결제완료</c:otherwise>
							</c:choose></td>
						<td>${bookVO.pay}</td>
						<td><fmt:parseDate var="regDate" value="${bookVO.reg_date}"
								pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
								value="${regDate}" pattern="yyyy-MM-dd" /></td>
						<td>
							<c:choose>
								<c:when test="${bookVO.meet eq 'F'}">
									진행중
								</c:when>
								<c:otherwise>
									진행완료
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<td colspan="10"><b>나의 요청 내역</b><br>
						<textarea class="form-control" rows="5" readonly>${bookVO.content}</textarea>
						</td>

					</tr>
				</c:forEach>
			</table>
		</div>
		<input type="submit" class="btn btn-danger" value="예약내역삭제">
	</form>

</div>
