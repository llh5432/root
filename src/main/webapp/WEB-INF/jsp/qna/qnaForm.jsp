<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<meta charset="UTF-8">
<jsp:include page="../header.jsp"></jsp:include>
<style>
span{
/*   font-size:150%;  */
  font-weight:bold;  
  color:#777;
}

span em{
  font-style:normal;
}

span em.warning{
  color:#f00;
}
</style>
<br><br>
<div class="container cs">
<h4>자주 묻는 질문들</h4><hr>
<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingOne">
      	<a data-toggle="collapse" data-parent="#accordion" href="#a" aria-expanded="true" aria-controls="collapseOne">
        	Q : [개인프로젝트] 첫번째 질문입니다.
        </a>
      <hr>
    </div>
    <div id="a" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">
        	A : [개인프로젝트] 첫번째 답변입니다.
      </div>
    </div>
    <br>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingTwo">
		<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#b" aria-expanded="false" aria-controls="collapseTwo">
          Q : [개인프로젝트] 두번째 질문입니다.
        </a>
		<hr>
    </div>
    <div id="b" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
      <div class="panel-body">
        A :  [개인프로젝트] 두번째 답변입니다.
      </div>
    </div>
    <br>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingThree">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#c" aria-expanded="false" aria-controls="collapseThree">
          Q : [개인프로젝트] 세번째 질문입니다.
        </a>
      <hr>
    </div>
    <div id="c" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
      <div class="panel-body">
       	 A : [개인프로젝트] 세번째 답변입니다.
      </div>
    </div>
    <br>
  </div>
</div>
<c:choose>
	<c:when test="${empty id}">
		<input class="btn btn-info" type="button" value="1:1문의하기" id="btn">
	</c:when>
	<c:otherwise>
		<input class="btn btn-primary" type="button" value="1:1문의하기" data-toggle="modal" data-target="#write">
	</c:otherwise>
</c:choose>
</div>
<div class="modal fade" id="write">
	<div class="modal-dialog">
		<div class="modal-content">
			
			<div class="modal-header">
				<h3 class="modal-title">문의사항 작성</h3>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<form action="qadd" method="post">
				<div class="modal-body">
					<div class="form-group">
						<select name="q_type" class="form-control" required="required">
							<option value="">문의유형 선택</option>
							<option value="결제/환불">결제/환불</option>
							<option value="회원정보">회원정보</option>
							<option value="모델">모델</option>
							<option value="지역">여행</option>
							<option value="기타">기타</option>
						</select>
					</div>
					<div class="form-group">
						<input type="text" name="q_title" class="form-control" placeholder="제목을 입력하세요" required="required" maxlength="40">
					</div>
					<div class="form-group">
						<textarea rows="10" cols="61" name="q_content" placeholder="친절히 답변드리겠습니다. 문의 할 내용을 입력해주세요." required="required"></textarea>
						<span><em></em> / 500</span>						
					</div>
				</div>
				<div class="modal-footer">
					<input type="reset" class="btn btn-warning float-left" value="초기화">
					<input type="submit" class="submit btn btn-primary float-right" value="문의하기">
				</div>
			</form>
		</div>
	</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
<script>
	$(function(){
		$('#btn').click(function(){
			alert('로그인이 필요한 기능입니다.');
			location.href="/member/login";
			return;
		});
		

		$('textarea').on('keyup', function(){
			    // 남은 글자 수를 구한다.

			var letterLength = $(this).val().length;
		    var remain = 500 - letterLength;
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
