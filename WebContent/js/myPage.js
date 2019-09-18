var editInfoCheck = function () {
	var name = $('#userName');
	var userPhone = $('#userPhone');
	var userPwdChange = $('#userPwdChange');

	if(!name.val()){
		alert('이름을 입력하세요');
		name.focus();
		return false;
	}
	else if(!userPhone.val()){
		alert('번호를 입력하세요');
		userPhone.focus();
		return false;
	}
	else if(!userPwdChange.val()){
		alert('비밀번호를 입력하세요');
		userPwdChange.focus();
		return false
	}
	return true;
}