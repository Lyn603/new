<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>상품 자세히보기</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<link href="<c:url value = "resources/css/brand/product_detail.css/"/>" rel="stylesheet"> 
</head>  
<script type="text/javascript">  
      $(document).ready(function(){  
        $("#check_module").click(function()
        {  
          var IMP = window.IMP; // 생략가능
          IMP.init('imp47562388'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
 
          IMP.request_pay({
              pg : 'html5_inicis',
              pay_method : 'card',
              merchant_uid : 'merchant_' + new Date().getTime(),
              name : '주문명:결제테스트',
              amount : 1,
              buyer_email : 'iamport@siot.do',
              buyer_name : '홍길동', 
              buyer_tel : '010-1234-5678',
              buyer_addr : '서울특별시 강남구 삼성동', 
              buyer_postcode : '123-456'
          }, function(rsp) {
              if ( rsp.success ) {
                  var msg = '결제가 완료되었습니다.';
                  msg += '고유ID : ' + rsp.imp_uid;
                  msg += '상점 거래ID : ' + rsp.merchant_uid;
                  msg += '결제 금액 : ' + rsp.paid_amount;
                  msg += '카드 승인번호 : ' + rsp.apply_num;
              } else {
                  var msg = '결제에 실패하였습니다.';
                  msg += '에러내용 : ' + rsp.error_msg;
              }

              alert(msg);
          });
      });
    });
</script>
<script>
$(document).ready(function(){   
    $("#purchase").on("click", function() { 
    	if(){
    		alert("선택된 상품이 없습니다.");
    	  	return false;
    	}
	  }); 
    });
</script>
<body> 
<%@ include file="../../header.jsp"%>
	<div class="content">
		<div class="product">
			<div class="left">  
				<ul>
					<li class="brand">${product.brand}</li>
					<li class="name">${product.product}</li>
					<li class="thumbnail">
						<img src=<c:url value="resources/brand_img/${product.thumbnail}"/>>  
					</li> 
					<li class="image">
						<img class="img" src=<c:url value="resources/brand_img/${product.thumbnail}"/>>  
						<img class="img" src=<c:url value="resources/brand_img/${product.img}"/>>  
					</li>
				</ul>
			</div>
			<div class="right">
				<ul class="line-1" style="padding-left:0px;">
					<li class="title">판매가</li> 
					<li class="product-price">${product.price}원</li>
					<input type="hidden" id="product-price" value="${product.price}">  
				</ul><br><br> 
				<ul class="line-2" style="padding-left:0px; border-bottom:1px solid #ddd;">
					<li class="title">카드혜택</li>
					<li class="discount-info">무이자 할부 안내 (?) </li> 
				</ul><br><br>
				<ul class="line-3" style="padding-left:0px; border-bottom:1px solid #ddd;">
					<li class="title">배송비 안내</li>
					<li class="delivery-info">2만원이상 무료배송 | 상품별 개별배송 가능 | 기준배송비:2,500원</li>       
				</ul><br><br>  
				<ul class="line-4" style="padding-left:0px; border-top:1px solid #ddd;"> 
					<li class="title">컬러</li>  
					<li>${product.color}</li>    
				</ul><br>    
				<ul class="line-5" style="padding-left:0px;">  
					<li class="title">사이즈 선택</li> 
					<li>
						<select onchange="sm()">
							<option value="">-----</option>
							<c:forEach var="i" begin="0" end="${sizeList_length}">
								<option>${sizeList[i]}</option>
							</c:forEach>  
						</select> 
					</li>   
				</ul><br><br> 
				<p class="total-pay">  
					<span>총금액 </span><strong  id="results"> 0원 </strong>
				</p>    
				<ul class="purchase"  id="purchase">
					<a href="" id="direct-purchase">
						<li class="pay_red">바로구매하기</li>
					</a> 
					<a href="">  
						<li class="pay"> 
							<img src=<c:url value="resources/img/kko.png"/>>  
						</li>
					</a> 
				</ul>
				<form action="purchase" id="frm">
					<input type="hidden" name="price" id="result" value="">
					<input type="hidden" name="size" id="sizeze" value="">
					<input type="hidden" name="id" id="result" value="${product.id}">
				</form>  
			</div> 
		</div> 
	</div>    
	<button id="check_module" type="button">버튼</button>    
	 
<script type="text/javascript">
	function sm() {
		var fired_button = $("select").val();
		var price = $("#product-price").val()+"원";
		$("#results").text(price);
		$("#sizeze").val(fired_button); 
		$("#result").val(price);  
	}  
	$(function(){
        $('#direct-purchase').click(function(e){
            if ( $("#sizeze").val()==""){
                alert('선택된 상품이 없습니다.');
                return false;
            }  
            else {
            	 document.getElementById('frm').submit();
                 return false;
            }
        });
    });

</script>
</body>     
</html> 