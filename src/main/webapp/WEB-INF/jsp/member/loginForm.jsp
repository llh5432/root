<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<style>
.qq {
	text-align: center;
	margin-left: auto;
	margin-right: auto;
}

.login-container {
	margin-left: auto;
	margin-right: auto;
	margin-top: 5%;
	margin-bottom: 5%;
}

.login-form-1 {
	padding: 5%;
	box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0
		rgba(0, 0, 0, 0.19);
}

.login-form-1 h3 {
	text-align: center;
	color: #333;
}

.login-form-2 {
	padding: 5%;
	background: #0062cc;
	box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0
		rgba(0, 0, 0, 0.19);
}

.login-form-2 h3 {
	text-align: center;
	color: #fff;
}

.login-container form {
	padding: 10%;
}

.btnSubmit {
	width: 50%;
	border-radius: 1rem;
	padding: 1.5%;
	border: none;
	cursor: pointer;
}

.login-form-1 .btnSubmit {
	font-weight: 600;
	color: #fff;
	background-color: #0062cc;
}

.login-form-2 .btnSubmit {
	font-weight: 600;
	color: #0062cc;
	background-color: #fff;
}

.login-form-2 .ForgetPwd {
	color: #fff;
	font-weight: 600;
	text-decoration: none;
}

.login-form-1 .ForgetPwd {
	color: #0062cc;
	font-weight: 600;
	text-decoration: none;
}
</style>

<jsp:include page="../header.jsp"></jsp:include>

<div class="container login-container">

	<div class="col-md-6 login-form-1 qq">
		<h3>Login</h3>
		<form action="login" method="post">
			<div class="form-group">
				<input type="text" name="id" class="form-control" placeholder="ID *" />
			</div>
			<div class="form-group">
				<input type="password" name="passwd" class="form-control"
					placeholder="PASSWORD *" />
			</div>
			<div class="form-group">
				<input type="submit" class="btnSubmit" value="Login" />
			</div>
			<div class="form-group">
				<a href="/searchIdPwd" class="ForgetPwd">Forget
					Password?</a>
			</div>
		</form>
	</div>

</div>
<jsp:include page="../footer.jsp"></jsp:include>