<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<!-- <meta charset="UTF-8"> -->

<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!-- <meta name="description" content=""> -->
<!-- <meta name="author" content=""> -->

<script>

function checkAll() {
	if ($("#th_checkAll").is(':checked')) {
		$("input[name=check]").prop("checked", true);
	} else {
		$("input[name=check]").prop("checked", false);
	}
}

	function mySubmit(index) {
		if (index == 1) {
			document.myForm.action = 'bookMeetCheck';
		}

		if (index == 2) {
			document.myForm.action = 'bookListDelete';
		}

		document.myForm.submit();
	}
</script>
<jsp:include page="main.jsp"></jsp:include>
<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4"> <br>
<h2>Book List 총 예약 수 : ${count} 건</h2>
<div id="page-wrapper">

	<div class="container-fluid">

		<!-- Page Heading -->

		<!-- /.row -->
		<div class="row">
			<div class="col-lg-12">
				<div class="table-responsive">
					<form name="myForm" method="post">

						<table class="table table-bordered table-hover">
							<tr>
								<th><input type="checkbox" id="th_checkAll"
									name="check-all" onclick="checkAll();">체 크</th>
								<th>번 호</th>
								<th>신 청 인</th>
								<th>모 델</th>
								<th>예약날짜</th>
								<th>요청사항</th>
								<th>결 제</th>
								<th>요 금</th>
								<th>진행상황</th>
							</tr>
							<c:forEach items="${list}" var="bList">
								<tr>
									<td><input type="checkbox" name="check" id="chk"
										value="${bList.book_num}"></td>
									<td>${bList.book_num}</td>
									<td>${bList.id}</td>
									<td>${bList.model}</td>
									<td>${bList.book_date}</td>
									<td><a href="bookDetail?num=${bList.book_num}">자세히보기</a></td>
									<td><c:choose>
											<c:when test="${bList.type eq 'F'}">
												결제미완료
											</c:when>
											<c:otherwise>
												<strong>결제완료</strong>
											</c:otherwise>
										</c:choose></td>
									<td>${bList.pay}</td>
									<td><c:choose>
										<c:when test="${bList.meet eq 'F'}">
											진행중
										</c:when>
										<c:otherwise>
											진행완료
										</c:otherwise>
									</c:choose></td>
								</tr>
							</c:forEach>
						</table>
						<input type="button" value="진행완료" class="btn btn-primary"
							onclick="mySubmit(1)"> <input type="button" value="예약삭제"
							class="btn btn-danger" onclick="mySubmit(2)">
					</form>


					<c:if test="${pageVO.count gt 0}">
						<div id="PageBlock" class="center-text">
							<ul class="pagination">

								<c:if test="${pageVO.startPage gt pageVO.pageBlock}">
									<li class="page-item"><a class="page-link"
										href="bookList?pageNum=${pageVO.startPage - pageVO.pageBlock}"><i
											class="fas fa-chevron-left"></i></a></li>
								</c:if>
								<%-- 1~10 페이지블록 범위 출력 --%>
								<c:forEach var="i" begin="${pageVO.startPage}"
									end="${pageVO.endPage}" step="1">
									<c:choose>
										<c:when test="${i eq pageVO.pageNum}">
											<li class="page-item"><a class="page-link"
												href="bookList?pageNum=${i}"><b>${i}</b></a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
												href="bookList?pageNum=${i}">${i}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<%-- [다음] --%>
								<c:if test="${pageVO.endPage lt pageVO.pageCount}">
									<li class="page-item"><a class="page-link"
										href="bookList?pageNum=${pageVO.startPage + pageVO.pageBlock}"><i
											class="fas fa-chevron-right"></i></a></li>
								</c:if>
							</ul>
						</div>
					</c:if>


				</div>

			</div>
		</div>

	</div>
</div>
</main>
<jsp:include page="footer.jsp"></jsp:include>