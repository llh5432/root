<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<style>
.effect {
	display: inline-block;
	position: relative;
}

.effect:after {
	position: absolute;
	display: block;
	content: "";
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	box-shadow: inset 0 0 50px rgba(0, 0, 0, 0.5), inset 0 0 100px
		rgba(0, 0, 0, 0.2);
	background: rgba(0, 255, 0, 0.1); /* 이미지 위로 컬러를 입힘 */
}

.jumbotron {
	margin-bottom: 20px;
	margin-top: 20px;
	position: center;
}

.pricing {
	text-align: center;
}

/*Page Header*/
.page-header {
	text-align: center;
}

.img-blog {
	width: 100%;
	height: 300px;
	max-width: 100%;
	max-height: 400px;
}

.single-blog-item {
	border: 1px solid #dfdede;
	box-shadow: 2px 5px 10px #dfdede;
	margin: 15px auto;
	padding: 5px;
	position: relative;
}

.blog-content {
	padding: 15px;
}

.blog-content h4 {
	font-size: 16px;
	font-weight: 500;
	margin-bottom: 10px;
	text-transform: uppercase;
}

.blog-content h4 a {
	color: #777;
}

.blog-content p {
	color: #999;
	font-size: 14px;
	font-weight: 300;
	line-height: 1.3333;
}

.blog-date {
	
}

.blog-date {
	position: absolute;
	background: #337ab7;
	top: 35px;
	left: 5px;
	color: #fff;
	border-radius: 0 25px 25px 0;
	padding: 5px 15px;
	font-weight: 700;
}

.more-btn {
	background: #337ab7;
	border-radius: 2px;
	display: block;
	height: 30px;
	line-height: 30px;
	margin: 30px auto auto auto;
	text-align: center;
	width: 110px;
	color: #f1f1f1;
}

.img {
	position: relative;
	background-image: url(./img/img1.jpg);
	height: 100vh;
	background-size: cover;
}

.img-cover {
	position: absolute;
	height: 100%;
	width: 100%;
	background-color: rgba(0, 0, 0, 0.4);
	/*    z-index:1; */
}

.img .content {
	position: absolute;
	top: 20%;
	left: 25%;
	transform: translate(-50%, -50%); */
	font-size: 1rem;
	color: white;
	/*      z-index: 2; */
	text-align: left;
}

.img-main {
	width: 100%;
	max-width: auto;
	height: 100%;
	margin-left: auto;
	margin-right: auto;
	border: 1px solid black;
	border-radius: 10px;
}

.p-over {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	min-width :300px;
	max-height: 400px;
	height: 20px;
}

.img-blind{
	opacity: 0.9;
    filter: alpha(opacity=40); /* For IE8 and earlier */
}
</style>
<jsp:include page="./header.jsp"></jsp:include>
<body>

	<div class="container">

		<div class="img">
			<img class="img-main img-blind" src="../img/oppaHomePageImg/성준커플.jpg">
			<div class="content">
				<div class="img-cover">
				</div>
					<h1>개인프로젝트 포트폴리오</h1>
					<p>주제 : 신개념 부산여행가이드 플랫폼</p>
					<p>(관리자계정)ID : admin</p>
					<p>(샘플계정) abc+숫자  ex)abc0..abc999</p>
					<p>모든계정 비밀번호 : 1234</p>
			</div>
		</div>
	</div>
	<hr>
	<div class="container">
		<div class="row pricing">
			<div class="col-md-6">
				<div class="single-blog-item">
					<div class="blog-thumnail">

						<c:choose>
							<c:when test="${not empty memberVO.image}">
								<a href="/model/oppa?modelNum=${memberVO.model}"><img
									class="img-blog" src="../img/${memberVO.id}/${memberVO.image}"></a>
							</c:when>
							<c:otherwise>
								<a href="/model/oppa?modelNum=${memberVO.model}"><img
									class="img-blog" src="../img/oppaHomePageImg/noimage.png"></a>
							</c:otherwise>
						</c:choose>

					</div>
					<div class="blog-content">
						<h4>
							<a href="/model/oppa?modelNum=${memberVO.model}">${memberVO.name}</a>
						</h4>
						<p class="p-over">${memberVO.intro}</p>
						<a href="/model/oppa?modelNum=${memberVO.model}"
							class="more-btn">View More</a>
					</div>
					<span class="blog-date">추천 Oppa!</span>
				</div>
			</div>
			<div class="col-md-6">
				<div class="single-blog-item">
					<div class="blog-thumnail">
						<c:choose>
							<c:when test="${not empty blogVO.b_image}">
								<a href="/blog/detail?b_num=${blogVO.b_num}"><img
									class="img-blog" src="../img/${blogVO.b_id}/${blogVO.b_image}"></a>
							</c:when>
							<c:otherwise>
								<a href="/blog/detail?b_num=${blogVO.b_num}"><img
									class="img-blog" src="../img/oppaHomePageImg/noimage.png"></a>
							</c:otherwise>
						</c:choose>

					</div>
					<div class="blog-content">
						<h4 class="p-over">
							<a href="/blog/detail?b_num=${blogVO.b_num}">${blogVO.b_title}</a>
						</h4>
						<p class="p-over">${blogVO.b_content}</p>
						<a href="/blog/detail?b_num=${blogVO.b_num}" class="more-btn">View
							More</a>
					</div>
					<span class="blog-date">추천 게시글!</span>
				</div>
			</div>
		</div>
	</div>

	<hr>

	<div class="page-header">
		<h1>Notice</h1>
		<br>
	</div>

	<div class="container">
		<div class="row pricing">
			<div class="col-md-6">
				<div class="well">
					<h3>
						<b>'오빠'들은 어떠한 사람들인가요?</b>
					</h3>
					<hr>
					<p>
						<b>부산에 거주하고 있는 사람들로 선별합니다.</b>
					</p>
					<hr>
					<p>
						<b>본인의 의사로 선택할 수 있습니다.</b>
					</p>
					<hr>
					<p>
						<b>한국어가 되지 않아도 이용할 수 있습니다.</b>
					</p>
					<hr>
					<p>
						<b>부산오빠는 가명을 사용합니다.</b>
					</p>
					<hr>
					<p>
						<b>한번의 데이트에 한 명의 오빠만을 이용할 수 있습니다.</b>
					</p>
					<hr>
					<a href="/model&book" class="btn btn-primary">Select
						A Oppa</a>
				</div>
			</div>
			<div class="col-md-6">
				<div class="well">
					<h3>
						<b>나도 '오빠'가 될 수 있나요?</b>
					</h3>
					<hr>
					<p>
						<b>23살 ~ 32살까지 지원가능합니다.</b>
					</p>
					<hr>
					<p>
						<b>하나이상의 외국어를 할 수 있어야합니다.</b>
					</p>
					<hr>
					<p>
						<b>외국인 친구를 사귀고 싶다면 신청하면 됩니다.</b>
					</p>
					<hr>
					<p>
						<b>거주지가 부산이 아니면 심사를 통과하기 어렵습니다.</b>
					</p>
					<hr>
					<p>
						<b>친절하고 상냥한 부산남성이라면 가능합니다.</b>
					</p>
					<hr>
					<a href="/model&book" class="btn btn-primary">JoinNow!</a>
				</div>
			</div>
		</div>
	</div>
</body>
<jsp:include page="./footer.jsp"></jsp:include>
