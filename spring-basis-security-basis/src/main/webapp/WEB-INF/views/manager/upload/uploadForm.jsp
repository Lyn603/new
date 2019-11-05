<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>파일 업로드</title>
	<script src="<c:url value="resources/js/jquery-3.1.0.min.js"/>"></script>
	<script src="<c:url value="resources/js/jquery.form.min.js"/>"></script>
	<script src="<c:url value="resources/js/ChangeAdong.js?ver=10"/>"></script>
	<link href="<c:url value = "resources/css/uploadForm.css/"/>"	rel="stylesheet">
<script type="text/javascript">
//<![CDATA[            
$(function() {      
	$("#btn-upload").on("click", function(){
		if(($("#file1").val() == "" || $("#file1").val() == null)) {
		    alert("파일 첫 번째가 없습니다.");
		} else if(($("#file2").val() == "" || $("#file2").val() == null)) {
		    alert("파일 두 번째가 없습니다.");
		} else {

		   var form = new FormData(document.getElementById('uploadForm'));
		    $.ajax({
			      url: "upload", //컨트롤러 URL
			      data: form,
			      dataType: 'json',
			      processData: false,
			      contentType: false,
			      type: 'POST',
			      success: function (response) {
			    	  alert("success");
			    	  console.log(response);
			      },error: function (jqXHR) {
				       alert(jqXHR.responseText);
			      }
		   });
		}
	});
});
//]]>
</script>
</head>
<style>
	*{
		font-size: 20px;  
	}
	.square{
		padding-top:150px;
	}
	.test{
		border:1px solid red;
		width: 500px;
		margin:auto;
		
	}
	#uploadForm{
		width: 500px;
	    padding-left: 30px;
	    padding-top: 30px;
	    margin: auto;
	}  
	#btn-upload{   
		margin-left: 350px;
    	margin-bottom: 20px;
	}  
	.size{
		width:100px;
	} 
	#input{
		float:left;
	}
	#output{
		float:left;
	}
	#end_output{
		float:left;
	}
	#flow{
		float:left;
		margin-top:0px;
		margin-bottom:0px;
	}
	#unit{
		float:left;
		margin-left: 20px;
    	padding: 3px;
	}
	#con:after{
		content:"";
		display:block;
		clear:both;
	}
	#file1{
		padding-left: 50px;
	}
	#file2{
	    padding-left: 3px;
	    margin-top: 20px;
	    margin-bottom: 20px;
	}
	#productName{
		margin-left: 50px;
	}
</style> 
<body>
<%@ include file="../../header.jsp"%>
	<div class="square">
		<div class="test">
			<form id="uploadForm" enctype="multipart/form-data" method="POST" action="upload">
				<label for="file1">썸네일</label>
				<input type="file" id="file1" name="file" required="required" /><br>
				<label for="file2">설명 이미지</label>
				<input type="file" id="file2" name="file" required="required" /><br>
				상품명 <input type="text" name="product" id="productName"/><br><br>
				<div id="con">
					<select id="input" name="who" style=" padding: 3px;">
						<option id="11680">여자</option>
						<option id="11305">남자</option>
						<option id="11440">아이</option>
						<option selected disabled>대상</option>  
					</select> 
					<div id="output"> 
						<select id='out' style="margin-left: 45px;margin-bottom: 20px;
	   						 margin-right: 10px; padding: 2.4px;">
							<option>----</option>
						</select>
					</div>
					<p id="flow"> ~ </p>
					<div id="end_output">
						<select id='end_out' style="margin-left: 10px;padding: 2.4px;">
							<option>----</option>
						</select>
					</div>
					<select id="unit" name="unit">
						<option value="5">5단위</option>
						<option value="10">10단위</option>
					</select> 
				</div>
				 종류
				<select name="categori" style="margin-left: 69px;padding: 3px;">
				     <option value="running">런닝화</option>
				     <option value="slip-on">슬립온</option>
				     <option value="court">코트</option>
				     <option value="air">에어</option> 
			    </select><br><br>  
				브랜드
				<select name="brand" style="margin-left: 49px;padding: 3px;">
					<option value="NIKE">나이키</option>
					<option value="ADIDAS">아디다스</option>
					<option value="PUMA">퓨마</option>
					<option value="FILA">필라</option>
					<option value="LACOSTE">라코스테</option>
				</select><br><br>
				가격 <input type="text" name="price" style="margin-left: 67px;"><br><br>
				색상 
				<select name="color" style="margin-left: 66px;padding: 3px;">
					<option>바탕</option>
					<option value="black">black</option>
					<option value="white">white</option>
					<option value="red">red</option>
					<option value="pink">pink</option>  
				</select> 
				<select name="color" style="padding:3px;">
					<option>로고</option>
					<option value="black">black</option>
					<option value="white">white</option>
					<option value="red">red</option>
					<option value="pink">pink</option>  
					<option value="green">green</option>
					<option value="blue">blue</option>
				</select>
				<select name="color" style="padding:3px;">
					<option>포인트</option>
					<option value="black">black</option>
					<option value="white">white</option>
					<option value="red">red</option>
					<option value="pink">pink</option> 
					<option value="green">green</option>
					<option value="blue">blue</option> 
				</select>
			</form>   
		<br>  
		<button id="btn-upload">파일 업로드</button>
		</div>
	</div>
<%@ include file="../../footer.jsp"%> 	 
</body> 
</html>