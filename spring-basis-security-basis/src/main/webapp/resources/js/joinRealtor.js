/**
 * 공인중개사 회원가입 입력정보
 */

//아이디 체크여부 확인 (중복=0 , 중복X=1)
var emailck = 0;
$(function() {
	$("#emailck").click(function() {
		var email = $("#e1").val()+"@"+$("#e2").val();
		var e1 = $("#e1").val();
		var getEmail = (/^[a-zA-Z0-9]+$/);
		
		//이메일 유효성 검사
		if(!getEmail.test(e1)) {
	    	alert("이메일을 올바르게 입력해주세요");
	    	$("#e1").focus();
	    }
		else {
			$.ajax({
				data : {"email" : email},
	            url : "emailck",
	            success : function(data) {
	            		if (data.cnt == 0) {
	                		alert("사용 가능한 이메일입니다!");
	                  emailck = 1; //중복X
	                }
	                else {
	                    alert("이미 등록된 이메일 입니다. 다시 한 번 확인해주세요.");
	                }
	            },
	            error : function(error) {
	            	alert("ERROR --> " + error);
	            }
	        });
		}
    });
});




function setEmail(eVal) {
	var e1 = document.all("e1") //Realtor input
	var e2 = document.all("e2") //Select box
	if ( eVal == "notSelected" ) {
		return;
	}
	else if ( eVal == "etc" ) {
		e2.readOnly = false;
		e2.value = "";
		e2.focus();
		}
	else {
		e2.readOnly = true;
		e2.value = eVal;
		}
}



//유효성 체크
function checkValue() {
	var getName= RegExp(/^[가-힣]+$/);
	var getPhone = RegExp(/^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/);
	var getOwnerNumber = RegExp(/^\d{3}-\d{2}-\d{5}$/);
	
	//이름 공백 검사
    if($("#name").val() == ""){
      alert("이름을 입력해주세요");
      $("#name").focus();
      return false;
    }
    //이름 유효성 검사
    if (!getName.test($("#name").val())) {
      alert("이름을 올바르게 입력해주세요");
      $("#name").val("");
      $("#name").focus();
      return false;
    }
    
    //이메일 공백 검사
    if($("#e1").val() == ""){
      alert("이메일을 입력해주세요");
      $("#e1").focus();
      return false;
    }
    if($("#e2").val() == ""){
        alert("이메일 주소를 선택해주세요");
        $("#e2").focus();
        return false;
     }
    
  //비밀번호 공백 검사
    if($("#password").val() == ""){
      alert("비밀번호를 입력해주세요");
      $("#password").focus();
      return false;
    }
  //비밀번호 확인 공백 검사
    if($("#passwordChk").val() == ""){
      alert("비밀번호를 한번 더 확인해주세요");
      $("#passwordChk").focus();
      return false;
    }
    
  //휴대폰 확인 공백 검사
    if($("#phone").val() == ""){
      alert("핸드폰 번호를 입력해주세요");
      $("#phone").focus();
      return false;
    }
  //휴대폰 유효성 검사
    if (!getPhone.test($("#phone").val())) {
      alert("핸드폰 번호를 올바르게 입력해주세요");
      $("#phone").val("");
      $("#phone").focus();
      return false;
    }
    
  //주소 공백 검사
    if($("#a1").val() == ""){
      alert("주소를 선택해주세요");
      $("#a1").focus();
      return false;
    }
    if($("#a2").val() == ""){
        alert("주소를 선택해주세요");
        $("#a2").focus();
        return false;
     }
    
  //성별 확인 검사
    if($("#sex").val() == ""){
      alert("성별을 체크해주세요");
      $("#sex").focus();
      return false;
    }
    
  //생년월일 확인 검사
    if($("#age").val() == ""){
      alert("생년월일을 체크해주세요");
      $("#age").focus();
      return false;
    }
    
  //사업자등록번호 확인 검사
    if($("#ownerNumber").val() == ""){
      alert("사업자등록번호를 입력해주세요");
      $("#ownerNumber").focus();
      return false;
    }
  //사업자등록번호 유효성 검사
    if (!getOwnerNumber.test($("#ownerNumber").val())) {
      alert("사업자등록번호를 올바르게 입력해주세요");
      $("#ownerNumber").val("");
      $("#ownerNumber").focus();
      return false;
    }
    
  //중개등록번호 확인 검사
    if($("#realtorNumber").val() == ""){
      alert("사업자등록번호를 입력해주세요");
      $("#realtorNumber").focus();
      return false;
    }
    
  //부동산이름 공백 검사
    if($("#agencyName").val() == ""){
      alert("부동산이름을 입력해주세요");
      $("#agencyName").focus();
      return false;
    }
   //부동산이름 유효성 검사
    if (!getName.test($("#agencyName").val())) {
      alert("부동산이름을 올바르게 입력해주세요");
      $("#agencyName").val("");
      $("#agencyName").focus();
      return false;
    }
    
  //부동산주소 공백 검사
    if($("#a1_agency").val() == ""){
      alert("부동산주소를 선택해주세요");
      $("#a1_agency").focus();
      return false;
    }
    if($("#a2_agency").val() == ""){
        alert("부동산주소를 선택해주세요");
        $("#a2_agency").focus();
        return false;
     }
    
  //부동산 번호 공백 검사
    if($("#tel").val() == ""){
      alert("부동산 전화번호를 입력해주세요");
      $("#tel").focus();
      return false;
    }
    
  //비밀번호 확인 검사
    if($("#password").val() != $("#passwordChk").val()){
      alert("비밀번호가 일치하지 않습니다");
      return false;
    }

  	// check password (latters, numbers, Special symbols, 6~16)
    var password = document.joinRealtor.password;
    if(password.value.length < 6 && password.value.length <= 16) {
      alert("비밀번호는 반드시 문자, 숫자, 특수기호가 들어가야하며(!@$%^&*만 가능) 6~16자리 입력이 가능합니다");
      return false;
    }

    if(!password.value.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/)) {
    	 alert("비밀번호는 반드시 문자, 숫자, 특수기호가 들어가야하며(!@$%^&*만 가능) 6~16자리 입력이 가능합니다");
      return false;
    }

    if(password.value.indexOf(password) > -1) {
      alert("이메일과 같은 문자로 비밀번호로 사용할 수 없습니다");
      return false;
    }

    var SamePw0 = 0; //같은 문자 세기
    var SamePw1 = 0; //(+)
    var SamePw2 = 0; //(-)

    for(var i = 0; i < password.value.length; i++) {
      var charPw0 = password.value.charAt(i);
      var charPw1 = password.value.charAt(i+1);

    //같은 문자 세기
      if(charPw0 == charPw1) {
    	  SamePw0 = SamePw0 + 1
      }

      var charPw2 = password.value.charAt(i+2);

    //(+)
      if(charPw0.charCodeAt(0) - charPw1.charCodeAt(0) == 1 && charPw1.charCodeAt(0) - charPw2.charCodeAt(0) == 1) {
    	  SamePw1 = SamePw1 + 1
      }

    //(-)
      if(charPw0.charCodeAt(0) - charPw1.charCodeAt(0) == -1 && charPw1.charCodeAt(0) - charPw2.charCodeAt(0) == -1) {
    	  SamePw2 = SamePw2 + 1
      }
    }
    if(SamePw0 > 1) {
      alert("같은 문자가 3번 이상 반복될 수 없습니다");
      return false;
    }

    if(SamePw1 > 1 || SamePw2 > 1 ) {
      alert("연속으로 반복되는 문자는(123,321,abc,cba 등) /n 사용할 수 없습니다");
      return false;
    }
    return true;
}


//휴대폰 번호 하이픈 추가
function hypenPhoneNumber(obj) {
    var number = obj.value.replace(/[^0-9]/g, "");
    var phone = "";
    if(number.length < 4) {
        return number;
    } else if(number.length < 7) {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3);
    } else if(number.length < 11) {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 3);
        phone += "-";
        phone += number.substr(6);
    } else {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 4);
        phone += "-";
        phone += number.substr(7);
    }
    obj.value = phone;
}

//사업자등록번호 하이픈 추가
function hypenOwnerNumber(obj) {
    var num = obj.value.replace(/[^0-9]/g, "");
    var own = "";
    if(num.length < 4) {
        return num;
    } else if(num.length < 5) {
    	own += num.substr(0, 3);
    	own += "-";
    	own += num.substr(3);
    } else if(num.length < 10) {
    	own += num.substr(0, 3);
    	own += "-";
    	own += num.substr(3, 3);
        own += "-";
        own += num.substr(6);
    } else {
    	own += num.substr(0, 3);
    	own += "-";
    	own += num.substr(3, 2);
    	own += "-";
    	own += num.substr(5);
    }
    obj.value = own;
}

//카카오 주소 API
function ShowPostcode(){
	new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            //각 주소의 노출 규칙에 따라 주소를 조합한다.
            //내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로 이를 참고하여 분기한다
            var fullAddr= '';// 최종 주소 변수
            var extraAddr='';//조합형 주소 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if(data.userSelectedType==='R'){ //'R'=도로명주소
            	fullAddr = data.roadAddress;//사용자가 도로명 주소를 선택했을 경우
            }
            else{
            	fullAddr = data.jibunAddress//사용자가 지번 주소를 선택했을 경우
            }
            //사용자가 선택한 주소가 도로명 타입일 때 조합한다
            if(data.userSelectedType==='R'){
            	if(data.bname!==''){
            		extraAddr+=data.bname; //법정동명이 있을 경우  추가한다
            	}
            	if(data.buildingName!=='') {//건물명이 있을 경우 추가한다
            		extraAddr+=(extraAddr!==''?', ' +data.buildingName : data.buildingName);
            	}
            	fullAddr += (extraAddr!==''?' ('+extraAddr+')':'');//조합형주소의 유무에 따라 양쪽 괄호를 추가하여 최종 주소를 만든다
            }
            document.getElementById('zip_code').value = data.zonecode;//우편번호와 주소정보를 해당 필드에 넣는다
            document.getElementById('a1').value = fullAddr;
            document.getElementById('a2').focus();//커서를 상세주소 필드로 이동시킨다
        }
    }).open();
}

//카카오 주소 API
function ShowPostcode_agency(){
	new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            //각 주소의 노출 규칙에 따라 주소를 조합한다.
            //내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로 이를 참고하여 분기한다
            var fullAddr_agency= '';// 최종 주소 변수
            var extraAddr_agency='';//조합형 주소 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if(data.userSelectedType==='R'){ //'R'=도로명주소
            	fullAddr_agency = data.roadAddress;//사용자가 도로명 주소를 선택했을 경우
            }
            else{
            	fullAddr_agency = data.jibunAddress//사용자가 지번 주소를 선택했을 경우
            }
            //사용자가 선택한 주소가 도로명 타입일 때 조합한다
            if(data.userSelectedType==='R'){
            	if(data.bname!==''){
            		extraAddr_agency+=data.bname; //법정동명이 있을 경우  추가한다
            	}
            	if(data.buildingName!=='') {//건물명이 있을 경우 추가한다
            		extraAddr_agency+=(extraAddr_agency!==''?', ' +data.buildingName : data.buildingName);
            	}
            	fullAddr_agency += (extraAddr_agency!==''?' ('+extraAddr_agency+')':'');//조합형주소의 유무에 따라 양쪽 괄호를 추가하여 최종 주소를 만든다
            }
            document.getElementById('zip_code_agency').value = data.zonecode;//우편번호와 주소정보를 해당 필드에 넣는다
            document.getElementById('a1_agency').value = fullAddr_agency;
            document.getElementById('a2_agency').focus();//커서를 상세주소 필드로 이동시킨다
        }
    }).open();
}
