<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>(일반) 회원가입 결과</title>
	
	<link href="<c:url value = "resources/css/joinRes.css?ver=3/"/>" rel="stylesheet">
</head>
<style>
 	.title01{	padding-top:150px;  }
 	#st_name,#st_num{color:#fff;}
</style>
<body>
<%@ include file="../header.jsp"%>

	<div class="incontent">
	  	<h2 class="title01">회원가입</h2>
	  	<div class="stepbox type02">
		    <ul>
		      <li class="step01">
		        <span class="st_num">STEP01</span>
		        <span class="st_name">약관동의</span>
		      </li>
		      <li class="step02">
		        <span class="st_num">STEP02</span>
		        <span class="st_name">정보입력</span>
		      </li>
		      <li class="step03 on">
		        <span class="st_num" id="st_num">STEP03</span>
		        <span class="st_name" id="st_name">가입완료</span>
		      </li>
		    </ul>
		</div>
		
		<h1 class="title02">인증메일을 전송하였습니다</h1>
		<div class="contents">
		    <div>
		      <p><span>${name} </span> 님 회원가입을 축하합니다</p>
		      <p>인증 메일의 링크를 확인하시면 가입이 완료됩니다</p>
		    </div>
		    <a href="/basis"> 
		    	<button class="btn homeBtn" type="button" name="button">홈으로</button>	
		   	</a>
		</div>
	</div>  
<%@ include file="../footer.jsp"%>
</body>
</html>