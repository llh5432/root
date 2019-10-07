<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<script type="text/javascript">
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
<h2>Customer 총 회원 수 : ${count} 건</h2>
<div id="page-wrapper">

	<div class="container-fluid">

		<div class="row">
			<div class="col-lg-12">
				<div class="table-responsive">
					<form action="memberDelete" method="post">

						<table class="table table-bordered table-hover">
							<tr>
								<th><input type="checkbox" id="th_checkAll"
									name="check-all" onclick="checkAll();">체 크</th>
								<th>번 호</th>
								<th>유 형</th>
								<th>아이디</th>
								<th>이 름</th>
								<th>국 적</th>
								<th>성 별</th>
								<th>나 이</th>
								<th>E-Mail</th>
								<th>전화번호</th>
								<th>가입일시</th>
							</tr>
							<c:forEach items="${list}" var="List">
								<tr>
									<td><input type="checkbox" name="check" id="chk"
										value="${List.num}"> <input type="hidden" name="id"
										value="${List.id}"></td>
									<td>${List.num}</td>
									<td><c:choose>
											<c:when test="${List.model ne null}">
												직원
											</c:when>
											<c:otherwise>
												고객
											</c:otherwise>
										</c:choose></td>
									<td>${List.id}</td>
									<td>${List.name}</td>
									<td>${List.country}</td>
									<td>${List.gender}</td>
									<td>${List.age}</td>
									<td>${List.email}</td>
									<td>${List.phone}</td>
									<td><fmt:parseDate var="regDate" value="${List.join_date}"
											pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
											value="${regDate}" pattern="yyyy-MM-dd" /></td>
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
										href="customers?pageNum=${pageVO.startPage - pageVO.pageBlock}"><i
											class="fas fa-chevron-left"></i></a></li>
								</c:if>
								<%-- 1~10 페이지블록 범위 출력 --%>
								<c:forEach var="i" begin="${pageVO.startPage}"
									end="${pageVO.endPage}" step="1">
									<c:choose>
										<c:when test="${i eq pageVO.pageNum}">
											<li class="page-item"><a class="page-link"
												href="customers?pageNum=${i}"><b>${i}</b></a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
												href="customers?pageNum=${i}">${i}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<%-- [다음] --%>
								<c:if test="${pageVO.endPage lt pageVO.pageCount}">
									<li class="page-item"><a class="page-link"
										href="customers?pageNum=${pageVO.startPage + pageVO.pageBlock}"><i
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