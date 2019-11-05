<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head> 
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
	<link href="<c:url value = "resources/css/loginForm.css?ver=6/"/>"	rel="stylesheet">
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="wrapper">   
		<div class="form-signin">
			<form action="login_check" method="post" id="form_login">
				<h2 class="form-signin-heading textCenter">회원 로그인</h2>
<!-- 				<input type="text" name="email" class="form-control" id="j_username"  placeholder="Email"><br> -->
<!-- 				<input type="password" name="password" class="form-control" id="j_password" placeholder="Password"><br /> -->
				
				<input type="text" name="email" class="form-control" id="j_username"  placeholder="Email"><br>
				<input type="password" name="password" class="form-control" id="j_password" placeholder="Password"><br />
				<input type="submit" id="btn_login" value="로그인" >   
			</form> 
		</div>
	</div>
	<%@ include file="../footer.jsp"%>  
<script type="text/javascript">

$("#btn_login").on("click",function(){
	
	$("#form_login").submit();
	
});

</script>

</body>
</html>
