<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>Header</title>
	<script src="http://code.jquery.com/jquery-latest.js"></script> 
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<link href="<c:url value = "resources/css/header.css?ver=12/"/>"	rel="stylesheet">
</head>  
<body>     
	 <!-- header -->
        <div class="head">
		<ul class="logo">
			<li><a href="/basis/"><li><img src=<c:url value="/resources/img/logo.png"/>></li></a>
		</ul>
		<ul class="nav"> 
			<c:if test="${empty user.email}">
				<li> 
		           <a href="login">로그인</a> 
		        </li>
			 	<li>
					<a href="join_content">회원가입</a>
				</li> 
				<li>   
		           <a href="">고객센터</a>
		        </li>    
		        <li>    
		           <a href="" title="검색">
		             <i class="fa fa-search" aria-hidden="true"></i>
		           </a>
		        </li>
	        </c:if>
	        <!-- 로그인 한 경우 -->
			<c:if test="${user.type eq 1}">
			   <li>${user.name}님</li> 
               <li>
               		<a href="mypage">마이페이지</a>
               </li>
               <li> 
	           		<a href="#" id="logo">로그아웃</a> 
	           </li>
	           <li> 
	           		<a href="#">고객센터</a> 
	           </li> 
		    </c:if>
		</ul> 
	</div>  
    <div class="menu"> 
       <ul class="store">
          <li><a href="brand" class="menu-bottom">BRANDS</a></li>
          <li><a href="" class="menu-bottom">SHOP</a></li> 
          <li><a href="" class="menu-bottom">TOP100</a></li>
          <li><a href="" class="menu-bottom">SALE</a></li> 
          <li><a href="uploadForm" class="menu-bottom">UPLOAD</a></li>
       </ul>  
    </div> 

<script type="text/javascript">
	$('#logo').click(function () {  
	    alert("로그아웃 되었습니다.");
	     
	    location.href  ="logout" 
	    return false;
	});  
</script>

</body> 
</html>