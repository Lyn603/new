<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8"> 
	<title>Insert title here</title>
	<link href="<c:url value = "resources/css/brand/purchase-login-check.css?ver=2/"/>"rel="stylesheet">
</head>  
<body>      
<%@ include file="../../header.jsp"%>     
	<div class="purchase-login-check">
		<div class="Sign-in"> 
			<form action="purchase-login-check" method="POST">  
				<h2 class="login-header">회원 로그인</h2> 
				<input type="text" name="email" class="input-email" placeholder="Email">
				<input type="password" name="password" class="input-password" placeholder="Password">
				<input type="hidden" name="size" value="${size}">
				<input type="hidden" name="id" value="${id}">
				<input type="submit" value="로그인" class="submit-login">
			</form>
		</div> 
		<div class="not-login">
			<p class="not-login-header">NON-MEMBER ORDER</p>
			<p class="not-login-info">비회원의 경우   해당버튼을 통해 주문이 가능합니다.</p>
			<a class="not-login-submit" href="">비회원으로 주문하기</a>   
		</div>
	</div>
</body>
</html>