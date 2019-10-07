<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="main.jsp"%>
<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
<div id="page-wrapper">

	<div class="container-fluid">

		<!-- Page Heading -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">${blogVO.b_title}</h1>
				<ol class="breadcrumb">
					<li class="active">${blogVO.b_id}/${blogVO.b_name} 님</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->
		<div class="row">
			<div class="col-lg-12">
				<div class="table-responsive">
					<form action="blogDetailDelete" method="post">
						<table class="table table-bordered table-hover">

							<tr>
								<th colspan="7">내 용</th>
							</tr>

							<tr>
								<td colspan="7">[이 미 지]<br> <c:if
										test="${blogVO.b_image ne null}">
										<img src="../img/${blogVO.b_id}/${blogVO.b_image}" width="200"
											height="150">
									</c:if> <br> [글 내 용]<br> <span>${blogVO.b_content}</span> <br>
									[추 천 수] ${blogVO.b_likeCount}<br> [조 회 수]
									${blogVO.b_readCount}<br> [댓 글 수] ${replyCount}<br>
									[작성날짜] <fmt:parseDate var="regDate"
										value="${blogVO.b_reg_date}" pattern="yyyy-MM-dd HH:mm:ss" />
									<fmt:formatDate value="${regDate}" pattern="yyyy-MM-dd" />

								</td>

							</tr>
						</table>
						<input type="hidden" name="num" value="${blogVO.b_num}"> <input
							type="button" class="btn btn-primary" value="목록"
							onclick="history.back();"> <input type="submit"
							class="btn btn-danger" value="삭제">
					</form>


				</div>

			</div>
		</div>


	</div>
</div>
</main>

<jsp:include page="footer.jsp"></jsp:include>