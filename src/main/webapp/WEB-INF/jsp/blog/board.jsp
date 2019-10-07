<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<!------ Include the above in your HEAD tag ---------->
<style type="text/css">
body {
	background: #FCFCFC;
}

.pr-12 {
	padding-right: 12px !important;
}

.mb-20 {
	margin-bottom: 20px !important;
}

.b-1 {
	border: 1px solid #ebebeb !important;
}

.card {
	border: 0;
	border-radius: 0;
	margin-bottom: 30px;
	-webkit-transition: .5s;
	transition: .5s;
}

.card {
	position: relative;
	display: -ms-flexbox;
	display: flex;
	-ms-flex-direction: column;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box;
	border: 1px solid rgba(0, 0, 0, .125);
	border-radius: .25rem;
}

.media {
	padding: 16px 12px;
	-webkit-transition: background-color .2s linear;
	transition: background-color .2s linear;
}

.media {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-align: start;
	align-items: flex-start;
}

.card-body {
	-ms-flex: 1 1 auto;
	flex: 1 1 auto;
	padding: 1.25rem;
}

.media .avatar {
	flex-shrink: 0;
}

.no-radius {
	border-radius: 0 !important;
}

.avatar-xl {
	width: 64px;
	height: 64px;
	line-height: 64px;
	font-size: 1.25rem;
}

.avatar {
	position: relative;
	display: inline-block;
	width: 36px;
	height: 36px;
	line-height: 36px;
	text-align: center;
	border-radius: 100%;
	background-color: #f5f6f7;
	color: #8b95a5;
	text-transform: uppercase;
}

.img_size {
	min-height: 100px;
	min-width: 150px;
	height: 200px;
	width: 300px;
}

img {
	vertical-align: middle;
	border-style: none;
}

.mb-2 {
	margin-bottom: .5rem !important;
}

.fs-20 {
	font-size: 20px !important;
}

.pr-16 {
	padding-right: 16px !important;
}

.ls-1 {
	letter-spacing: 1px !important;
}

.fw-300 {
	font-weight: 300 !important;
}

.fs-16 {
	font-size: 16px !important;
}

.media-body>* {
	margin-bottom: 0;
}

small, time, .small {
	font-family: Roboto, sans-serif;
	font-weight: 400;
	font-size: 11px;
	color: #8b95a5;
}

.fs-14 {
	font-size: 14px !important;
}

.mb-12 {
	margin-bottom: 12px !important;
}

.text-fade {
	color: rgba(77, 82, 89, 0.7) !important;
}

.card-footer:last-child {
	border-radius: 0 0 calc(.25rem - 1px) calc(.25rem - 1px);
}

.card-footer {
	background-color: #fcfdfe;
	border-top: 1px solid rgba(77, 82, 89, 0.07);
	color: #8b95a5;
	padding: 10px 20px;
}

.flexbox {
	display: -webkit-box;
	display: flex;
	-webkit-box-pack: justify;
	justify-content: space-between;
}

.align-items-center {
	-ms-flex-align: center !important;
	align-items: center !important;
}

.card-footer {
	padding: .75rem 1.25rem;
	background-color: rgba(0, 0, 0, .03);
	border-top: 1px solid rgba(0, 0, 0, .125);
}

.card-footer {
	background-color: #fcfdfe;
	border-top: 1px solid rgba(77, 82, 89, 0.07);
	color: #8b95a5;
	padding: 10px 20px
}

.card-footer>*:last-child {
	margin-bottom: 0
}

.hover-shadow {
	-webkit-box-shadow: 0 0 35px rgba(0, 0, 0, 0.11);
	box-shadow: 0 0 35px rgba(0, 0, 0, 0.11)
}

.fs-10 {
	font-size: 10px !important;
}

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

.pagination {
	justify-content: center;
}
</style>

<jsp:include page="../header.jsp"></jsp:include>
<div class="container">

	<section class="jumbotron text-center">
		<div class="container">
			<h1 class="jumbotron-heading">우리들만의 이야기</h1>
			<p class="lead text-muted">부산의 어떤 곳에 가보셨나요? 남포동? 서면? 자갈치시장?</p>
			<p class="lead text-muted">그리고 어떤 음식을 먹으셨나요? 맛은 어떠하셨나요?</p>
			<p class="lead text-muted">여러분들의 여행 후기와 오빠와의 데이트한 추억을 남겨 놓고 가볼까요?
			</p>
			<p class="lead text-muted">부산오빠는 여러분의 예쁜추억을 만들기위해 노력하겠습니다!</p>
			<c:choose>
				<c:when test="${not empty sessionScope.id}">
					<input class="btn btn-primary" type="button" value="추억 남기기"
						data-toggle="modal" data-target="#write">
				</c:when>
				<c:otherwise>
					<input class="btn btn-info" type="button" value="1:1문의하기" id="btn">
				</c:otherwise>
			</c:choose>

		</div>
	</section>

	<div class="col-md-12">
		<c:choose>
			<c:when test="${not empty bList}">
				<c:forEach var="item" items="${bList}">
					<div class="card b-1 hover-shadow mb-20">
						<div class="media card-body">
							<c:choose>
								<c:when test="${not empty item.b_image}">
									<div class="media-left pr-12">
										<img class="img_size"
											src="../img/${item.b_id}/${item.b_image}" alt="...">
									</div>
								</c:when>
								<c:otherwise>
									<div class="media-left pr-12">
										<img class="img_size" src="../img/admin/no_image.png"
											alt="사진없음">
									</div>
								</c:otherwise>
							</c:choose>

							<div class="media-body">
								<div class="mb-2">
									<span class="fs-20 pr-16">Post By ${item.b_name}</span>
								</div>
								<br> <a
									href="detail?b_num=${item.b_num}&pageNum=${pageVO.pageNum}">
									<small class="fs-16 fw-300 ls-1">${item.b_title}</small>
								</a>
							</div>
							<div class="media-right text-right d-none d-md-block">
								<p class="fs-14 text-fade mb-12">
									<i class="fas fa-male"></i>Model : ${item.b_model}
								</p>
								<p class="fs-14 text-fade mb-12">
									<i class="far fa-eye"></i> ${item.b_readCount} see
								</p>
								<span class="text-fade"><i class="far fa-heart"></i>
									${item.b_likeCount}like</span><br> <span class="text-fade"><i
									class="far fa-comments"></i>${item.replyCount} comment</span>
							</div>
						</div>

						<footer class="card-footer flexbox align-items-center">
							<div>
								<strong>No.${item.b_num} / <span>Posting Date :
										<fmt:parseDate var="parsed" value="${item.b_reg_date}"
											pattern="yyyy-MM-dd HH:mm" /> <fmt:formatDate
											value="${parsed}" pattern="yyyy-MM-dd HH:mm" />
								</span>
								</strong>
							</div>
							<div class="card-hover-show">
								<a class="btn btn-xs fs-10 btn-bold btn-primary"
									href="detail?b_num=${item.b_num}&pageNum=${pageVO.pageNum}">보기</a>
								<c:choose>
									<c:when test="${sessionScope.id eq 'admin'}">
										<a class="btn btn-xs fs-10 btn-bold btn-warning"
										href="deleteBoard?b_num=${item.b_num}">삭제</a>
									</c:when>										
									<c:when test="${sessionScope.id eq item.b_id}">
										<a class="btn btn-xs fs-10 btn-bold btn-warning"
										href="deleteBoard?b_num=${item.b_num}">삭제</a>
									</c:when>
									<c:otherwise>
									</c:otherwise>
								</c:choose>	
							</div>
						</footer>
					</div>
				</c:forEach>
			</c:when>
		</c:choose>

		<!-- 여기까지 -->
		<c:if test="${pageVO.count gt 0}">
			<div id="PageBlock">
				<ul class="pagination">
					<c:if test="${pageVO.startPage gt pageVO.pageBlock}">
						<li class="page-item"><a class="page-link"
							href="main?pageNum=${pageVO.startPage - pageVO.pageBlock}"><i
								class="fas fa-chevron-left"></i></a></li>
					</c:if>
					<!--        			1~10 페이지블록 범위 출력 -->
					<c:forEach var="i" begin="${pageVO.startPage}"
						end="${pageVO.endPage}" step="1">
						<c:choose>
							<c:when test="${i eq pageVO.pageNum}">
								<li class="page-item"><a class="page-link"
									href="main?pageNum=${i}"><b>${i}</b></a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="main?pageNum=${i}">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<!-- 				[다음] -->
					<c:if test="${pageVO.endPage lt pageVO.pageCount}">
						<li class="page-item"><a class="page-link"
							href="main?pageNum=${pageVO.startPage + pageVO.pageBlock}"><i
								class="fas fa-chevron-right"></i></a></li>
					</c:if>
				</ul>
			</div>
		</c:if>
		<div class="modal fade" id="write">
			<div class="modal-dialog">
				<div class="modal-content">

					<div class="modal-header">
						<h3 class="modal-title">추억 남기기</h3>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<form action="blogAdd" method="post" enctype="multipart/form-data">
						<div class="modal-body">
							<div class="form-group">
								<select name="b_model" class="form-control" required="required">
									<option value="">누구와 함께하셨나요?</option>
									<c:forEach var="oppaNum" items="${oList}">
										<option value="${oppaNum.model}">${oppaNum.name}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group">
								<input type="text" name="b_title" class="form-control"
									placeholder="제목을 입력하세요" required="required" maxlength="50">
							</div>
							<div class="form-group">
								<textarea rows="10" cols="61" name="b_content"
									placeholder="내용을 입력해주세요." required="required"></textarea>
								<span><em></em> / 500</span>
							</div>
						</div>
						<div class="modal-footer">

							<input multiple="multiple" type="file" value="사진" name="b_img">
							<input type="reset" class="btn btn-warning float-center"
								value="초기화"> <input type="submit"
								class="submit btn btn-primary float-right" value="작성완료">
						</div>
					</form>
				</div>
			</div>
		</div>
		<br>
	</div>

</div>
<jsp:include page="../footer.jsp"></jsp:include>

<script>
$(function(){
	
	$('#btn').click(function(){
		alert('로그인이 필요한 기능입니다.');
		location.href="/member/login";
		return;
	});
	
	$('textarea').on('keyup', function(){
	    // 남은 글자 수를 구한다.

	var letterLength = $(this).val().length;
    var remain = 500 - letterLength;
    $('em').html(remain);
	    if(remain < 0){
	    	$(".submit").prop("disabled", true);
	    	$("span > em").addClass("warning");
	    }else{
	    	$(".submit").prop("disabled", false);
	    }
	    // 문서 객체에 입력한다.
	    
	});
});	
</script>