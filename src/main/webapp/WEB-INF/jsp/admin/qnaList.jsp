<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<meta charset="UTF-8">
<jsp:include page="main.jsp"></jsp:include>
<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4"> <br>
<h2>QnA 총 문의글 수 : ${count} 건</h2>
<div id="page-wrapper">

	<div class="container-fluid">

		<!-- Page Heading -->

		<!-- /.row -->
		<div class="row">
			<div class="col-lg-12">
				<div class="table-responsive">
					<form action="qnaDelete" method="post">

						<table class="table table-bordered table-hover">
							<tr>
								<th>체크</th>
								<th>번호</th>
								<th>문의유형</th>
								<th>제목</th>
								<th>아이디</th>
								<th>문의일시</th>
								<th>답변여부</th>
							</tr>
							<c:forEach items="${list}" var="qna">
								<tr>
									<td><input type="checkbox" name="check" id="chk"
										value="${qna.q_num}"></td>
									<td>${qna.q_num}</td>
									<td>${qna.q_type}</td>
									<td><a href="qnaDetail?num=${qna.q_num}">${qna.q_title}</a>
										<c:if test="${qna.reply eq 'F'}">
											<span class="label label-danger">New</span>
										</c:if></td>
									<td>${qna.q_id}</td>
									<td><fmt:parseDate var="parsed" value="${qna.reg_date}"
											pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
											value="${parsed}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td><c:choose>
											<c:when test="${qna.reply eq 'T'}">
												<c:out value="답변완료"></c:out>
											</c:when>
											<c:otherwise>
												<c:out value="답변미완료"></c:out>
											</c:otherwise>
										</c:choose></td>
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
										href="qna?pageNum=${pageVO.startPage - pageVO.pageBlock}"><i
											class="fas fa-chevron-left"></i></a></li>
								</c:if>
								<%-- 1~10 페이지블록 범위 출력 --%>
								<c:forEach var="i" begin="${pageVO.startPage}"
									end="${pageVO.endPage}" step="1">
									<c:choose>
										<c:when test="${i eq pageVO.pageNum}">
											<li class="page-item"><a class="page-link"
												href="qna?pageNum=${i}"><b>${i}</b></a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
												href="qna?pageNum=${i}">${i}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<%-- [다음] --%>
								<c:if test="${pageVO.endPage lt pageVO.pageCount}">
									<li class="page-item"><a class="page-link"
										href="qna?pageNum=${pageVO.startPage + pageVO.pageBlock}"><i
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