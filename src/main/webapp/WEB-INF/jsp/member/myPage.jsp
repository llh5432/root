<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@include file="../header.jsp"%>
<style>
/* body { */
/*   color: #6a6c6f; */
/*   background-color: #f1f3f6; */
/*   margin-top: 30px; */
/* } */
.container {
	max-width: 960px;
}

.table>tbody>tr.active>td, .table>tbody>tr.active>th, .table>tbody>tr>td.active,
	.table>tbody>tr>th.active, .table>tfoot>tr.active>td, .table>tfoot>tr.active>th,
	.table>tfoot>tr>td.active, .table>tfoot>tr>th.active, .table>thead>tr.active>td,
	.table>thead>tr.active>th, .table>thead>tr>td.active, .table>thead>tr>th.active
	{
	background-color: #fff;
}

.table-bordered>tbody>tr>td, .table-bordered>tbody>tr>th,
	.table-bordered>tfoot>tr>td, .table-bordered>tfoot>tr>th,
	.table-bordered>thead>tr>td, .table-bordered>thead>tr>th {
	border-color: #e4e5e7;
}

.table tr.header {
	font-weight: bold;
	background-color: #fff;
	cursor: pointer;
	-webkit-user-select: none;
	/* Chrome all / Safari all */
	-moz-user-select: none;
	/* Firefox all */
	-ms-user-select: none;
	/* IE 10+ */
	user-select: none;
	/* Likely future */
}

.table tr:not (.header ) {
	display: none;
}

}
</style>
<div class="container mt-3 cs">

	<h3>My Page</h3>
	<br>
	<ul class="nav nav-tabs nav-justified">
		<li class="nav-item"><a class="nav-link" href="#ask">문의내역</a></li>
		<c:if test="${memberVO.model eq null}">
			<li class="nav-item"><a class="nav-link" href="#update">회원정보</a></li>
		</c:if>
		<c:if test="${memberVO.model ne null}">
			<li class="nav-item"><a class="nav-link" href="#updateOppa">OPPA
					프로필</a></li>
		</c:if>
		<li class="nav-item"><a class="nav-link" href="#delete">회원삭제</a></li>
		<li class="nav-item"><a class="nav-link" href="#book">예약내역</a></li>
	</ul>

	<div class="tab-content">

		<!-- 문의내역 -->
		<div id="ask" class="container tab-pane fade">
			<br>
			<div class="container">
				<%@include file="qlistForm.jsp"%>
			</div>
		</div>

		<!-- 회원정보 -->
		<div id="update" class="container tab-pane fade">
			<br>
			<div class="container">
				<%@include file="update.jsp"%>
			</div>
		</div>

		<!-- 회원정보 -->
		<div id="updateOppa" class="container tab-pane fade">
			<br>
			<div class="container">
				<%@include file="updateOppa.jsp"%>
			</div>
		</div>

		<!-- 회원삭제 -->
		<div id="delete" class="container tab-pane fade">
			<br>
			<div class="container">
				<%@include file="delete.jsp"%>
			</div>
		</div>

		<!-- 예약확인 -->
		<div id="book" class="container tab-pane fade">
			<div class="container">
				<br>
				<%@include file="bookList.jsp"%>
			</div>
		</div>
	</div>
</div>

<script>
$(document).ready(function() {
	$(".nav-tabs a").click(function() {
		$(this).tab('show');
	});

}); 

$(document).ready(function() {
	  //Fixing jQuery Click Events for the iPad
	  var ua = navigator.userAgent,
	    event = (ua.match(/iPad/i)) ? "touchstart" : "click";
	  if ($('.table').length > 0) {
	    $('.table .header').on(event, function() {
	      $(this).toggleClass("active", "").nextUntil('.header').css('display', function(i, v) {
	        return this.style.display === 'table-row' ? 'none' : 'table-row';
	      });
	    });
	  }
	});
</script>

<%@include file="../footer.jsp"%>