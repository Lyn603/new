/**
 * 일반회원 약관동의
 */

function cAll() {
    if ($("#agreement_all").is(':checked')) {
        $("input[type=checkbox]").prop("checked", true);
    } else {
        $("input[type=checkbox]").prop("checked", false);
    }
}

function chk(){
	 var req1 = document.JoinRealtorAgree.req1.checked;
	 var req2 = document.JoinRealtorAgree.req2.checked;
	 var req3 = document.JoinRealtorAgree.req3.checked;
	 var req4 = document.JoinRealtorAgree.req4.checked;
	 var num = 0;
	 if(req1 == true){
		 if(req2 == true) {
			 if(req3 ==true) {
				if(req4 == true) {
					num = 1;
				} else{
					alert("약관에 전부 동의하셔야 합니다");
				}
			 }
			 else {
				 alert("약관에 전부 동의하셔야 합니다");
			 }
		 }
		 else {
			 alert("약관에 전부 동의하셔야 합니다");
		 }
	 }
	 
	 if(num == 1) {
		 document.JoinRealtorAgree.submit();
		 }
	 else {
	  alert("약관에 전부 동의하셔야 합니다");
	  }
	 }
	 
	 function nochk() {
		 alert("동의하지 않으면 가입할 수 없습니다");
	 }