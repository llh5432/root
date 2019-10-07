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
<h2>Oppa List 총 직원 수 : ${count} 건</h2>
<div id="page-wrapper">

	<div class="container-fluid">

		<!-- Page Heading -->

		<!-- /.row -->
		<div class="row">
			<div class="col-lg-12">
				<div class="table-responsive">
					<form action="oppaDelete" method="post">

						<table class="table table-bordered table-hover">
							<tr>
								<th><input type="checkbox" id="th_checkAll" name="check-all" onclick="checkAll();">체 크</th>
								<th>번 호</th>
								<th>평 판</th>
								<th>아이디</th>
								<th>이 름</th>
								<th>나 이</th>
								<th>거주지</th>
								<th>E-Mail</th>
								<th>전화번호</th>
								<th>총수익</th>
								<th>등업날짜</th>
								<th>가입날짜</th>
							</tr>
							<c:forEach items="${list}" var="list">
								<tr>
									<td><input type="checkbox" name="check" id="chk" value="${list.o_num}">
									<input type="hidden" name="check2" value="${list.num}"></td>
									<td>${list.o_num}</td>
									<td>${list.o_like}</td>
									<td>${list.o_id}</td>
									<td>${list.o_name}</td>
									<td>${list.age}</td>
									<td>${list.address}</td>
									<td>${list.email}</td>
									<td>${list.phone}</td>
									<td>${list.total}</td>
									<td><fmt:parseDate var="regDate"
											value="${list.o_reg_date}" pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
											value="${regDate}" pattern="yyyy-MM-dd" /></td>
									<td><fmt:parseDate var="joinDate"
											value="${list.o_join_date}" pattern="yyyy-MM-dd HH:mm:ss" />
										<fmt:formatDate value="${joinDate}" pattern="yyyy-MM-dd" /></td>
								</tr>
							</c:forEach>
						</table>
						<input type="submit" value="삭제" class="btn btn-danger">
					</form>

				</div>
				<!-- /.container-fluid -->
			</div>
		</div>
		<!-- /#page-wrapper -->

	</div>
</div>
</main>
<jsp:include page="footer.jsp"></jsp:include>