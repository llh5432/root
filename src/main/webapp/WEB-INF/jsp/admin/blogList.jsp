<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<!-- <title>Insert title here</title> -->
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
</script>
<jsp:include page="main.jsp"></jsp:include>
<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4"> <br>
<h2>Blog / 게시글 수 : ${count} 건</h2>
<div id="page-wrapper">

	<div class="container-fluid">

		<div class="row">
			<div class="col-lg-12">
				<div class="table-responsive">
					<form action="boardDelete" method="post">

						<table class="table table-bordered table-hover">
							<tr>
								<th><input type="checkbox" id="th_checkAll"
									name="check-all" onclick="checkAll();"> 체 크</th>
								<th>번 호</th>
								<th>아이디</th>
								<th>이 름</th>
								<th>제 목</th>
								<th>모 델</th>
								<th>이미지</th>
								<th>추천수</th>
								<th>조회수</th>
								<th>작성날짜</th>
							</tr>
							<c:forEach items="${bList}" var="list">
								<tr>
									<td><input type="checkbox" name="check" id="chk"
										value="${list.b_num}"></td>
									<td>${list.b_num}</td>
									<td>${list.b_id}</td>
									<td>${list.b_name}</td>
									<td><a
										href="boardDetail?num=${list.b_num}&pageNum=${pageVO.pageNum}">${list.b_title}</a></td>
									<td>${list.b_model}</td>
									<td><c:choose>
											<c:when test="${list.b_image eq null}">
												없음
											</c:when>
											<c:otherwise>
												<strong>있음</strong>
											</c:otherwise>
										</c:choose></td>
									<td>${list.b_likeCount}</td>
									<td>${list.b_readCount}</td>
									<td><fmt:parseDate var="parsed" value="${list.b_reg_date}"
											pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
											value="${parsed}" pattern="yyyy-MM-dd HH:mm" /></td>
								</tr>
							</c:forEach>
						</table>
						<input type="submit" value="삭제" class="btn btn-danger">
					</form>


					<c:if test="${pageVO.count gt 0}">
						<div id="PageBlock" class="center-text">
							<ul class="pagination">

								<c:if test="${pageVO.startPage gt pageVO.pageBlock}">
									<li class="page-item"><a class="page-link"
										href="blog?pageNum=${pageVO.startPage - pageVO.pageBlock}"><i
											class="fas fa-chevron-left"></i></a></li>
								</c:if>
								<%-- 1~10 페이지블록 범위 출력 --%>
								<c:forEach var="i" begin="${pageVO.startPage}"
									end="${pageVO.endPage}" step="1">
									<c:choose>
										<c:when test="${i eq pageVO.pageNum}">
											<li class="page-item"><a class="page-link"
												href="blog?pageNum=${i}"><b>${i}</b></a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
												href="blog?pageNum=${i}">${i}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<%-- [다음] --%>
								<c:if test="${pageVO.endPage lt pageVO.pageCount}">
									<li class="page-item"><a class="page-link"
										href="blog?pageNum=${pageVO.startPage + pageVO.pageBlock}"><i
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