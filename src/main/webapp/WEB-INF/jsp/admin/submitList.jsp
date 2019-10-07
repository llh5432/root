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
	function mySubmit(index) {
		if (index == 1) {
			document.myForm.action = 'submitListUpgrade';
		}

		if (index == 2) {
			document.myForm.action = 'submitListDelete';
		}

		document.myForm.submit();
	}
</script>
<jsp:include page="main.jsp"></jsp:include>
<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4"> <br>
<h2>Submit 총 지원자 수 : ${count} 건</h2>
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
								<th>체 크</th>
								<th>번 호</th>
								<th>아이디</th>
								<th>이 름</th>
								<th>자기소개</th>
								<th>약관동의</th>
								<th>등업일시</th>
								<th>신청일시</th>
							</tr>
							<c:forEach items="${sList}" var="list">
								<tr>
									<td><input type="checkbox" name="check" id="chk"
										value="${list.s_num}"> <input type="hidden"
										name="s_id" value="${list.s_id}"></td>
									<td>${list.s_num}</td>
									<td>${list.s_id}</td>
									<td>${list.s_name}</td>
									<td><a href="submitDetail?num=${list.s_num}">자세히보기</a></td>
									<td>
										<c:choose>
											<c:when test="${list.s_type eq 'T'}">
												약관동의완료
											</c:when>
											<c:otherwise>
												약관동의미완료
											</c:otherwise>
										</c:choose>
									</td>
									<td>
										<c:choose>
											<c:when test="${list.s_upgrade eq 'F'}">
												<strong>등업보류</strong>
											</c:when>
											<c:otherwise>
												<fmt:parseDate var="upgrade" value="${list.s_upgrade}"
													pattern="yyyy-MM-dd HH:mm:ss" />
												<fmt:formatDate value="${upgrade}" pattern="yyyy-MM-dd" />
											</c:otherwise>
										</c:choose>
									</td>
									<td><fmt:parseDate var="regDate"
											value="${list.s_reg_date}" pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
											value="${regDate}" pattern="yyyy-MM-dd" /></td>

								</tr>
							</c:forEach>
						</table>
						<input type="button" value="등업" class="btn btn-primary" onclick="mySubmit(1)">
						<input type="button" value="삭제" class="btn btn-danger" onclick="mySubmit(2)">
					</form>


					<c:if test="${pageVO.count gt 0}">
						<div id="PageBlock" class="center-text">
							<ul class="pagination">

								<c:if test="${pageVO.startPage gt pageVO.pageBlock}">
									<li class="page-item"><a class="page-link"
										href="submit?pageNum=${pageVO.startPage - pageVO.pageBlock}"><i
											class="fas fa-chevron-left"></i></a></li>
								</c:if>
								<%-- 1~10 페이지블록 범위 출력 --%>
								<c:forEach var="i" begin="${pageVO.startPage}"
									end="${pageVO.endPage}" step="1">
									<c:choose>
										<c:when test="${i eq pageVO.pageNum}">
											<li class="page-item"><a class="page-link"
												href="submit?pageNum=${i}"><b>${i}</b></a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
												href="submit?pageNum=${i}">${i}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<%-- [다음] --%>
								<c:if test="${pageVO.endPage lt pageVO.pageCount}">
									<li class="page-item"><a class="page-link"
										href="submit?pageNum=${pageVO.startPage + pageVO.pageBlock}"><i
											class="fas fa-chevron-right"></i></a></li>
								</c:if>
							</ul>
						</div>
					</c:if>
					<!-- /.row -->

				</div>
				<!-- /.container-fluid -->
			</div>
		</div>
		<!-- /#page-wrapper -->

	</div>
</div>
</main>

<jsp:include page="footer.jsp"></jsp:include>
<!-- /#wrapper -->