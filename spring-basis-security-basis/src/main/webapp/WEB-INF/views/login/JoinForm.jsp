<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#join_btn{
	width: 100%;
    padding-top: 10px;
    padding-bottom: 10px;
    border-radius: 4px;
    background: #E60012;
    color: white;
    border: #E60012;
    font-size: 20px;
}
</style>
<body>
	<%@ include file="../header.jsp"%>
	<div class="wrapper">
		<form action="create" method="post">
			<div class="form-signin">
				<h2 class="form-signin-heading textCenter">Sign Up</h2>
				<input type="text" class="form-control" id="userId" name="userId" /> <br>
				<input type="password" class="form-control" id="userPassword" name="userPassword"/> <br>
				<input type="submit" value="signUp" id="join_btn"><br><br>
				<a href="mail_content">이메일인증</a> 
			</div> 
		</form>
	</div>
	<%@ include file="../footer.jsp"%>  
</body>
</html>
