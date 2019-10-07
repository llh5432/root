<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 	아이콘사용 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
   <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>
$(function(){
	$.ajax({
		type:"POST",
		url:"/model/bookDelete",
		success:function(num){
		},
		error:function(){
			alert('통신실패');
		}
	});
	});
</script>
<style>
.center-text {
	text-align: center;
}
body{margin-top:20px;}
</style>
  <title>Admin Dashboard</title>
  </head>
  <body>

	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container-fluid">
        <div class="navbar-header">
          <a class="navbar-brand" href="/admin/dashBoard">관리자 페이지</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="/main">홈으로</a></li>
          </ul>
        </div>
      </div>
	</nav>

<div class="container-fluid">
      
      <div class="row">
        
         <div class="col-sm-3 col-md-2 sidebar-offcanvas" id="sidebar" role="navigation">

				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link active"
						href="/admin/dashBoard"> <span data-feather="home"></span>
							Dashboard
					</a></li>
					<li class="nav-item"><a class="nav-link active"
						href="/admin/dashBoard"> <span data-feather="home"></span>
							Dashboard
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/admin/customers"> Customers </a></li>
					<li class="nav-item"><a class="nav-link"
						href="/admin/qna"> QnA </a></li>
					<li class="nav-item"><a class="nav-link"
						href="/admin/submit"> Submit </a></li>
					<li class="nav-item"><a class="nav-link"
						href="/admin/oppaList"> <span data-feather="bar-chart-2"></span>
							Oppas List
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/admin/blog"> <span data-feather="layers"></span>
							Blog
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/admin/bookList"> <span data-feather="layers"></span>
							Book
					</a></li>
				</ul>

			</div><!--/span-->
        
        <div class="col-sm-9 col-md-10 main">
          
          <!--toggle sidebar button-->
          <p class="visible-xs">
            <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas"><i class="glyphicon glyphicon-chevron-left"></i></button>
          </p>