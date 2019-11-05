<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<link href="<c:url value = "resources/css/brand/purchase.css/"/>"rel="stylesheet">
	<link href="<c:url value = "resources/css/brand/purchase_table.css?ver=2/"/>"rel="stylesheet">
</head>
<style>
	.container{
		width:1140px;
		margin:auto;  
		padding-top:200px; 
		padding-bottom:200px;
	}
	.brand-img{
		width:80px;    
		border:1px solid rgba(0,0,0,0.3);   
	} 
	#total-pay,#order-list{
	    width: 1140px;
	    margin: auto;
	    text-align: center;  
	}    
	#check_module{
		      
	} 
</style>
<script type="text/javascript">  
      $(document).ready(function(){  
        $("#check_module").click(function()
        {  
          var IMP = window.IMP; // 생략가능
          IMP.init('imp61834611'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
 
          IMP.request_pay({
              pg : 'html5_inicis',
              pay_method : 'card',
              merchant_uid : 'merchant_' + new Date().getTime(),
              name : '주문명:결제테스트',
              amount : 100,
              buyer_email : 'dbsk5045@naver.com',
              buyer_name : '이유나', 
              buyer_tel : '010-4159-5045',
              buyer_addr : '강원 춘천시 보안길 36 (후평동, 우미린뉴시티) 106동 1805호', 
              buyer_postcode : '24303'
          }, function(rsp) {
              if ( rsp.success ) {
                  alert("결제가 완료되었습니다.");
                  location.href  ="pay_result" 
                  return false; 
              } else {
                  var msg = '결제에 실패하였습니다.';
                  msg += '에러내용 : ' + rsp.error_msg;
              }
  
              alert(msg);
          });
      });
    }); 
</script>    
<body>  
<%@ include file="../../header.jsp"%>    
       
	<div class="container">
		<section>  
		  <!--for demo wrap-->
		  <h1>주문상품 정보</h1>
		  <div class="tbl-header">
		    <table cellpadding="0" cellspacing="0" border="0">
		      <thead>
		        <tr>
		          <th>이미지</th>
		          <th>상품정보</th>
		          <th>옵션</th>
		          <th>판매가</th>
		          <th>수량</th>
		          <th>배송비</th>
		          <th>합계</th>
		        </tr>
		      </thead>
		    </table> 
		  </div>
		  <div class="tbl-content">
		    <table cellpadding="0" cellspacing="0" border="0">
		      <tbody>
		        <tr>
		         <td>
						<img class="brand-img" src=<c:url value="resources/brand_img/${product.thumbnail}"/>>
					</td>
					<td>${product.product}</td>
					<td>${size}</td>
					<td>${product.price}</td>
					<td>1</td>
					<td> - </td>
					<td>${product.price}</td>
		        </tr>
		      </tbody>
		    </table>
		  </div>
		</section>
		
		
		<h1>주문고객 정보</h1>
		<table id="order-info" border="1">
			<tr>     
				<td>주문하시는분</td>
				<td>${allInfo.name}</td>
			</tr> 
			<tr>     
				<td>전화번호</td>
				<td>${allInfo.phone}</td>
			</tr>   
			<tr>     
				<td>이메일</td>
				<td>${allInfo.email}</td>
			</tr>
			<tr>     
				<td>주소</td>
				<td>${allInfo.address}</td>
			</tr> 
		</table>   
		
		<h1>배송지 정보</h1>
		<p>
			<input type="checkbox">
			주문고객 정보와 동일   
		</p>
		<table id="order-info" border="1">
			<tr>     
				<td>주문하시는분</td>
				<td>${allInfo.name}</td>
			</tr> 
			<tr>     
				<td>전화번호</td>
				<td>${allInfo.phone}</td>
			</tr>   
			<tr>     
				<td>이메일</td>
				<td>${allInfo.email}</td>
			</tr>
			<tr>     
				<td>주소</td>
				<td>${allInfo.address}</td>
			</tr>   
			<thead>
				<tr>     
					<td>주문하시는분</td>
					<td>${allInfo.name}</td>
				</tr> 
			</thead>
			<tbody>
			</tbody>  
		</table> 
		 
		<h1>결제금액</h1>
		<table id="total-pay" border="1">
			<thead>
				<tr>     
					<td>총주문금액</td>
					<td>총할인금액</td>
					<td>총결제금액</td>
				</tr> 
			</thead>
			<tbody>
				<tr>     
					<td>${product.price}</td>
					<td> 0 원 </td>
					<td>${product.price}</td>
				</tr> 
			</tbody>    
		</table>   
		
		<div class="payment-select" style="">
			<h1>결제수단 선택</h1>
			<input type="checkbox"> 카카오페이
			<input type="checkbox"> 페이코
			<input type="checkbox"> 토스
		</div>
		<div>
			<button id="check_module" type="button">결제하기</button>  
		</div>
	</div>
</body>
</html>