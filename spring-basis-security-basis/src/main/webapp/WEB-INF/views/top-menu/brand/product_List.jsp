<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>상품목록</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="<c:url value = "resources/css/brand/product_List.css?ver=2/"/>"	rel="stylesheet">
</head>   
<body> 
<%@ include file="../../header.jsp"%>
	<div class="wrapper">
		<div class="top-wrap">
			<p class="top-total">
				<strong>${brand}</strong> <span>(${total})</span>
			</p> 
			<ul class="top-sort">
				<li style="border-bottom:1.5px solid black;">신상품순</li>
				<li>인기순</li>
				<li>할인율순</li>
				<li>낮은가격순</li>
				<li>높은가격순</li>
			</ul>
		</div>
		<c:forEach items="${product_List}" var="list" >
			<ul class="wrapper_ul">    
				<a href="detail?id=${list.id}">   
					<li class="brand">${list.brand}</li>  
					<li class="product">${list.product}</li>   
					<li class="bar">
						<i class="fa fa-minus" aria-hidden="true"></i>
					</li>  
					<li>  
						<img class="img" src=<c:url value="resources/brand_img/${list.thumbnail}"/>>
					</li> 
					<li class="price">
						${list.price}원
						<i class="fa fa-heart" aria-hidden="true"></i>
					</li>
				</a>  
			</ul>
		</c:forEach> 
	</div>  
</body>
</html>
