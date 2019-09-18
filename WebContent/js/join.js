var validate = function () {
	var id = document.getElementById("userId");
	var pwd = document.getElementById("userPwd");
	var name = document.getElementById("userName");
	var jumin = document.getElementById("userJumin");
	var phone = document.getElementById("userPhone");
	
	var idchk = id.getAttribute('checkvalidate');
	var pwdchk = pwd.getAttribute('checkvalidate');
	var namechk = name.getAttribute('checkvalidate');
	var juminchk = jumin.getAttribute('checkvalidate');
	var phonechk = phone.getAttribute('checkvalidate');
	var checkchk = false;
	
	if($("#check1").is(":checked") == false
	  || $("#check2").is(":checked") == false
	  || $("#check3").is(":checked") == false)
	  {
         alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
         return false;
	  }
	else{
		checkchk = true;
	}
	
	if(idchk=="true" && pwdchk=="true" && namechk=="true" && juminchk=="true" && phonechk=="true" && checkchk==true){
		return;
	}
	else{
		if(idchk=='false') id.focus();
		else if(pwdchk=='false') pwd.focus();
		else if(namechk=='false') name.focus();
		else if(juminchk=='false') jumin.focus();
		else if(phonechk=='false') phone.focus();
		return false;
	}
}

var idValidate = function() {
	var idReg = document.getElementById("userId").value
	   .search(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
	
	var id = document.getElementById("userId");
	var idMsg = document.getElementById("userIdMsg");
	id.setAttribute('checkValidate',false);
	
	$.ajax({
		type:'GET',
		url:'idDuplicateCheck.do?checkemail='+ $('#userId').val(),
		dataType:'json',
		cache : 'false',
		success : function(res) {
		    //아이디 유효성 체크 
		    if(!id.value){
		       idMsg.innerHTML = "아이디를 입력하세요.";
		       idMsg.style.color = "red";
		       $('#chkId').val(false);
		    }
		    else if(idReg == -1){    	
		      idMsg.innerHTML = "유효하지 않은 E-Mail주소입니다."
		 	  idMsg.style.color = "red";
		      id.value = "";
		      $('#chkId').val(false);
		    }
		    else if(res.ischeck == "true"){
		        idMsg.innerHTML = "이미 사용중인 아이디입니다."
		   	    idMsg.style.color = "red";
		        $('#chkId').val(false);
		    }
		    else{
		 	   var email = $('#userId').val(); 	   
		       idMsg.innerHTML = "멋진 아이디네요 :-)";
		 	   idMsg.style.color = "#00c546";
		 	   id.setAttribute('checkValidate',true); 
		       $('#chkId').val(true);
		    }
		},
		error : function(e) {
			alert('error : ' + e.status);
		}
	})
}

var pwdValidate = function () {
	var pwdReg = document.getElementById("userPwd").value
	   .search(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/);
	var pwdCheckReg = document.getElementById("userPwdCheck").value
	.search(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/);
	
	var pwd = document.getElementById("userPwd");
	var pwdMsg = document.getElementById("userPwdMsg");
	
	var pwdCheck = document.getElementById("userPwdCheck");
	var pwdCheckMsg = document.getElementById("userPwdCheckMsg");
	pwd.setAttribute('checkValidate',false); 
    //비밀번호 재입력 유효성 체크 
    if(!pwdCheck.value){
       pwdCheckMsg.innerHTML = "비밀번호를 입력하세요.";
       pwdCheckMsg.style.color = "red"; 
       $('#chkPwdCheck').val(false);
       return false;
    }
    else if(pwdCheckReg == -1){
       pwdCheckMsg.innerHTML = "비밀번호는 최소 8자리에 숫자, 문자, 특수문자 각각 1개 이상 포함하여 입력하세요."
       pwdCheckMsg.style.color = "red";
 	  	pwdCheck.value = ""; 	  
       $('#chkPwdCheck').val(false);
       return false;
    }
    else if(pwd.value != pwdCheck.value){
       pwdCheckMsg.innerHTML = "비밀번호가 다릅니다. 다시 확인해 주세요."
 	  pwdCheckMsg.style.color = "red"; 	  
       pwdCheck.value = "";      
       $('#chkPwdCheck').val(false);
       return false;
    }
    else{
       pwdCheckMsg.innerHTML = "비밀번호 일치! 다음 단계로!";
 	   pwdCheckMsg.style.color = "#00c546";	
 	   pwd.setAttribute('checkValidate',true); 
       $('#chkPwdCheck').val(true);
    }
}

var nameValidate =  function () {
	var nameReg = document.getElementById("userName").value
	   .search(/^[가-힣]{2,4}$/);
	var name = document.getElementById("userName");
	var nameMsg = document.getElementById("userNameMsg");
	name.setAttribute('checkValidate',false); 
    //이름 유효성 체크 
    if(!name.value){
      nameMsg.innerHTML = "이름을 입력하세요.";
 	  nameMsg.style.color = "red";
       $('#chkName').val(false);
    }
    else if(nameReg == -1){
       nameMsg.innerHTML = "이름이 아닙니다."
       nameMsg.style.color = "red";
       name.value = "";
       $('#chkName').val(false);
    }
    else{
    	nameMsg.innerHTML = "이쁜 이름이네요~!";
    	nameMsg.style.color = "#00c546";
    	name.setAttribute('checkValidate',true); 
    	chkName.value = true;
    	$('#chkName').val(true);
    }	   
}

var juminValidate = function() {
	var jumin = document.getElementById("userJumin");
	var juminBack = document.getElementById("userJuminBack");
	var juminMsg = document.getElementById("userJuminMsg");

	var arrJumin = new Array(); // 주민번호 앞자리숫자 6개를 담을 배열
	var arrJuminBack = new Array(); // 주민번호 뒷자리숫자 7개를 담을 배열
	jumin.setAttribute('checkValidate',false);
   // 주민번호 앞자리를 배열에 순서대로 담는다.
   for (var i=0; i<jumin.value.length; i++) {
      arrJumin[i] = jumin.value.charAt(i);
   } 

   // 주민번호 뒷자리를 배열에 순서대로 담는다.
   for (var i=0; i<juminBack.value.length; i++) {
      arrJuminBack[i] = juminBack.value.charAt(i);
   } 
	
	var tempSum=0;

   // 주민번호 검사방법을 적용하여 앞 번호를 모두 계산하여 더함
	for (var i=0; i<jumin.value.length; i++) {
		tempSum += arrJumin[i] * (2+i);
	} 

   // 같은방식으로 앞 번호 계산한것의 합에 뒷번호 계산한것을 모두 더함
	for (var i=0; i<juminBack.value.length-1; i++) {
		if(i>=2) {
			tempSum += arrJuminBack[i] * i;
		}
		else {
			tempSum += arrJuminBack[i] * (8+i);
		}	
	} 
	
	if(!juminBack.value){
		juminMsg.innerHTML = "주민등록번호를 입력하세요.";
		juminMsg.style.color = "red";
		$('#chkJumin').val(false);
	}
	else if((11-(tempSum%11))%10!=arrJuminBack[6]) {
	      juminMsg.innerHTML = "올바른 주민등록번호가 아닙니다."
		  juminMsg.style.color = "red";
		  $('#chkJumin').val(false);
		  $('#chkJuminBack').val(false);
	      return false;
	   } else {
	      juminMsg.innerHTML = "올바른 주민등록번호 입니다.";
		  juminMsg.style.color = "#00c546";
		  jumin.setAttribute('checkValidate',true);
		  chkJumin.value = true;
	      $('#chkJumin').val(true);
	   }	
}

var phoneValidate = function() {
	var phoneReg = document.getElementById("userPhone").value
	.search(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/);

	var phone = document.getElementById("userPhone");
	var phoneMsg = document.getElementById("userPhoneMsg");
	phone.setAttribute('checkValidate',false);   
    //휴대전화 번호 유효성 체크 
    if(!phone.value){
      phoneMsg.innerHTML = "휴대전화 번호를 입력하세요.";
 	  phoneMsg.style.color = "red";
       $('#chkPhone').val(false);
       return false;
    }
    else if(phoneReg == -1){
       phoneMsg.innerHTML = "휴대전화 번호를 정확하게 입력해주세요."
 	   phoneMsg.style.color = "red";
       $('#chkPhone').val(false);
       return false;
    }
    else{
       phoneMsg.innerHTML = "올바른 휴대전화 번호 입니다.";
       phoneMsg.style.color = "#00c546";
       phone.setAttribute('checkValidate',true);
       $('#chkPhone').val(true);
    }
}





 
