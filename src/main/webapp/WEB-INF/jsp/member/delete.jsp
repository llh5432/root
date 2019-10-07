<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<meta charset="UTF-8">

<form onSubmit="return formChk()" action="delete" method="post">
	<div style="text-align: center">
		<h2>회원탈퇴</h2>
	</div>
	<div class="col-8"
		style="text-align: center; margin-left: auto; margin-right: auto">
		<input class="form-control" type="password" name="passwd"
			placeholder="패스워드를 입력해주세요."> <input class="btn btn-danger"
			type="submit" value="회원삭제">
	</div>
</form>
<script>
	function formChk() {

		var danger = confirm("회원을 탈퇴하시겠습니까?");
		if (danger == true) {
			console.log('오냐고');
			return true;
			console.log('오나??');
		} else if (danger == false) {
			return false;
		}
	}
</script>