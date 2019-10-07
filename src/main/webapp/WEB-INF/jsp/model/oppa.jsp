<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<style type=text/css>
	@charset "UTF-8";

.publicaciones-blog-home {
	padding-bottom: 50px;
	background: url("") no-repeat fixed center center;
	background-size: 100% auto;
	background-color: #f1f1f1;
}

.publicaciones-blog-home h2 {
	text-align: center;
	font-weight: 300;
	margin-bottom: 30px;
	font-size: 44px;
	margin-top: 70px;
}

.publicaciones-blog-home h2 b {
	color: #2BBCDE;
}

.publicaciones-blog-home .fondo-publicacion-home {
	background: #ffffff;
	border-radius: 3px;
	overflow: hidden;
	height: 400px;
	margin-bottom: 20px;
	display: block;
	color: inherit;
	text-decoration: none;
	position: relative;
}

.publicaciones-blog-home .fondo-publicacion-home:hover h3 {
	color: #2BBCDE;
	/*    box-shadow: 0px 4px 3px 3px rgba(0, 0, 0, 0.08);*/
}

.publicaciones-blog-home .fondo-publicacion-home:hover .mascara-enlace-blog-home
	{
	height: 400px;
	width: 100%;
	color: #aaa;
	background-color: #2BBCDE;
	position: absolute;
	top: 0;
	opacity: 0.95;
	-webkit-transition: all 0.4s ease-out 0s;
	-o-transition: all 0.4s ease-out 0s;
	transition: all 0.4s ease-out 0s;
}

.publicaciones-blog-home .black {
	background: #2BBCDE;
}

.publicaciones-blog-home .fondo-publicacion-home .img-publicacion-principal-home
	{
	display: inline-block;
	width: 50%;
	overflow: hidden;
	height: 100%;
}

.publicaciones-blog-home .fondo-publicacion-home .img-publicacion-principal-home img
	{
	height: 100%;
	width: auto;
}

.publicaciones-blog-home .fondo-publicacion-home .contenido-publicacion-principal-home
	{
	display: inline-block;
	vertical-align: top;
	width: 49%;
	padding: 0 10px;
}

.publicaciones-blog-home .fondo-publicacion-home .contenido-publicacion-principal-home h3
	{
	font-weight: 900;
	color: #fff;
	text-transform: uppercase;
	font-size: 30px;
}

.publicaciones-blog-home .fondo-publicacion-home .contenido-publicacion-principal-home p
	{
	color: #ffffff;
	font-size: 16px;
	font-weight: 300;
}

.publicaciones-blog-home .fondo-publicacion-home .contenido-publicacion-home
	{
	padding: 0 10px;
}

.publicaciones-blog-home .fondo-publicacion-home .contenido-publicacion-home h3
	{
	font-weight: 900;
	font-size: 20px;
	text-transform: uppercase;
}

.publicaciones-blog-home .fondo-publicacion-home .img-publicacion-home {
	overflow: hidden;
	max-height: 180px;
}

.mascara-enlace-blog-home {
	height: 400px;
	width: 0%;
	color: #aaa;
	background-color: #2BBCDE;
	position: absolute;
	top: 0;
	opacity: 0.0;
	-webkit-transition: all 0.4s ease-out 0s;
	-o-transition: all 0.4s ease-out 0s;
	transition: all 0.4s ease-out 0s;
	text-align: center;
	padding-top: 180px;
}

.mascara-enlace-blog-home span {
	text-align: center;
	max-height: 400px;
	border: 1px solid #fff;
	display: inline-block;
	padding: 10px 30px;
	border-radius: 3px;
	color: #fff;
	font-weight: 900;
	font-size: 16px;
}

.publicaciones-blog-home .todas-las-publicaciones-home {
	background: #2BBCDE;
	height: 400px;
	width: 100%;
	display: inline-block;
	padding: 20px;
	text-decoration: none;
	border-radius: 3px;
}

.publicaciones-blog-home .todas-las-publicaciones-home span {
	color: #fff;
	font-weight: 900;
	text-transform: uppercase;
	font-size: 25px;
	line-height: 26px;
}

@media ( max-width : 768px) {
	.publicaciones-blog-home h2 {
		text-align: center;
		font-weight: 300;
		margin-bottom: 30px;
		font-size: 34px;
		margin-top: 70px; . publicaciones-blog-home .fondo-publicacion-home {
		background : #ffffff;
		border-radius: 3px;
		overflow: hidden;
		height: inherit;
		margin-bottom: 20px;
		display: block;
		color: inherit;
		text-decoration: none;
		position: relative;
	}
	.publicaciones-blog-home .fondo-publicacion-home .img-publicacion-principal-home
		{
		display: inline-block;
		width: 100%;
		overflow: hidden;
		height: auto;
	}
	.publicaciones-blog-home .fondo-publicacion-home .img-publicacion-principal-home img
		{
		height: auto;
		width: 100%;
	}
	.publicaciones-blog-home .black {
		background: #fff;
	}
	.publicaciones-blog-home .fondo-publicacion-home .contenido-publicacion-principal-home
		{
		display: inline-block;
		vertical-align: top;
		width: 100%;
		padding: 0 10px;
	}
	.publicaciones-blog-home .fondo-publicacion-home .contenido-publicacion-principal-home h3
		{
		font-weight: 900;
		color: #333;
		text-transform: uppercase;
		font-size: 20px;
	}
	.publicaciones-blog-home .fondo-publicacion-home .contenido-publicacion-principal-home p
		{
		color: #333;
		font-size: 14px;
		font-weight: 400;
	}
	.publicaciones-blog-home .todas-las-publicaciones-home {
		background: #2BBCDE;
		height: 100%;
		width: 100%;
		display: inline-block;
		padding: 20px;
		text-decoration: none;
		border-radius: 3px;
	}
	.center1 {
		margin-left: auto;
		margin-right: auto;
		margin-bottom: auto;
		margin-top: auto;
		text-align: center;
	}
	#text4 {
		vertical-align: bottom;
	}
}

/* modal css */
.portfolio {
	padding: 6%;
	text-align: center;
}

.heading {
	background: #fff;
	padding: 1%;
	text-align: left;
	box-shadow: 0px 0px 4px 0px #545b62;
}

.heading img {
	width: 10%;
}

.bio-info {
	padding: 5%;
	background: #fff;
	box-shadow: 0px 0px 4px 0px #b0b3b7;
}

.name {
	font-family: 'Charmonman', cursive;
	font-weight: 600;
}

.bio-image {
	text-align: center;
}

.bio-image img {
	width: 350px;
	height: 350px;
	border-radius: 50%;
}

.bio-content {
	text-align: left;
}

.bio-content p {
	font-weight: 600;
	font-size: 30px;
}

.img_fill {
	width: 100px;
	height: 100px;
	object-fit: fill;
}

.img_div {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}

/* modal username */
.user-block .username {
	font-size: 16px;
	font-weight: 600;
}

.user-block .username, .user-block .description, .user-block .comment {
	display: block;
	margin-left: 50px;
}

.box-comments .username {
	color: #444;
	display: block;
	font-weight: 600;
}

.user-block .description {
	color: #999;
	font-size: 13px;
}

/* modal-comment css */
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

.tcolor{
	color: white;
}
</style>
<link rel="stylesheet" type="text/css" href="./oppaStyle.css">
<jsp:include page="../header.jsp"></jsp:include>

<section class="publicaciones-blog-home">
	<div class="container">

		<h2>${member.name}
			<b>Oppa</b>
		</h2>

		<div class="row-page row">

			<div class="col-page col-sm-8 col-md-6">
				<a href="javascript:windowopenPopup();"
					class="black fondo-publicacion-home" data-toggle="modal"
					data-target="#Carousel">
					<div class="img-publicacion-principal-home">
						<c:choose>
							<c:when test="${not empty member.image}">
								<img src="../img/${member.id}/${member.image}"
									style="max-height: 100%; max-width: 100%;">
							</c:when>
							<c:otherwise>
								<img src="../img/oppaHomePageImg/사진준비중.png"
									style="max-height: 100%; max-width: 100%;">
							</c:otherwise>
						</c:choose>

					</div>
					<div class="contenido-publicacion-principal-home">
						<br>
						<h6>이름(Name) : ${member.name}</h6>
						<h6>직업(job) : ${member.job}</h6>
						<h6>언어(Language): ${member.language}</h6>
						<h6>나이(Age) : ${member.age}</h6>
						<h6>소개글(Self-introduce)</h6>
						<c:choose>
							<c:when test="${not empty member.intro}">
								<p>${member.intro}</p>
							</c:when>
							<c:otherwise>
								<p>준비중입니다.</p>
							</c:otherwise>
						</c:choose>


					</div>
					<div class="mascara-enlace-blog-home">
						<span>View</span>
					</div>
				</a>
			</div>

			<c:if test="${not empty blog}">
				<c:set var="k" value="1"></c:set>
				<c:forEach var="item" items="${blog}">
					<c:set var="numb" value="${numb + k}"></c:set>
					<div class="col-page col-sm-4 col-md-3">
						<%--               <a href="/oppa/blog/detail?b_num=${item.b_num}"  class="fondo-publicacion-home"> --%>
						<a data-toggle="modal" data-target="#test${numb}"
							class="fondo-publicacion-home">
							<div class="img-publicacion-home">
								<c:choose>
									<c:when test="${not empty item.b_image}">
										<img class="img-responsive"
											src="../img/${item.b_id}/${item.b_image}"
											style="max-height: 100%; max-width: 100%;">
									</c:when>
									<c:otherwise>
										<img class="img-responsive"
											src="../img/oppaHomePageImg/noimage.png"
											style="max-height: 100%; max-width: 100%;">
									</c:otherwise>
								</c:choose>

							</div>

							<div class="contenido-publicacion-home">
								<div class="center1 ">
									<h3
										style="width: 230px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${item.b_title}</h3>
									<p
										style="width: 230px; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 5; -webkit-box-orient: vertical; word-wrap: break-word; line-height: 1.2em; height: 3.6em;">${item.b_content}</p>
									<div class="pull-right text-muted">${item.b_likeCount}
										<i class="fas fa-heart"></i>
									</div>
								</div>
							</div>

							<div class="mascara-enlace-blog-home">
								<span>View </span>
							</div>
						</a>
					</div>
				</c:forEach>
			</c:if>

			<c:if test="${count ne 6}">
				<c:forEach begin="1" end="${count}">
					<div class="col-page col-sm-4 col-md-3">
						<a href="/blog/main" class="fondo-publicacion-home">
							<div class="img-publicacion-home">
								<img class="img-responsive"
									src="../img/oppaHomePageImg/noimage.png"
									style="max-height: 100%; max-width: 100%;">
							</div>

							<div class="contenido-publicacion-home center">
								<div class="center1">
									<h4>등록된 글이 아직 없습니다</h4>
									<p>첫 글의 주인이 되보세요!</p>
								</div>
							</div>

							<div class="mascara-enlace-blog-home">
								<span>Write </span>
							</div>
						</a>
					</div>
				</c:forEach>
			</c:if>

			<div class="col-page col-sm-4 col-md-3">
				<div class="todas-las-publicaciones-home">
					<span class="center">추천 게시글 TOP5</span><br><br>
					<p>기능설명 : 좋아요 수가 가장 많은 5개를 추려옵니다.</p>
					<p>해당 글을 클릭 시 조그만하게 볼 수 있습니다<p>
					<p>모델의 자기소개를 클릭 시 블로그 글 작성시에 지정했던 모델의 모든 사진들을 볼 수있습니다.</p>						
				</div>
			</div>

		</div>
	</div>

</section>

<div class="modal fade" id="Carousel">
	<div class="modal-dialog">
		<div class="modal-content">

			<!--Carousel Wrapper-->
			<div id="carousel-example-2" class="carousel slide carousel-fade"
				data-ride="carousel">
				<!--Indicators-->
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-2" data-slide-to="0"
						class="active"></li>

					<c:forEach var="i" begin="1" end="${imgNum}">
						<li data-target="#carousel-example-2" data-slide-to="${i}"></li>
					</c:forEach>
				</ol>
				<!--/.Indicators-->
				<!--Slides-->
				<div class="carousel-inner" role="listbox">
					<div class="carousel-item active">
						<div class="view">
							<img class="d-block w-100"
								src="../img/${member.id}/${member.image}"
								style="height: 360px; width: 500px;">
							<div class="mask rgba-black-light"></div>
						</div>
						<div class="carousel-caption">
							<h3 class="h3-responsive">${member.name}Oppa</h3>
							<p>Profile 사진</p>
						</div>
					</div>

					<c:if test="${not empty selImg}">
						<c:forEach var="item2" items="${selImg}" begin="0" end="${imgNum}">
							<div class="carousel-item">
								<!--Mask color-->
								<div class="view">
									<img class="d-block w-100"
										src="../img/${item2.b_id}/${item2.b_image}"
										style="height: 360px; width: 500px;">
									<div class="mask rgba-black-strong"></div>
								</div>
								<div class="carousel-caption">
									<h3 class="h3-responsive">${item2.b_id}</h3>
									<p>${item2.b_title}</p>
								</div>
							</div>
						</c:forEach>
					</c:if>

				</div>
				<!--/.Slides-->
				<!--Controls-->
				<a class="carousel-control-prev" href="#carousel-example-2"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carousel-example-2"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
				<!--/.Controls-->
			</div>
			<!--/.Carousel Wrapper-->


		</div>
	</div>
</div>

<!-- modal -->
<c:set var="j" value="1"></c:set>
<c:forEach var="modalBlog" items="${blog}">
	<c:set var="numb2" value="${numb2 + j}"></c:set>
	<div class="modal fade" id="test${numb2}">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<div class="modal-title">

						<h4>추천 게시글</h4>
						<span class="username">작성자 : ${modalBlog.b_name} / 모델 :
							${modalBlog.b_model}</span><br> <span class="description">Posting
							date - <fmt:parseDate var="reg_date"
								value="${modalBlog.b_reg_date}" pattern="yyyy-MM-dd HH:mm" /> <fmt:formatDate
								value="${reg_date}" pattern="yyyy-MM-dd HH:mm" />
						</span>
						<!--             <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button> -->
					</div>
				</div>
				<c:choose>
					<c:when test="${not empty modalBlog.b_image}">
						<div class="modal-body">
							<img alt="테스트사진"
								src="../img/${modalBlog.b_id}/${modalBlog.b_image}"
								class="img-rounded"
								style="width: auto; max-width: 465px; height: auto;">
							<!--               <p><a href="monster.suvenconsultants.com/#section-angularJs-Bootsrtap" class="btn btn-info btn-block" style="color:white;font-weight:bold;">Learn Bootstrap!</a></p> -->
							<p class="lead">${modalBlog.b_content}</p>
						</div>
					</c:when>
					<c:otherwise>
						<div class="modal-body">
							<img alt="테스트사진" src="../img/oppaHomePageImg/noimage.png"
								class="img-rounded"
								style="width: auto; max-width: 465px; height: auto;">
							<!--               <p><a href="monster.suvenconsultants.com/#section-angularJs-Bootsrtap" class="btn btn-info btn-block" style="color:white;font-weight:bold;">Learn Bootstrap!</a></p> -->
							<p class="lead">${modalBlog.b_content}</p>
						</div>
					</c:otherwise>
				</c:choose>

				<div class="modal-footer">
					<p class="pull-right text-muted">Like ${modalBlog.b_likeCount}♥</p>
					<p class="pull-right text-muted">comment
						${modalBlog.b_replyCount}</p>
				</div>
			</div>
		</div>
	</div>
</c:forEach>

<jsp:include page="../footer.jsp"></jsp:include>