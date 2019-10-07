<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<style>
body {
	margin-top: 20px;
	background: #FAFAFA;
}

.order-card {
	color: #fff;
}

.bg-c-blue {
	background: linear-gradient(45deg, #4099ff, #73b4ff);
}

.bg-c-green {
	background: linear-gradient(45deg, #2ed8b6, #59e0c5);
}

.bg-c-yellow {
	background: linear-gradient(45deg, #FFB64D, #ffcb80);
}

.bg-c-pink {
	background: linear-gradient(45deg, #FF5370, #ff869a);
}

.bg-c-gray {
	background: linear-gradient(45deg, #999999, #aebfbf);
}

.bg-c-purple {
	background: linear-gradient(45deg, #990099, #9d2aa8);
}

.bg-c-brown {
	background: linear-gradient(45deg, #993333, #cc680c);
}

.bg-c-red {
	background: linear-gradient(45deg, #FF0000, #bf1619);
}

.bg-c-lime {
	background: linear-gradient(45deg, #00FF00, #3fe216);
}

.card {
	border-radius: 5px;
	-webkit-box-shadow: 0 1px 2.94px 0.06px rgba(4, 26, 55, 0.16);
	box-shadow: 0 1px 2.94px 0.06px rgba(4, 26, 55, 0.16);
	border: none;
	margin-bottom: 30px;
	-webkit-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
}

.card .card-block {
	padding: 25px;
}

.order-card i {
	font-size: 26px;
}

.f-left {
	float: left;
}

.f-right {
	float: right;
}

.p-over {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 220px;
	height: 38px;
}
</style>
<jsp:include page="main.jsp"></jsp:include>

<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4"> <br>
<h2>Dash Board</h2>
<div class="container">
	<div class="row">

		<div class="col-md-3 col-xl-3">
			<div class="card bg-c-blue order-card">
				<div class="card-block">
					<h6 class="m-b-20">총 회원 수</h6>
					<h2 class="text-right">
						<i class="fas fa-address-book"></i><span>${countMember}</span>
					</h2>
					<p class="m-b-0">
						<a href="/admin/customers">회원정보 바로가기</a>
					</p>
				</div>
			</div>
		</div>

		<div class="col-md-3 col-xl-3">
			<div class="card bg-c-green order-card">
				<div class="card-block">
					<h6 class="m-b-20">총 접속 수</h6>
					<h2 class="text-right">
						<i class="far fa-hand-point-up"></i><span>${sumVisitor}</span>
					</h2>
					<p class="m-b-0">일일 접속자 수 : ${countVisitor}</p>
				</div>
			</div>
		</div>

		<div class="col-md-3 col-xl-3">
			<div class="card bg-c-yellow order-card">
				<div class="card-block">
					<h6 class="m-b-20">총 직원 수</h6>
					<h2 class="text-right">
						<i class="fas fa-user-tie"></i><span>${countPlayer}</span>
					</h2>
					<p class="m-b-0">
						<a href="/admin/oppaList">오빠직원 바로가기</a>
					</p>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-3 col-xl-3">
			<div class="card bg-c-pink order-card">
				<div class="card-block">
					<h6 class="m-b-20">총 문의 수</h6>
					<h2 class="text-right">
						<i class="fas fa-question-circle"></i><span>${countQna}</span>
					</h2>
					<p class="m-b-0">
						<a href="/admin/qna">문의글 바로가기</a>
					</p>
				</div>
			</div>
		</div>

		<div class="col-md-3 col-xl-3">
			<div class="card bg-c-gray order-card">
				<div class="card-block">
					<h6 class="m-b-20">총 수익</h6>
					<h2 class="text-right">
						<i class="fas fa-won-sign"></i><span>${countTotal}</span>
					</h2>
					<p class="m-b-0">오늘 총 수익 : ${countSumTodayTotal}</p>
				</div>
			</div>
		</div>

		<div class="col-md-3 col-xl-3">
			<div class="card bg-c-purple order-card">
				<div class="card-block">
					<h6 class="m-b-20">총 블로그 수</h6>
					<h2 class="text-right">
						<i class="fas fa-blog"></i><span>${countBlog}</span>
					</h2>
					<p class="m-b-0">
						<a href="/admin/blog">게시판정보 바로가기</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="row">
		<div class="col-md-3 col-xl-3">
			<div class="card bg-c-brown order-card">
				<div class="card-block">
					<h6 class="m-b-20">가장 많은 Like 모델</h6>
					<h2 class="text-right">
						<i class="fas fa-user-astronaut"></i><span>${maxLikeModel}</span>
					</h2>
					<p class="m-b-0">Total Like : ${countMaxModelLike}</p>
				</div>
			</div>
		</div>

		<div class="col-md-3 col-xl-3">
			<div class="card bg-c-red order-card">
				<div class="card-block">
					<h6 class="m-b-20">가장 많은 Like 게시물</h6>
					<h2 class="text-right p-over">
						<i class="fas fa-clipboard-list"></i><span>${maxLikeBlog}</span>
					</h2>
					<p class="m-b-0">Total Like : ${countMaxBlogLike}</p>
				</div>
			</div>
		</div>

		<div class="col-md-3 col-xl-3">
			<div class="card bg-c-lime order-card">
				<div class="card-block">
					<h6 class="m-b-20">총 예약수</h6>
					<h2 class="text-right">
						<i class="fas fa-book"></i><span>${countBook}</span>
					</h2>
					<p class="m-b-0">
						<a href="/admin/bookList">예약정보 바로가기</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
</main>
<jsp:include page="footer.jsp"></jsp:include>