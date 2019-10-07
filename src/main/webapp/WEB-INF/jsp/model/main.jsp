<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../header.jsp"></jsp:include>

<style>
	.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.intro {
	height: 180px;
	font-family: sans-serif;
	font-size: 16px;
	line-height: 1.6;
	max-height: 4.8em;
	overflow: hidden;
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
}

.hname {
	text-align: center;
	margin-left: 0;
	margin-right: 0;
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
<div class="container">

	<section class="jumbotron text-center">
		<div class="container">
			<h1 class="jumbotron-heading">부산오빠를 만나다</h1>
			<p class="lead text-muted">따분한 일상을 벗어나 부산오빠를 만나 즐거운 여행!</p>
			<p class="lead text-muted">맛있는 음식! 재밌는 추억! 을 만들어보세요</p>
			<p class="lead text-muted">9명의 부산오빠들이 여러분들을 기다리고 있습니다!</p>

			<p>
				<a href="#" class="btn btn-primary my-2" data-toggle="modal"
					data-target="#select">부산오빠 선택하기</a> <a href="#"
					class="btn btn-secondary my-2" data-toggle="modal"
					data-target="#submit">부산오빠 지원하기</a>
			</p>
		</div>
	</section>

	<div class="album py-5 bg-light">
		<div class="container">

			<div class="row">
				<c:choose>
					<c:when test="${not empty list}">
						<%--       	<c:set var="no" value="1"/> --%>

						<c:forEach var="item" items="${list}">

							<div class="col-md-4">
								<div class="card mb-4 shadow-sm">

									<c:choose>
										<c:when test="${not empty item.image}">
											<a href="#"><img alt="썸네일"
												src="../img/${item.id}/${item.image}" width="100%"
												height="225"></a>
										</c:when>
										<c:otherwise>
											<svg class="bd-placeholder-img card-img-top" width="100%"
												height="225" xmlns="http://www.w3.org/2000/svg"
												preserveAspectRatio="xMidYMid slice" focusable="false"
												role="img" aria-label="Placeholder: Thumbnail">
												<title>Placeholder</title><rect width="100%" height="100%"
													fill="#55595c" />
												<text x="50%" y="50%" fill="#eceeef" dy=".3em">업데이트 중입니다!</text></svg>
										</c:otherwise>
									</c:choose>
									<div class="card-body">

										<c:choose>
											<c:when test="${empty item.intro}">
												<h3 class="hname">${item.name}</h3>
												<p class="card-text intro">업데이트 중입니다!</p>
											</c:when>
											<c:otherwise>
												<h3 class="hname">${item.name}</h3>
												<p class="card-text intro">${item.intro}</p>
											</c:otherwise>
										</c:choose>
										<div class="d-flex justify-content-between align-items-center">
											<div class="btn-group">
												<button type="button"
													class="btn btn-sm btn-outline-secondary"
													onclick="location.href='oppa?modelNum=${item.model}'">View</button>


											</div>
											<small class="text-muted"> ${item.likes} <i
												class="fas fa-heart"></i></small>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>

					</c:when>
				</c:choose>
			</div>
		</div>
	</div>

</div>
<!-- 오빠 선택하기 -->
<div class="modal fade" id="select">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header">
				<h3 class="modal-title">오빠 선택하기(Select)</h3>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<form name="sub1" id="subForm" enctype="multipart/form-data">
				<div class="modal-body">
					<div class="form-group">
						<select name="model" id="modelNum" class="form-control"
							required="required">
							<option value="">오빠를 선택하세요</option>
							<c:forEach var="oppaNum" items="${list}">

								<option value="${oppaNum.model}">${oppaNum.name}</option>

							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<input type="date" id="date" name="book_date" placeholder="날짜를 선택해주세요" required="required">
						<input type="button" class="btn btn-primary" id="dateBtn" value="예약확인">
						<input type="hidden" class="btn btn-primary" id="dateUpdate" value="예약진행중..">
						<input type="hidden" id="book" name="book" value="F">
					</div>
					<div class="form-group">
						<textarea rows="10" cols="61" id="bookInpor" name="content"
							placeholder="원하시는 여행유형을 상세히 기록해주세요(예: 여행하고싶은 곳, 동행하는 사람의 수, 먹고싶은 음식 등..)"
							required="required"></textarea>
						<span><em></em> / 400</span>
					</div>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-warning float-center" value="되돌리기" id="resetBtn">
					<input type="button" class="submit btn btn-primary float-right" value="예약하기" onclick="return check();">
				</div>
			</form>
		</div>
	</div>
</div>
<!-- 오바선택하기 끝 -->

<!-- 오빠지원하기 -->
<div class="modal fade" id="submit">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header">
				<h3 class="modal-title">오빠 신청하기(Submit)</h3>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<form action="submit" method="post" enctype="multipart/form-data">
				<div class="modal-body">
					<div class="form-group">
						<input type="hidden" name="s_upgrade" value="F"> <input
							type="hidden" name="s_name" value="${name}"> <input
							type="checkbox" name="s_type" value="T" required="required">개인정보
						약관에 동의하시겠습니까?
					</div>
					<div class="form-group">
						<textarea id="submitInpor" rows="10" cols="61" name="s_comment"
							placeholder="자기소개를 적어주세요." required="required"></textarea>
						<span><em></em> / 400</span>
					</div>
				</div>
				<div class="modal-footer">
					<input type="reset" class="btn btn-warning float-center" value="초기화">
					<input type="submit" class="submit btn btn-primary float-right" value="신청하기">
				</div>
			</form>
		</div>
	</div>
</div>
<!-- 오빠지원하기 끝 -->
<jsp:include page="mainAction.jsp"></jsp:include>
<jsp:include page="../footer.jsp"></jsp:include>