<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>(일반) 회원가입 정보입력</title>
	
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<link href="<c:url value = "resources/css/join.css?ver=3/"/>" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="resources/js/joinUser.js"></script>
</head>
<style>
 	.title01{	padding-top:100px;  }
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
				<li class="step02 on" style="background:#E60012;">
					<span class="st_num" id="st_num">STEP02</span>
					<span class="st_name" id="st_name">정보입력</span>
				</li>
				<li class="step03">
					<span class="st_num">STEP03</span>
					<span class="st_name">가입완료</span>
				</li>
			</ul>
		</div>
		
		<div class="tbl_hwrap">
			<div class="l_box">
				<h3 class="tbl_htitle">회원가입정보</h3>
			</div>
			<div class="r_box">
				<span class="tbl_sup imprt">은 필수사항입니다</span>
			</div>
		</div>
		
		<form name="joinUser" action="joinUser" onsubmit="return checkValue()">
			<div class="tbl_wrap">
				<table cellspacing="0" class="tbl_detail" >
					<tbody>
						<tr>
							<th scope="row" class="color_gy6">
								<span class="tbl_ess">
									<label for="label_name">이름</label>
								</span>
							</th>
							<td>
								<div class="inp_wrap">
									<input type="text" name="name" id="name" class="inputS email" placeholder="이름">
								</div>
							</td>
						</tr>
						
						<tr>
							<th scope="row" class="color_gy6">
								<span class="tbl_ess">
									<label for="label_email">이메일</label>
								</span>
							</th>
							<td>
								<div class="inp_grouping email">
									<div class="inp_wrap">
										<input type="text" name="e1" id="e1" class="inputS email" placeholder="이메일 아이디">
									</div>
									<span> @ </span>
									<div class="inp_wrap">
										<input type="text" name="e2" id="e2" class="inputS email" ReadOnly="true" placeholder="이메일 주소">
									</div>
									<div class="select_wrap">
										<select class="inputS email" name="email" onchange="setEmail(email.options[this.selectedIndex].value)">
											<option value="notSelected" >::선택::</option>
											<option value="naver.com">naver.com</option>
											<option value="daum.net">daum.net</option>
											<option value="gmail.com">gmail.com</option>
											<option value="etc">직접입력</option>
										</select>
									</div>
									<button type="button" class="btn adrBtn" id="emailck" name="emailck">이메일 중복확인</button>
								</div><!-- inp_grouping email -->
							</td>
						</tr>
						
						<tr>
							<th scope="row" class="color_gy6">
								<span class="tbl_ess">
									<label for="label_password">비밀번호</label>
								</span>
							</th>
							<td>
								<div class="inp_wrap">
									<input type="password" id="password" name="password" class="inputS pw" placeholder="비밀번호" maxlength="15/">
									<span class="select_spaceL">8~15자 내의 영문 대문자, 영문 소문자, 숫자, 특수문자 조합</span>
								</div>
							</td>
						</tr>
						
						<tr>
							<th scope="row" class="color_gy6">
								<span class="tbl_ess">
									<label for="label_passwordChk">비밀번호 확인</label>
								</span>
							</th>
							<td>
								<div class="inp_wrap">
									<input type="password" id="passwordChk" name="passwordChk" class="inputS pw" placeholder="비밀번호 재입력" maxlength="15/"> <br>
								</div>
							</td>
						</tr>
						
						<tr>
							<th scope="row" class="color_gy6">
								<span class="tbl_ess">
									<label for="label_phone">휴대폰 번호</label>
								</span>
							</th>
							<td>
								<div class="inp_wrap">
									<input type="text" id="phone" name="phone" class="inputS phnum" onKeyup="hypenPhoneNumber(this);" placeholder="휴대폰 번호" maxlength="13/">
								</div>
							</td>
						</tr>
						
						<tr>
							<th scope="row" class="color_gy6">
								<span class="tbl_ess">
									<label for="label_address">주소</label>
								</span>
							</th>
							<td>
								<div class="inp_wrap">
									<input type="text" name="zip_code" id="zip_code" class="inputS address" readonly="readonly" placeholder="우편번호">
									<button type="button" class="btn adrBtn" id="nextBtn" onclick="ShowPostcode(this.value)">주소 찾기</button><br>
									<input type="text" name="a1" id="a1" class="inputS address_long" readonly="readonly" placeholder="주소"><br>
									<input type="text" name="a2" id="a2" class="inputS address_long" title="상세 주소 입력" placeholder="상세 주소 입력">
								</div>
							</td>
						</tr>
						
						<tr>
							<th scope="row" class="color_gy6">
								<span class="tbl_ess">
									<label for="label_sex">성별</label>
								</span>
							</th>
							<td>
								<div class="inp_wrap">
									<input type="radio" id="sex" name="sex" value="여성" class="inputSex">
									<span class="sexSpan">여성</span>
									<input type="radio" id="sex" name="sex" value="남성" class="inputSex">
									<span class="sexSpan">남성</span>
								</div>
							</td>
						</tr>
						
						<tr>
							<th scope="row" class="color_gy6">
								<span class="tbl_ess">
									<label for="label_age">생년월일</label>
								</span>
							</th>
							<td>
								<div class="inp_wrap">
									<input type="date" id="age" name="age" class="inputS age">
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div><!-- tbl_wrap -->
			
			<div class="btn_wrap">
				<button type="reset" class="btn midBtn02" id="cancelBtn" onclick="nochk()">취소</button>
				<button type="submit" class="btn midBtn01" id="nextBtn" onclick="chk()">가입하기</button>
			</div>
		</form>
	</div><!-- incontent -->
<%@ include file="../footer.jsp"%>	
</body>
</html>
