<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Footer -->

</body>
<br>
<br>
<footer>
	<div class="footer card bg-light text-dark" style="margin-bottom:0;">
		<div class="card-body text-center" style="text-align: center;">
			<b style="font-size: 18px">Project Website Busan Oppa - 2019 </b>
		</div>
	</div> 
</footer>
</html>
<script>


jQuery(document).ready(function() {
 var contentHeight = jQuery(window).height();
 var footerHeight = jQuery('.footer').height();
 var footerTop = jQuery('.footer').position().top + footerHeight;
 if (footerTop < contentHeight) {
     jQuery('.footer').css('margin-top', 10+ (contentHeight - footerTop) + 'px');
   }
 });
 
</script>