<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- <meta charset="UTF-8"> -->
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!-- <meta name="description" content=""> -->
<!-- <meta name="author" content=""> -->
<!-- <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.5.0/css/all.css' integrity='sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU' crossorigin='anonymous'> -->
<script>
	function mySubmit(index) {
		if (index == 1) {
			document.myForm.action = 'bookDetailMeetCheck';
		}

		if (index == 2) {
			document.myForm.action = 'bookDetailDelete';
		}

		document.myForm.submit();
	}
</script>

<%@include file="main.jsp"%>

<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
<div id="page-wrapper">

	<div class="container-fluid">

		<!-- Page Heading -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">예약정보</h1>
				<ol class="breadcrumb">
					<li class="active">※ 개인정보는 고객 동의하에 운영자만이 열람 할 수 있습니다.</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->
		<div class="row">
			<div class="col-lg-12">
				<div class="table-responsive">
					<form name="myForm" method="post">
						<table class="table table-bordered table-hover">

							<tr>
								<th colspan="3">요청사항</th>
								<th>예약날짜</th>
								<th>진행상황</th>
							</tr>

							<tr>
								<td colspan="3">${bookVO.content}</td>
								<td>${bookVO.book_date}</td>
								<td><c:choose>
										<c:when test="${bookVO.meet eq 'F'}">
											진행중
										</c:when>
										<c:otherwise>
											진행완료
										</c:otherwise>
									</c:choose></td>
							</tr>

						</table>
						<input type="hidden" name="num" value="${bookVO.book_num}">
						<input type="button" class="btn btn-primary" value="목록"
							onclick="history.back();">
						<c:choose>
							<c:when test="${bookVO.meet eq 'F'}">
								<input type="button" class="btn btn-primary" value="진행완료"
									onclick="mySubmit(1)">
								<input type="button" class="btn btn-danger" value="예약글삭제"
									onclick="mySubmit(2)">
							</c:when>
							<c:otherwise>
								<input type="button" class="btn btn-primary" value="진행완료"
									disabled="disabled">
								<input type="button" class="btn btn-danger" value="예약글삭제"
									onclick="mySubmit(2)">
							</c:otherwise>
						</c:choose>
					</form>




				</div>

			</div>
		</div>


	</div>
</div>
</main>


<jsp:include page="footer.jsp"></jsp:include>