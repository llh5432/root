<%@page import="com.example.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<meta charset="UTF-8">
<!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> -->
<!-- <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script> -->
<!-- <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<!------ Include the above in your HEAD tag ---------->
<style type="text/css">
.profile-img .file {
	position: relative;
	overflow: hidden;
	margin-top: -20%;
	width: 70%;
	border: none;
	border-radius: 0;
	font-size: 15px;
	background: #212529b8;
}

.profile-img .file input {
	position: absolute;
	opacity: 0;
	right: 0;
	top: 0;
}

.profile-work {
	padding: 14%;
	margin-top: -15%;
}

.profile-work p {
	font-size: 12px;
	color: #818182;
	font-weight: 600;
	margin-top: 10%;
}

.profile-work a {
	text-decoration: none;
	color: #495057;
	font-weight: 600;
	font-size: 14px;
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
	<div class="col-md-12">
		<div class="card">
			<div class="card-body">
				<div class="row">
					<div class="col-md-12">
						<h4>Your Profile</h4>
						<hr>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<form action="oppaUpdate" method="post" role="form"
							enctype="multipart/form-data">
							<div class="form-group row">
								<div class="profile-img col-4">
									<c:choose>
										<c:when test="${memberVO.image ne null}">
											<img style="max-height: 130px; max-width: 200px;"
												class="img-thumbnail"
												src="../img/${memberVO.id}/${memberVO.image}" alt="프로필 사진" />
											<div class="file btn btn-lg btn-primary">
												Change Photo <input type="file" name="profileImage" />
											</div>
										</c:when>
										<c:otherwise>
											<img style="max-height: 130px; max-width: 200px;"
												class="img-thumbnail"
												src="../img/oppaHomePageImg/noimage.png" alt="프로필 사진" />
											<div class="file btn btn-lg btn-primary">
												Change Photo <input type="file" name="profileImage" />
											</div>
										</c:otherwise>
									</c:choose>

								</div>
								<div class="col-8">
									<div class="profile-work">
										<p>추천 게시물(Our Story)</p>
										<c:choose>
											<c:when test="${not empty myPboard}">
												<c:forEach var="blog" items="${myPboard}">
													<c:set var="count" value="${count + 1}"></c:set>
													<a href="/blog/detail?b_num=${blog.b_num}">${count}.
														${blog.b_title}</a>
													<br />
												</c:forEach>
											</c:when>
											<c:otherwise>
												<p>아직 추천 게시글이 존재하지않습니다!</p>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
							<div class="form-group row">
								<label for="username" class="col-4 col-form-label">Total
									Profit</label>
								<div class="col-8">
									<input placeholder="UserID" class="form-control here"
										required="required" readonly="readonly" type="text"
										value="${total}원">
								</div>
							</div>
							<div class="form-group row">
								<label for="username" class="col-4 col-form-label">Like
									Count</label>
								<div class="col-8">
									<input placeholder="UserID" class="form-control here"
										required="required" readonly="readonly" type="text"
										value="${like}">
								</div>
							</div>
							<div class="form-group row">
								<label for="username" class="col-4 col-form-label">User
									ID</label>
								<div class="col-8">
									<input id="id" name="id" placeholder="UserID"
										class="form-control here" required="required"
										readonly="readonly" type="text" value="${memberVO.id}">
								</div>
							</div>
							<div class="form-group row">
								<label for="name" class="col-4 col-form-label">User Name</label>
								<div class="col-8">
									<input id="name" name="name" placeholder="UserName"
										class="form-control here" type="text" value="${memberVO.name}"
										readonly="readonly">
								</div>
							</div>
							<div class="form-group row">
								<label for="lastname" class="col-4 col-form-label">Password</label>
								<div class="col-8">
									<input name="passwd" placeholder="Password"
										class="form-control here" type="password"
										value="${memberVO.passwd}">
								</div>
							</div>
							<div class="form-group row">
								<label for="select" class="col-4 col-form-label">Country</label>
								<div class="col-8">
									<select name="country" class="custom-select">
										<option value="${memberVO.country}">${memberVO.country}</option>
										<option value="Japan">Japan</option>
										<option value="China">China</option>
										<option value="Taiwan">Taiwan</option>
										<option value="Russia">Russia</option>
										<option value="Brazil">Brazil</option>
										<option value="Australia">Australia</option>
										<option value="America">America</option>
										<option value="Canada ">Canada</option>
										<option value="Korea ">Korea</option>
									</select>
								</div>
							</div>
							<div class="form-group row">
								<label for="select" class="col-4 col-form-label">Language</label>
								<div class="col-8">
									<select name="language" class="custom-select">
										<option value="${memberVO.language}">${memberVO.language}</option>
										<option value="English">English</option>
										<option value="Japanese">Japanese</option>
										<option value="Chinese">Chinese</option>
										<option value="Korean">Korean</option>
									</select>
								</div>
							</div>
							<div class="form-group row">
								<label for="email" class="col-4 col-form-label">Address*</label>
								<div class="col-8">
									<input name="address" placeholder="Address"
										class="form-control here" required="required" type="text"
										value="${memberVO.address}">
								</div>
							</div>
							<div class="form-group row">
								<label for="email" class="col-4 col-form-label">Email*</label>
								<div class="col-8">
									<input name="email" placeholder="Email"
										class="form-control here" required="required" type="text"
										value="${memberVO.email}">
								</div>
							</div>
							<div class="form-group row">
								<label for="website" class="col-4 col-form-label">Job</label>
								<div class="col-8">
									<input name="job" placeholder="Job" class="form-control here"
										type="text" value="${memberVO.job}">
								</div>
							</div>
							<div class="form-group row">
								<label for="website" class="col-4 col-form-label">Phone</label>
								<div class="col-8">
									<input name="phone" placeholder="phone"
										class="form-control here" type="text"
										value="${memberVO.phone}">
								</div>
							</div>
							<div class="form-group row">
								<label for="publicinfo" class="col-4 col-form-label">Public
									Info</label>
								<div class="col-8">
									<textarea name="intro" id="textarea" cols="40" rows="4"
										class="form-control">${memberVO.intro}</textarea>
									<span><em></em> / 100</span>
								</div>
							</div>
							<div class="form-group row">
								<label for="newpass" class="col-4 col-form-label">Join
									Date</label>
								<div class="col-8">

									<input name="join_date" placeholder="Join Date"
										class="form-control here" type="text"
										value="${memberVO.join_date}" readonly="readonly">
								</div>
							</div>
							<div class="form-group row">
								<div class="offset-4 col-6">
									<button name="submit" type="submit"
										class="submit btn btn-primary">Update My Profile</button>
								</div>
							</div>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>

</div>
<script>

$(document).ready(function(){

	$('textarea').on('keyup', function(){
	    // 남은 글자 수를 구한다.

	var letterLength = $(this).val().length;
    var remain = 100 - letterLength;
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