<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
.cs {
	text-align: center;
	margin-left: auto;
	margin-right: auto;
}
</style>
<jsp:include page="joinFormAction.jsp"></jsp:include>
<jsp:include page="../header.jsp"></jsp:include>
<section>
	<h1 class="text-center">회원가입</h1>
	<hr>
	<div class="cs">
		<form action="add" method="post" name="frm" id="frm">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-md-10 mx-auto">
						<div class="post-preview">
							<input class="form-control" required="required" type="text"
								id="id" name="id" placeholder="ID를 입력해주세요"> <span
								id="dupIdMsg"></span><span id="idCheckMsg"></span><br> <input
								class="form-control" required="required" type="password"
								id="passwd" name="passwd" placeholder="패스워드를입력해주세요"> <span
								id="PwdMsg"></span><br> <input class="form-control"
								required="required" type="password" id="passwdDp"
								placeholder="패스워드 확인"> <span id="dupPwdMsg"></span><br>
							<input class="form-control" required="required" type="text"
								id="name" name="name" placeholder="이름을 입력해주세요"> <span
								id="dupNameMsg"></span><br> <select class="form-control"
								required="required" id="country" name="country">
								<option value="">국적을 선택해주세요</option>
								<option value="Japan">Japan</option>
								<option value="China">China</option>
								<option value="Taiwan">Taiwan</option>
								<option value="Russia">Russia</option>
								<option value="Brazil">Brazil</option>
								<option value="Australia">Australia</option>
								<option value="America">America</option>
								<option value="Canada ">Canada</option>
								<option value="Korea ">Korea</option>
							</select> <span id="countryMsg"></span><br> <input
								class="form-control" required="required" type="text"
								id="address" name="address" placeholder="주소를 입력해주세요"><br>
							<br> <select class="form-control" required="required"
								id="lang" name="language">
								<option value="">모국어 외 사용 할 수 있는 외국어를 선택해주세요.</option>
								<option value="없음">없음</option>
								<option value="English">English</option>
								<option value="Japanese">Japanese</option>
								<option value="Chinese">Chinese</option>
								<option value="Korean">Korean</option>
							</select><br>
							<br>

							<p>성별을 선택해주세요</p>
							<input type="radio" id="gender" name="gender" value="female"
								required="required">female <input type="radio"
								id="gender" name="gender" value="male" required="required">male
							<br>
							<br> <input class="form-control" required="required"
								type="text" id="age" name="age" placeholder="나이를 입력해주세요">
							<br> <input class="form-control" required="required"
								type="email" id="email" name="email" placeholder="email을 입력해주세요">
							<span id="EmailMsg"></span> <span id="dupEmailMsg"></span> <input
								required="required" type="button" name="emailBtn" id="emailBtn"
								class="btn btn-primary" value="코드발송"><br>
							<br> <input type="hidden" name="" id="checkCode" value="0">
							<input required="required" type="text" name="emailN" id="code"
								class="form-control" placeholder="인증코드 입력"> <input
								required="required" type="button" id="check_btn"
								class="btn btn-primary" value="인증"><br>
							<br> <input type="hidden" name="" id="email_code"
								class="form-control" value="0"> <input
								class="form-control" required="required" type="text" id="phone"
								name="phone" placeholder="휴대폰번호를 입력해주세요"> <span
								id="dupPhoneMsg"></span><br> <input type="reset"
								class="btn btn-danger float-left" value="Reset"> <input
								type="submit" id="submitBtn" class="btn btn-primary float-right"
								value="Sign Up"><br>
							<br>

						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</section>
<jsp:include page="../footer.jsp"></jsp:include>