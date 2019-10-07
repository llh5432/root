<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">
body {
	margin-top: 20px;
	background-color: #ecf0f5;
}

.box-widget {
	border: none;
	position: relative;
}

.box {
	position: relative;
	border-radius: 3px;
	background: #ffffff;
	border-top: 3px solid #d2d6de;
	margin-bottom: 20px;
	width: 100%;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
}

.box-header.with-border {
	border-bottom: 1px solid #f4f4f4;
}

.box-header {
	color: #444;
	display: block;
	padding: 10px;
	position: relative;
}

.user-block img {
	width: 40px;
	height: 40px;
	float: left;
}

.user-block .username {
	font-size: 16px;
	font-weight: 600;
}

.user-block .description {
	color: #999;
	font-size: 13px;
}

.user-block .username, .user-block .description, .user-block .comment {
	display: block;
	margin-left: 50px;
}

.box-header>.box-tools {
	position: absolute;
	right: 10px;
	top: 5px;
}

.btn-box-tool {
	padding: 5px;
	font-size: 12px;
	background: transparent;
	color: #97a0b3;
}

.box-body {
	border-top-left-radius: 0;
	border-top-right-radius: 0;
	border-bottom-right-radius: 3px;
	border-bottom-left-radius: 3px;
	padding: 10px;
}

.pad {
	padding: 10px;
}

.box .btn-default {
	background-color: #f4f4f4;
	color: #444;
	border-color: #ddd;
}

.box-comments {
	background: #f7f7f7 !important;
}

.box-footer {
	border-top-left-radius: 0;
	border-top-right-radius: 0;
	border-bottom-right-radius: 3px;
	border-bottom-left-radius: 3px;
	border-top: 1px solid #f4f4f4;
	padding: 10px;
	background-color: #fff;
}

.box-comments .box-comment:first-of-type {
	padding-top: 0;
}

.box-comments .box-comment {
	padding: 8px 0;
	border-bottom: 1px solid #eee;
}

.img-sm, .box-comments .box-comment img, .user-block.user-block-sm img {
	width: 30px !important;
	height: 30px !important;
}

.img-sm, .img-md, .img-lg, .box-comments .box-comment img, .user-block.user-block-sm img
	{
	float: left;
}

.box-comments .comment-text {
	margin-left: 10px;
	color: #555;
}

.box-comments .username {
	color: #444;
	display: block;
	font-weight: 600;
}

.box-comments .text-muted {
	font-weight: 400;
	font-size: 12px;
}

.img_pix {
	max-width: 40%;
	max-width: 40%;
	height: auto;
	"
}

.img-sm+.img-push {
	margin-left: 40px;
}

.box .form-control {
	border-radius: 0;
	box-shadow: none;
	border-color: #d2d6de;
}

input[type="text"] {
	width: 80%;
	height: 38px;
	font-size: 1em;
	padding-left: 5px;
	font-style: oblique;
	display: inline;
	outline: none;
	box-sizing: border-box;
	color: black;
}

input[type="button"] {
	width: 10%;
	height: 38px;
	font-size: 1em;
	color: #042AaC;
	outline: none;
	display: inline;
	margin-left: 10px;
	box-sizing: border-box;
}

.btn-like {
	color: transparent;
	text-shadow: 0 0 2px rgba(255, 255, 255, .7), 0 0 0 #000;
}

.btn-like:hover {
	text-shadow: 0 0 0 #ea0;
}

.btn-like.done {
	color: inherit;
	text-shadow: 0;
}

.btn-like.done:hover {
	color: transparent;
	text-shadow: 0 0 0 #777;
}

.div-right {
	float: right;
}

.w {
	text-align: left;
}

.warning {
	color: #f00;
}

/* 파일 존재유/무 */
.file_input_textbox {
	float: left
}

.file_input_div {
	position: relative;
	width: 100px;
	height: 23px;
	overflow: hidden;
}

.data_input_div {
	position: relative;
	width: 100px;
	height: 23px;
	overflow: hidden;
}

.file_input_hidden {
	font-size: 23px;
	position: absolute;
	right: 0px;
	top: 0px;
	cursor: pointer;
	opacity: 0;
	filter: alpha(opacity = 0);
	-ms-filter: "alpha(opacity=0)";
	-khtml-opacity: 0;
	-moz-opacity: 0;
}

.file_input_button {
	width: 100px;
	position: absolute;
	top: 0px;
	background-color: #33BB00;
	color: #FFFFFF;
	border-style: solid;
}

.data_input_button {
	width: 100px;
	position: absolute;
	top: 0px;
	background-color: #33BB00;
	color: #FFFFFF;
	border-style: solid;
}
</style>

<jsp:include page="../header.jsp"></jsp:include>
<div class="container bootstrap snippet">
	<div class="col-md-12">
		<div class="box box-widget col-md-12">
			<div class="box-header with-border">
				<div class="row user-block">
					<!--         <img class="img-circle" src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="User Image"> -->
					<div class="col-md-6">
						<span class="username"><a href="#">작성자 :
								${blogVO.b_name} / 모델 : ${blogVO.b_model}</a></span> <span
							class="description">Posting date - <fmt:parseDate
								var="parsed" value="${blogVO.b_reg_date}"
								pattern="yyyy-MM-dd HH:mm" /> <fmt:formatDate value="${parsed}"
								pattern="yyyy-MM-dd HH:mm" />
						</span>
					</div>

					<div class="col-md-6">
						<a class="btn btn-xs fs-10 btn-bold btn-primary pull-right"
							href="main?b_num=${blogVO.b_num}&pageNum=${pageNum}">목록</a>
						<c:if
							test="${sessionScope.id eq 'admin' or blogVO.b_id eq sessionScope.id}">
							<a class="btn btn-xs fs-10 btn-bold btn-warning pull-right"
								data-toggle="modal" data-target="#update">수정</a>
							<a class="btn btn-xs fs-10 btn-bold btn-danger pull-right"
								href="deleteBoard?b_num=${blogVO.b_num}">삭제</a>
						</c:if>
					</div>

				</div>
			</div>

			<c:choose>
				<c:when test="${not empty blogVO.b_image}">
					<div class="box-body" style="display: block;">
						<img class="img-responsive pad img_pix"
							src="../img/${blogVO.b_id}/${blogVO.b_image}" alt="Photo">
						<p class="w">${blogVO.b_content}</p>
						<c:choose>
							<c:when test="${1 eq LIKE}">
								<button id="likeOn" name="btn_like" class="btn-like done">👍</button>
								<input type="hidden" name="detail_num" value="${blogVO.b_num}">
								<input type="hidden" name="detail_model"
									value="${blogVO.b_model}">

								<div id="like_result" class="pull-right text-muted">${blogVO.b_likeCount}
									likes ${replyCount} comments</div>
							</c:when>
							<c:otherwise>
								<button id="likeOn" name="btn_unlike" class="btn-like">👍</button>
								<input type="hidden" name="detail_num" value="${blogVO.b_num}">
								<input type="hidden" name="detail_model"
									value="${blogVO.b_model}">

								<div id="like_result" class="pull-right text-muted">${blogVO.b_likeCount}
									likes ${replyCount} comments</div>
							</c:otherwise>
						</c:choose>
					</div>
				</c:when>

				<c:otherwise>
					<div class="box-body" style="display: block;">
						<p class="w">${blogVO.b_content}</p>
						<c:choose>
							<c:when test="${1 eq LIKE}">
								<button id="likeOn" name="btn_like" class="btn-like done">👍</button>
								<input type="hidden" name="detail_num" value="${blogVO.b_num}">

								<div id="like_result" class="pull-right text-muted">${blogVO.b_likeCount}
									likes ${replyCount} comments</div>
							</c:when>
							<c:otherwise>
								<button id="likeOn" name="btn_unlike" class="btn-like">👍</button>
								<input type="hidden" name="detail_num" value="${blogVO.b_num}">

								<div id="like_result" class="pull-right text-muted">${blogVO.b_likeCount}
									likes ${replyCount} comments</div>
							</c:otherwise>
						</c:choose>
					</div>
				</c:otherwise>
			</c:choose>

			<div class="box-footer box-comments" style="display: block;">
				<c:choose>
					<c:when test="${not empty replyVO}">
						<!--     댓글 시작 -->
						<c:forEach var="list" items="${replyVO}">
							<div class="box-comment">
								<div class="comment-text">
									<span class="username"> ${list.r_id} <span
										class="text-muted pull-right"> <fmt:parseDate
												var="parsed1" value="${list.r_replyDate}"
												pattern="yyyy-MM-dd HH:mm" /> <fmt:formatDate
												value="${parsed1}" pattern="yyyy-MM-dd HH:mm" /></span>
									</span> ${list.r_comment}
									<c:if test="${list.r_id eq sessionScope.id}">
										<a href="deleteReply?r_num=${list.r_num}&pageNum=${pageNum}"><i
											class="fas fa-trash-alt"></i></a>
									</c:if>
								</div>
							</div>
							<!-- 댓글 끝 -->
						</c:forEach>
					</c:when>
					<c:otherwise>
						<span class="text-muted">가장 먼저 댓글을 달아보세요!</span>
					</c:otherwise>
				</c:choose>

			</div>
			<div class="box-footer" style="display: block;">

				<form action="replyWrite?b_num=${blogVO.b_num}&pageNum=${pageNum}"
					method="post">
					<div class="img-push">
						<input type="text" name="r_comment" class="form-control input-sm"
							id="comment_textarea" placeholder="Press enter to post comment"
							maxlength="100"> <input type="submit"
							class="submit btn btn-primary" value="등록">
					</div>
				</form>

			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="update">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header">
				<h3 class="modal-title">수정하기</h3>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<form action="updateBoard" method="post"
				enctype="multipart/form-data">
				<div class="modal-body">
					<div class="form-group">
						<select name="b_model" class="form-control" required="required">
							<option value="${blogVO.b_model}">${blogVO.b_model}</option>
							<c:choose>
								<c:when test="${not empty oList}">
									<c:forEach var="oppaNum" items="${oList}">
										<option value="${oppaNum.model}">${oppaNum.name}</option>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<option value="">모델이 없습니다.</option>
								</c:otherwise>
							</c:choose>
						</select>
					</div>
					<div class="form-group">
						<input type="text" name="b_title" class="form-control"
							placeholder="제목을 입력하세요" required="required" maxlength="50"
							value="${blogVO.b_title}">
					</div>
					<div class="form-group">
						<textarea rows="10" cols="61" name="b_content"
							placeholder="내용을 입력해주세요." required="required">${blogVO.b_content}</textarea>
						<span id="length-span"><em id="length-em"></em> / 500</span>
						<c:choose>
							<c:when test="${empty blogVO.b_image}">
								<input id="fileName" class="file_input_textbox" readonly
									value="사진없음" />
								<input type="hidden" name="hidden_num" value="0">
							</c:when>
							<c:otherwise>
								<input id="fileName" class="file_input_textbox" readonly
									value="${blogVO.b_image}" />
								<input type="hidden" name="hidden_num" value="1">
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="modal-footer">
					<input type="hidden" name="b_num" value="${blogVO.b_num}">
					<input multiple="multiple" type="file" name="b_img"> <input
						type="reset" class="btn btn-warning float-center" value="초기화">
					<input type="submit" class="submit btn btn-primary float-right"
						value="수정완료">
				</div>
			</form>
		</div>
	</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
<script>
	$('#likeOn').click(
		function() {
			var b_num = ${blogVO.b_num};
				console.log(b_num);

				$.ajax({type:"POST",
						url:"likeBtn",
						data:{b_num : b_num},
						success : function(btn) {
							if (btn == 1) {
								alert('좋아요');
								document.getElementById("likeOn").className = "btn-like done";
							} else if (btn == 0) {
								alert('좋아요 없앰');
								document.getElementById("likeOn").className = "btn-like";
							}},
								error : function() {
									alert("통신 실패");
								}
						});
				});

	$('textarea').on('keyup',function() {
				// 남은 글자 수를 구한다.

				var letterLength = $(this).val().length;
				var remain = 500 - letterLength;
				$('em').html(remain);
				if (remain < 0) {
					$(".submit").prop("disabled", true);
					console.log('여기까지진행');
					document.getElementById('length-em').setAttribute('class',
							'warning');
				} else {
					$(".submit").prop("disabled", false);
				}
				// 문서 객체에 입력한다.
			});
</script>