<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!-- <meta name="description" content=""> -->
<!-- <meta name="author" content=""> -->
<%@include file="main.jsp"%>
<style>
span {
	/*   font-size:150%;  */
	font-weight: bold;
	color: #777;
}

span em {
	font-style: normal;
}

span em.warning {
	color: #f00;
}
</style>
<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
<div id="page-wrapper">

	<div class="container-fluid">

		<!-- Page Heading -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">건의사항</h1>
				<ol class="breadcrumb">
					<li class="active"><i class="fa fa-table"></i> 1:1 문의사항</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->
		<div class="row">
			<div class="col-lg-12">
				<div class="table-responsive">
					<form action="reply">
						<table class="table table-bordered table-hover">
							<tr>
								<th>내용</th>
								<th>문의일시</th>
								<th>답변여부</th>
							</tr>
							<tr>
								<td>[작성자] ${qnaVO.q_id}<br> [제목] ${qnaVO.q_title}<br>
									[내용]<br> ${qnaVO.q_content}
								<td><fmt:parseDate var="parsed" value="${qnaVO.reg_date}"
										pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
										value="${parsed}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td><c:choose>
										<c:when test="${qnaVO.reply eq 'T'}">답변완료</c:when>
										<c:otherwise>답변미완료</c:otherwise>
									</c:choose></td>
							</tr>


							<c:choose>
								<c:when test="${empty qnaVO.re_content}">
									<tr>
										<td colspan="3"><textarea class="form-control"
												name="re_content" rows="5"></textarea> <span><em></em>
												/ 500</span></td>
									</tr>
								</c:when>
								<c:otherwise>
									<tr>
										<td><i style='font-size: 24px; color: blue' class='fab'>&#xf3e6;</i><br>${qnaVO.re_content}</td>
										<td>답변일시<br>
										<fmt:parseDate var="parsed2" value="${qnaVO.re_date}"
												pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
												value="${parsed2}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
										<td></td>
									</tr>
								</c:otherwise>
							</c:choose>
						</table>
						<input type="hidden" name="num" value="${qnaVO.q_num}"> <input
							type="button" class="btn btn-primary" value="목록"
							onclick="history.back();">
						<c:if test="${empty qnaVO.re_content}">
							<input type="submit" class="submit btn btn-primary" value="답글쓰기">
						</c:if>
					</form>


					<!-- /.row -->

				</div>
				<!-- /.container-fluid -->
			</div>
		</div>
		<!-- /#page-wrapper -->

	</div>
</div>
</main>
<!-- /#wrapper -->

<!-- jQuery -->
<script src="../startbootstrap-sb-admin-3.3.7/js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../startbootstrap-sb-admin-3.3.7/js/bootstrap.min.js"></script>

<jsp:include page="footer.jsp"></jsp:include>
<script>
	$('textarea').on('keyup', function() {
		// 남은 글자 수를 구한다.

		var letterLength = $(this).val().length;
		var remain = 500 - letterLength;
		$('em').html(remain);
		if (remain < 0) {
			$(".submit").prop("disabled", true);
			$("span > em").addClass("warning");
		} else {
			$(".submit").prop("disabled", false);
		}
		// 문서 객체에 입력한다.

	});
</script>