<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v3.8.5">
<title>Blog Template · Bootstrap</title>

<!-- ajax 통신 -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">
<!-- Bootstrap core CSS -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<!-- Custom styles for this template -->
<link
	href="https://fonts.googleapis.com/css?family=Playfair+Display:700,900"
	rel="stylesheet">
<!-- Custom styles for this template -->
<!--     <link href="blog.css" rel="stylesheet"> -->
<!-- font 사용 -->
<link href="https://fonts.googleapis.com/css?family=Monoton"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Monoton|Saira"
	rel="stylesheet">
<!-- /font -->
<!--   아이콘사용 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
	integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay"
	crossorigin="anonymous">
<!--     <script src="/docs/4.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-zDnhMsjVZfS3hiP7oCBRmfjkQC4fzxVxFhBx8Hkz2aZX8gEvA/jsP3eXRCvzTofP" crossorigin="anonymous"></script> -->
<!--     <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
	crossorigin="anonymous"></script>
<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.5.0/css/all.css'
	integrity='sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU'
	crossorigin='anonymous'>
<script type="text/javascript">
$(function(){
	$.ajax({
		type:"POST",
		url:"/model/bookDelete",
		success:function(num){
		},
		error:function(){
			alert('통신실패');
		}
	});
	});
</script>
<meta charset="UTF-8">
<title>Oppa Project</title>
<!-- 	<link rel="stylesheet" type="text/css" href="../../css/header.css" /> -->
<!-- 	<link rel="stylesheet" type="text/css" href="../../css/tabMenu.css" /> -->
<style type="text/css">
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.mono {
	font-family: 'Monoton', cursive;
	font-size: 30px;
}

.monoton {
	font-family: 'Saira', sans-serif;
	font-size: 18px;
}

.cs {
	text-align: center;
	margin-left: auto;
	margin-right: auto;
}
/* 	헤더부분 css */

/* body { */
/*   display: flex; */
/*   align-items: center; */
/*   height: 100vh; */
/*   background: #fefefe; */
/* } */
a {
	outline: 0;
	text-decoration: none;
}

.navigation {
	width: 100%;
	border-bottom: 3px solid #ccd7d7;
	font-family: 'Pathway Gothic One', sans-serif;
	font-size: 22px;
}

.menu {
	display: flex;
	justify-content: center;
	max-width: 1150px;
	margin: 0 auto;
	padding-left: 0;
}

.menu__item {
	display: inline-block;
	white-space: nowrap;
}

@media screen and (max-width: 480px) {
	.menu__item:nth-child(n + 3) {
		display: none;
	}
	.menu__item:nth-child(2) .menu__link {
		border-right: 0;
	}
}

@media screen and (max-width: 768px) {
	.menu__item:nth-child(n + 4) {
		display: none;
	}
	.menu__item:nth-child(3) .menu__link {
		border-right: 0;
	}
}

@media screen and (max-width: 992px) {
	.menu__item:nth-child(n + 5) {
		display: none;
	}
	.menu__item:nth-child(4) .menu__link {
		border-right: 0;
	}
}

.menu__item:last-child .menu__link {
	border-right: 0;
}

.menu__link {
	display: block;
	padding: 6px 30px 3px;
	border-right: 2px dotted #ccd7d7;
}

.menu__link:hover .menu__first-word, .menu__link:focus .menu__first-word
	{
	transform: translate3d(0, -105%, 0);
}

.menu__link:hover .menu__second-word, .menu__link:focus .menu__second-word
	{
	transform: translate3d(0, 105%, 0);
}

@media screen and (min-width: 768px) {
	.menu__link {
		padding: 6px 40px 3px;
	}
}

.menu__title {
	display: inline-block;
	overflow: hidden;
}

.menu__first-word, .menu__second-word {
	display: inline-block;
	position: relative;
	transition: transform .3s;
}

.menu__first-word::before, .menu__second-word::before {
	position: absolute;
	content: attr(data-hover);
}

.menu__first-word {
	color: #0c8040;
}

.menu__first-word::before {
	top: 105%;
	color: #626262;
}

.menu__second-word {
	color: #626262;
}

.menu__second-word::before {
	bottom: 105%;
	color: #0c8040;
}

.btn_font_size {
	max-height: 38px;
	max-width: 80px;
	font-size: 15px;
}

/*  추가 */
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

/* 네비 탭메뉴 css */
</style>
</head>
<body>
	<div class="container">
		<header class="blog-header py-3 px-md-5">
			<div
				class="row flex-nowrap justify-content-between align-items-center">
				<div class="col-4 pt-1">

					<img alt="로고" src="../img/oppaHomePageImg/부산오빠아이콘.png" height="70"
						width="70">
				</div>
				<div class="col-4 text-center">
					<a class="mono" href="/main">Busan Oppa</a>
				</div>
				<div class="col-4 d-flex justify-content-end align-items-center">
					<c:choose>
						<c:when test="${not empty id}">
							<div class="button-group" role="group">
								<button id="btnGroupDrop1" type="button"
									class="btn btn-primary dropdown-toggle btn_font_size"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">User</button>
								<div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
									<a class="dropdown-item" href="/member/logout">Logout</a>
									<a class="dropdown-item" href="/member/myPage">MyPage</a>
									<c:if test="${id eq 'admin'}">
										<a class="dropdown-item" href='/admin/dashBoard'>관리자
											메뉴</a>
									</c:if>
									<%-- 						<c:if test="${model ne '0'}"> --%>
									<!-- 							<a class="dropdown-item" href="/oppa/model/oppa">Oppa</a> -->
									<%-- 						</c:if> --%>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="button-group" role="group">
								<button id="btnGroupDrop1" type="button"
									class="btn btn-primary dropdown-toggle btn_font_size"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">Sign Up</button>
								<div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
									<a class="dropdown-item" href="/member/add">Join</a> <a
										class="dropdown-item" href="/member/login">Login</a>
								</div>
							</div>

						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</header>
		<hr>
		<!-- <div class="nav-scroller py-1 mb-2"> -->
		<!-- 	<nav class="nav d-flex justify-content-between"> -->
		<nav class="navigation">
			<ul class="menu">
				<li class="menu__item"><a href="/main"
					class="menu__link"> <span class="menu__title"> <span
							class="menu__first-word" data-hover="About"> About </span> <span
							class="menu__second-word" data-hover="Me"> Me </span>
					</span>
				</a></li>

				<li class="menu__item"><a href="/model/main"
					class="menu__link"> <span class="menu__title"> <span
							class="menu__first-word" data-hover="Meet"> Meet </span> <span
							class="menu__second-word" data-hover="Oppa"> Oppa </span>
					</span>
				</a></li>

				<li class="menu__item"><a href="/qna/main"
					class="menu__link"> <span class="menu__title"> <span
							class="menu__first-word" data-hover="Ask"> Ask </span> <span
							class="menu__second-word" data-hover="Answer"> Answer </span>
					</span>
				</a></li>

				<li class="menu__item"><a href="/blog/main"
					class="menu__link"> <span class="menu__title"> <span
							class="menu__first-word" data-hover="Our"> Our </span> <span
							class="menu__second-word" data-hover="Story"> Story </span>
					</span>
				</a></li>
			</ul>
		</nav>
		<!-- 	</nav> -->
		<!-- </div>	 -->

	</div>
	<!-- 첫번째 div container -->
	<br>