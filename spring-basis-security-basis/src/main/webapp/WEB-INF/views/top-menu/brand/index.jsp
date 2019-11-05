<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8"> 
	<title>브랜드</title>
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<link href="<c:url value = "resources/css/brand/index.css?ver=19/"/>"	rel="stylesheet">  
</head>   
<style>  
	.logo_img:hover {    
		opacity: .5;   
	}      
	a{
		text-decoration:none;
	} 
</style>     
<body>        
<%@ include file="../../header.jsp"%>
 
	<div class="wrapper">  
		<h1 class="top-title">BRANDS</h1> 
		<div class="brand-content">
			<a href="nike"><img class="logo_img" src=<c:url value="/resources/img/brand-nike.jpg"/>></a>
			<a href="adidas"><img class="logo_img" src=<c:url value="/resources/img/brand-adidas.jpg"/>></a>
			<a href="puma"><img class="logo_img" src= <c:url value="/resources/img/brand-puma.jpg"/>></a>
			<a href="fila"><img class="logo_img" src=<c:url value="/resources/img/brand-fila.jpg"/>></a>
			<a href="lacoste"><img class="logo_img" src=<c:url value="/resources/img/brand-lacoste.jpg"/>></a>  
			
			<ul class="alph-search">
				<li><a href="" style="border: 1px solid #282828">ALL</a></li>
				<li><a href="">A</a></li> 
				<li><a href="">B</a></li>   
				<li><a href="">C</a></li>
				<li><a href="">D</a></li>
				<li><a href="">E</a></li>
				<li><a href="">F</a></li>
				<li><a href="">G</a></li> 
				<li><a href="">H</a></li> 
				<li><a href="">I</a></li> 
				<li><a href="">J</a></li> 
				<li><a href="">K</a></li>
				<li><a href="">L</a></li>
				<li><a href="">M</a></li>
				<li><a href="">N</a></li> 
				<li><a href="">O</a></li>  
				<li><a href="">P</a></li>
				<li><a href="">Q</a></li>
				<li><a href="">R</a></li>
				<li><a href="">S</a></li>
				<li><a href="">T</a></li>
				<li><a href="">U</a></li>
				<li><a href="">V</a></li>
				<li><a href="">W</a></li>
				<li><a href="">X</a></li>
				<li><a href="">Y</a></li>
				<li><a href="">Z</a></li>
			</ul>
			<ul class="bottom-logo">
				<li>
					<a href="">
						<img class="bottom-img" src=<c:url value="/resources/img/brand-bottom/2AT_LOGO.jpg"/>>
					</a>
				</li>
				<li>
					<a href="">
						<img class="bottom-img" src=<c:url value="/resources/img/brand-bottom/AD_LOGO.jpg"/>>
					</a>
				</li>
				<li>
					<a href="">
						<img class="bottom-img" src=<c:url value="/resources/img/brand-bottom/BD_LOGO.jpg"/>>
					</a>
				</li>
				<li>   
					<a href="">
						<img class="bottom-img" src=<c:url value="/resources/img/brand-bottom/BM_LOGO.jpg"/>>
					</a>
				</li>
				<li>   
					<a href="">
						<img class="bottom-img" src=<c:url value="/resources/img/brand-bottom/BS_LOGO.jpg"/>>
					</a>
				</li>
				<li>
					<a href="">
						<img class="bottom-img" src=<c:url value="/resources/img/brand-bottom/CV_LOGO.jpg"/>>
					</a>
				</li>
				<li>
					<a href="">
						<img class="bottom-img" src=<c:url value="/resources/img/brand-bottom/FILA_LOGO.png"/>>
					</a>
				</li>
				<li>
					<a href="">
						<img class="bottom-img" src=<c:url value="/resources/img/brand-bottom/FT_LOGO.jpg"/>>
					</a>
				</li>
				<li>
					<a href="">
						<img class="bottom-img" src=<c:url value="/resources/img/brand-bottom/GA_LOGO.png"/>>
					</a>
				</li>
				<li>
					<a href="">
						<img class="bottom-img" src=<c:url value="/resources/img/brand-bottom/HP_LOGO.jpg"/>>
					</a>
				</li>
				<li>
					<a href="">
						<img class="bottom-img" src=<c:url value="/resources/img/brand-bottom/KD_LOGO.jpg"/>>
					</a>
				</li>
				<li>
					<a href="">
						<img class="bottom-img" src=<c:url value="/resources/img/brand-bottom/LA_LOGO.png"/>>
					</a>
				</li>
				<li>
					<a href="">
						<img class="bottom-img" src=<c:url value="/resources/img/brand-bottom/NB_LOGO.jpg"/>>
					</a>
				</li>
				<li>
					<a href="">
						<img class="bottom-img" src=<c:url value="/resources/img/brand-bottom/NK_LOGO.jpg"/>>
					</a>
				</li>
				<li>
					<a href="">
						<img class="bottom-img" src=<c:url value="/resources/img/brand-bottom/PU_LOGO.jpg"/>>
					</a>
				</li>
				<li>
					<a href="">
						<img class="bottom-img" src=<c:url value="/resources/img/brand-bottom/TE_LOGO.jpg"/>>
					</a>
				</li>
				<li>
					<a href="">
						<img class="bottom-img" src=<c:url value="/resources/img/brand-bottom/TH_LOGO.jpg"/>>
					</a>
				</li>
				<li>
					<a href="">
						<img class="bottom-img" src=<c:url value="/resources/img/brand-bottom/WV_LOGO.jpg"/>>
					</a>
				</li>
			</ul>
		</div> 
	</div> 
<%@ include file="../../footer.jsp"%>	
</body> 
</html>