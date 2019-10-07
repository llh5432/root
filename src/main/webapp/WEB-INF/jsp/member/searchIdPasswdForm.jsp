<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../header.jsp"%>

<div class="container mt-3">
	<h1 class="text-center">아이디/비밀번호 찾기</h1>
	<ul class="nav nav-tabs nav-justified">
		<li class="nav-item"><a class="nav-link" href="#searchID">아이디
				찾기</a></li>
		<li class="nav-item"><a class="nav-link" href="#searchPasswd">비밀번호
				찾기</a></li>
	</ul>
	<br>


	<div class="tab-content">


		<!-- 아이디 찾기  -->
		<div id="searchID" class="container tab-pane fade">
			<br>
			<div class="container">
				<form action="emailChk" method="post" id=frm2>
					<div class="form-group">
						이 메 일 <input type="email" name="email" id="email"
							class="form-control"><span id="dupEmailMsg"></span> <input
							type="button" class="btn btn-primary" value="인증번호받기"
							id="emailBtn"><br> <input type="hidden"
							id="checkCode"> 인증코드 <input type="text"
							class="form-control" name="emailCode" id="emailCode"> <input
							type="button" class="btn btn-primary" value=인증 id="codeBtn"><br>
						<br> <input type="submit" class="btn btn-warning" id="next"
							value="다음">
					</div>
				</form>
			</div>
		</div>

		<!-- 비밀번호 찾기  -->
		<div id="searchPasswd" class="container tab-pane fade">
			<br>
			<div class="container">
				<div class="form-group">
					<form action="../mail/mailPwd" method="post" id="frm">
						<input type="text" class="form-control" name="id" id="id"
							placeholder="찾고자하는 아이디를 입력해주세요."><br>
						<span id="dupIdMsg"></span><br>
						<br> <input type="email" class="form-control" name="email"
							id="emailChk" placeholder="이메일 입력"><span id="dupEmg"></span>
						<input type="hidden" id="searchPwd"> <input type="hidden"
							id="hiddenVal"><br>
						<input type="submit" class="btn btn-warning" value="비밀번호 요청">
					</form>
				</div>
				<!-- 			<form action="emailChk" method="post" id=frm33>
				<div class="form-group">
					아이디 <input type="text" class="form-control" name="mb_ID" id="--">
					이 메 일 <input type="email" name="mb_email" id="email" class="form-control">	<br><br>			
					<input type="submit" class="btn btn-warning" id="send" value="인증코드발송">
				</div>
			</form> -->
			</div>
		</div>


	</div>
	<!-- tab-content -->

</div>
<!-- container -->


<script>
	$(function() {
		$(".nav-tabs a").click(function() {
			$(this).tab('show');
		});
	})

	$(function() {
		$('#emailBtn').click(
				function() {

					var email = $('#email').val();
					var result = chkEmail();

					if (result == false) {
						return false;
					} else {

						$.ajax({
							url : '../api/member/chkDupEmail',
							data : {
								email : email
							},
							success : function(result) {

								if (result.count == 0) {// 아이디가 없을경우

									$('#dupEmailMsg').text('가입된 이메일이 아닙니다.')
											.css('color', 'red');
									return false;
								} else { // result.count == 1 이미 아이디가 있을경우
									$('#dupEmailMsg').text('가입된 이메일이 확인되었습니다.')
											.css('color', 'green');
									$.ajax({
										url : '../mail/mail',
										data : {
											email : email
										},
										success : function(result) {
											$('#checkCode').val(result);
											// email 여기서 undefined 로 확인되지만 이메일은 정상발송됨
											alert('발송된 코드를 입력해주세요.')
										}
									});// ajax 끝

								}
							}
						}) // ajax 끝
					} // else의 끝
				}) // emailbtn 클릭이벤트 함수의 끝
	}) // function 함수의 끝

	$(function() {

		$('#codeBtn').click(function() {

			if ($('#emailCode').val() == $('#checkCode').val()) {
				alert('인증되었습니다.');
				$('#codeBtn').val('인증완료');
			} else {
				alert('인증번호가 틀렸습니다.');
			}
		});
	})

	$(function() {
		$('#email').keyup(function() {
			$('#codeBtn').val('인증');
		})
	})

	$(function() {
		// var sss= "sss";
		$('#next').click(function() {

			if ($('#codeBtn').val() != '인증완료') {
				alert('이메일 인증을 해주세요.');
				return false;
			} else {
				location.href = "/oppa/home/main";
			}
		})
	})

	// 비밀번호 찾기
	$(function() {
		$('#id').keyup(
				function() {
					var id = $('#id').val();

					$.ajax({
						url : '../api/member/chkDupId',
						data : {
							id : id
						},
						success : function(result) {
							if (result.count == 1) {
								$('#dupIdMsg').text(
										'가입된 아이디가 확인되었습니다. 이메일을 입력하세요.').css(
										'color', 'green');
							} else {
								$('#dupIdMsg').text('가입된 아이디가 아닙니다.').css(
										'color', 'red');
							}
						}
					});

				});
	})

	$(function() {
		$('#emailChk').blur(function() {
			var email = $('#emailChk').val()
			$.ajax({
				url : '../api/member/chkDupEmail',
				data : {
					email : email
				},
				success : function(result) {
					if (result.count == 0) {
						$('#dupEmg').text('').css('color', 'red');

					}
				}
			})
		})
	})

	$('#frm').submit(function() {

		if ($('#dupIdMsg').val() == '가입된 아이디가 아닙니다.') {
			alert('아이디를 확인해주세요.');
			return false;
		} else if ($('#emailChk').val() == "") {
			alert('메일을 확인해주세요.');
			return false;
		} else {

		}
	});

	$('#frm2').submit(function() {

		if ($('#email').val() == "") {
			alert('이메일을 확인해주세요.');
			return false;
		} else if ($('#emailCode').val() == "") {
			alert('인증코드를 입력해주세요.');
			return false;
		}
	});

	function chkEmail() {

		// 이메일이 적합한지 검사할 정규식
		var reEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;

		var email = document.getElementById("email"); // 이메일

		// 이메일 주소값이 알맞지 않을 시
		if (!check(reEmail, email, "알맞는 이메일주소를 입력해주세요.")) {
			return false;
		}
	}

	// 정규식 함수 호출 메일 
	function check(reEmail, what, message) {
		if (reEmail.test(what.value)) {
			return true;
		}
		//alert(message);

		$('#dupEmailMsg').text(message).css('color', 'red');

		//return false;
	}
</script>

<!-- <script>
//아이디찾기
$(document).ready(function() {
		/* $(".nav-tabs a").click(function() {
		$(this).tab('show'); */		
	
});





</script> -->
<%@include file="../footer.jsp"%>

