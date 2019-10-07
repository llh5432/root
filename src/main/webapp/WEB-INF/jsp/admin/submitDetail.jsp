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
	
function mySubmit(index){
	if(index == 1){
		document.myForm.action='submitDetailUpgrade';
	}
	
	if(index == 2){
		document.myForm.action='submitDetailDelete';
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
				<h1 class="page-header">자기소개서</h1>
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
								<th colspan="3">내 용</th>
								<th>신청일시</th>
								<th>등업여부</th>
							</tr>

							<tr>
								<td colspan="3"><input type="hidden" name="id"
									value="${memberVO.id}"> <input type="hidden"
									name="name" value="${memberVO.name}"> [신청계정]
									${memberVO.id}<br> [ 나 이 ] ${memberVO.age}<br> [ 이 름
									] ${memberVO.name}<br> [ 언 어 ] ${memberVO.language}<br>
									[거 주 지] ${memberVO.address}<br> [ 직 업 ] ${memberVO.job}<br>
									[자기소개] ${submitVO.s_comment}</td>
								<td><fmt:parseDate var="regDate"
										value="${submitVO.s_reg_date}" pattern="yyyy-MM-dd HH:mm:ss" />
									<fmt:formatDate value="${regDate}" pattern="yyyy-MM-dd" /></td>
								<td><c:choose>
										<c:when test="${submitVO.s_upgrade eq 'F'}">
											등업보류
										</c:when>
										<c:otherwise>
											등업완료
										</c:otherwise>
									</c:choose></td>
							</tr>

						</table>
						<input type="hidden" name="num" value="${submitVO.s_num}">
						<input type="button" class="btn btn-primary" value="목록"
							onclick="history.back();">
						<c:choose>
							<c:when test="${submitVO.s_upgrade eq 'F'}">
								<input type="submit" class="btn btn-primary" value="등업"
									onclick="mySubmit(1)">
								<input type="button" class="btn btn-danger" value="삭제"
									onclick="mySubmit(2)">
							</c:when>
							<c:otherwise>
								<input type="button" class="btn btn-danger" value="등업완료"
									disabled="disabled">
								<input type="button" class="btn btn-danger" value="삭제"
									onclick="mySubmit(2)">
							</c:otherwise>
						</c:choose>
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
<!-- <script src="../startbootstrap-sb-admin-3.3.7/js/jquery.js"></script> -->

<!-- <!-- Bootstrap Core JavaScript -->
-->
<!-- <script src="../startbootstrap-sb-admin-3.3.7/js/bootstrap.min.js"></script> -->

<jsp:include page="footer.jsp"></jsp:include>