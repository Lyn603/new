<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Ajax Test</title>
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<style> 
	body, select { font-size:12px; }
	form { margin:5px; }
	p { 
		color:red;
		margin:5px;
		font-size:14px;
	}
	b { color:blue; }
	textarea{
		margin:5px;
		color:gray;
	}
	button{
		height: 50px;
		width: 100px;
		text-align:center;
		font-size:20px;
	}
	#woman{
		display:none;
	}
	#man{
		display:none;
	}
</style> 
</head>
<body>
 	<h1>쪽지</h1>
 	<form> 
		송신 이메일 : <input type="text" name="sender" /><br><br> 
		수신 이메일 : <input type="text" name="targetid"/> <br><br>
		내용 <br> 
		<textarea name="massage"cols="30" rows="10">505글자</textarea> <br>
		<input type="submit" value="남자" id="toggle">
		<select id="woman">  
			<option value="230">230</option>
			<option value="240">240</option>
		</select>
		<select id="man">
			<option value="250">250</option>
			<option value="260">260</option>
		</select>
	</form> 

	<p><tt id="results"></tt></p> 
	
	<script> 
		function showValues() {
			var str = $("form").serialize();
			$("#results").text(str); 
			} 
		$("input").change(showValues); showValues();
		$("select").change(showValues); showValues(); 
		$("textarea").change(showValues); showValues(); 
	</script> 
	<button  id="Submit">Submit</button>
	<script>
	$('#toggle').click(function () {  
	    if($("#man").css("display") == "none"){ 
	    	jQuery('#man').show(1000); 
	    } else {  
	        jQuery('#man').hide();   
	    }  
	});  
	 $(function() {
	  	$('#Submit').click(function() {
		   var allData = $("form").serialize()
		   
		   $.ajax({
			    type : "POST",
			    //dataType: "json",
			    dataType : 'text',
			    data : allData,
			    url : "massage",
			    success : function(data) {
			     alert(data);
			    }
		   });
	  	});
	 });
	 
</script>
</body>
</html>