<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<div class="container">
	
	<form action="qDelete" method="post" name="form">
		<table class="table table-bordered">
			<tr class="header">
				<th>선 택</th>
				<th>게시글번호</th>
				<th>문의유형</th>
				<th>제 목</th>
				<th>작성시간</th>
				<th>답변여부</th>
			</tr>
			<c:forEach items="${myQboard}" var="ask">
				<tr class="header">
					<td>
						<input type="checkbox" name="q_check" id="q_chk"
						value="${ask.q_num}">
					</td>
					<td>
						${ask.q_num}
					</td>
					<td>
						${ask.q_type}
					</td>
					<td>
						<p style="color:blue">${ask.q_title}</p>						
					</td>
					<td>
						<fmt:parseDate var="parsed" value="${ask.reg_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate value="${parsed}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</td>
					<td>
						<c:choose>
							<c:when test="${ask.reply eq 'F'}">답변미완료</c:when>
							<c:otherwise>답변완료</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<!-- 클릭하면 보여지는 내용들 -->
				<tr>
					<td colspan="6">					  
					    <b>나의 문의 내역</b><br>
					    <textarea class="form-control" rows="5" readonly>${ask.q_content}</textarea> 
						<hr>
					    <c:if test="${ask.re_content ne null}">
							<b>관리자 답변 : <fmt:parseDate var="parsed2" value="${ask.re_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
							<fmt:formatDate value="${parsed2}" pattern="yyyy-MM-dd HH:mm:ss"/></b><br>
							<textarea class="form-control" rows="5" readonly> ${ask.re_content} </textarea> 
						</c:if>
					</td>
					
				</tr>

			</c:forEach>
		</table>
	
		<input type="submit" class="btn btn-danger" value="삭제">
	</form>

</div>