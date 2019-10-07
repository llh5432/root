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
<style>
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
						<form action="update" method="post">
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
								<label for="email" class="col-4 col-form-label">Email*</label>
								<div class="col-8">
									<input id="email" name="email" placeholder="Email"
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
									<textarea id="textarea" name="intro" cols="40" rows="4"
										class="form-control">${memberVO.intro}</textarea>
									<span><em></em> / 150</span>
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

	$('textarea').on('keyup', function(){
	    // 남은 글자 수를 구한다.

	var letterLength = $(this).val().length;
    var remain = 150 - letterLength;
    $('em').html(remain);
	    if(remain < 0){
	    	$(".submit").prop("disabled", true);
	    	$("span > em").addClass("warning");
	    }else{
	    	$(".submit").prop("disabled", false);
	    }
	    // 문서 객체에 입력한다.
	    
	});

</script>