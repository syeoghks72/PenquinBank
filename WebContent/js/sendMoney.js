/* 은행 버튼 포커스 */
$(function(){
	$('#sendMoneySection .bankBtn').click(function(){
		
	$('.bankBtn').removeClass("clicked");
	$(this).addClass("clicked");

	});

	var checkAccModal = document.getElementById('checkAccountModal');
	var wrongAccModal = document.getElementById('wrongAccountModal');
	var wrongPasswordModal = document.getElementById('wrongPasswordModal');
	var insufficientBalanceModal = document.getElementById('insufficientBalanceModal');
	var sendMoneyBtn = document.getElementById("sendMoneyBtn");
	var span = document.getElementsByClassName("close");

	sendMoneyBtn.onclick = function() {
		var accountPassword = $('#accountPassword').val();
		var accountNum = $('#yourAccount').val();
		var sendMoney = $('#txtMoney').val();
		var bankBtnId = $("input[name=bankBtn][class*=clicked]").attr('id');
		$('#bankId').val(bankBtnId); 
		var selectedAccount = $("#selectAccount option:selected").val();


		if(!accountPassword || accountPassword==null){
			alert('비밀번호를 입력해주세요');
			return;
		}
		else if(bankBtnId==null){
			alert('거래할 은행을 선택해 주세요');
			return;
		}
		else if(!accountNum || accountNum==null) {
			alert("계좌번호를 입력해주세요");
			$('#yourAccount').focus();
			return;
		}
		else if(!sendMoney || sendMoney==null){
			alert('금액을 입력하세요');
			$('#txtMoney').focus();
			return;
		}
		else if(bankBtnId!='pq') {
			alert('현재 타은행 송금은 서비스 준비중입니다...');
			return;
		}

		let accountForm = $('#sendMoneyForm').serialize();

		$.ajax({
		 	type:'POST',
		 	url:'sendMoneyCheck.do',
			dataType: 'json',
			data : accountForm,
		 	cache : 'false',
		 	success : function(res) {
				console.log(JSON.stringify(res));
				
				let amountToSend = sendMoney.split(",").join("");
				let yourInfo = res.yourInfo;
				let myInfo = res.myinfo;
				let myMoney="";
				if(myInfo!=null) myMoney = res.myInfo.accountList[0].money;
				if(res.myInfo==null){
					wrongPasswordModal.style.display = "block";
				}				 
				else if(res.yourInfo==null || selectedAccount==accountNum){
					wrongAccModal.style.display = "block";
				}
				else if(parseInt(amountToSend)>parseInt(myMoney)){
					insufficientBalanceModal.style.display = "block"
				}
				else{
					checkAccModal.style.display = "block";
					$('#bankName').text($('#'+bankBtnId).attr('value'));
					$('#yourAccountNum').text(yourInfo.accountList[0].accnum);
					$('#accountHolder').text(yourInfo.name);
				}
		 	},
		 	error : function(e) {
		 		alert('error : ' + e.status);
		 	}
		})
	}
	
	$('#lastSending').click(function() {
		$('#checkAccountModal').css('display','none');
		$('#sendMoneyForm').submit();
	})
	
	$('#cancleSending').click(function() {
		
	})

	$('.close').click(function() {
		checkAccModal.style.display = "none";
		wrongAccModal.style.display = "none";
		wrongPasswordModal.style.display = "none";
		insufficientBalanceModal.style.display = "none";
	})
	
    $('.alertModel').click(function(){
		checkAccModal.style.display = "none";
		wrongAccModal.style.display = "none";
		wrongPasswordModal.style.display = "none";
		insufficientBalanceModal.style.display = "none";
	});
	
});


// 1 ~ 9 한글 표시
var arrNumberWord = new Array("","일","이","삼","사","오","육","칠","팔","구");
// 10, 100, 100 자리수 한글 표시
var arrDigitWord = new  Array("","십","백","천");
// 만단위 한글 표시
var arrManWord = new  Array("","만","억", "조");


function changeHangulMoney(sendInputObject)
{   
   var num_value = sendInputObject.value.split(",").join("").toString();
   var num_length = num_value.length;
   
   if(isNaN(num_value) == true || num_value==0 && num_value) {
	  $('#han_money').text('');
      sendInputObject.value = "";
      alert('잘못된 입력입니다!!');
      return;
   }
   
   var han_value = "";
   var man_count = 0;      // 만단위 0이 아닌 금액 카운트.
   
   for(i=0; i < num_value.length; i++)
   {
      // 1단위의 문자로 표시.. (0은 제외)
      var strTextWord = arrNumberWord[num_value.charAt(i)];
   
      // 0이 아닌경우만, 십/백/천 표시
      if(strTextWord != "")
      {
         man_count++;
         strTextWord += arrDigitWord[(num_length - (i+1)) % 4];
      }
   
      // 만단위마다 표시 (0인경우에도 만단위는 표시한다)
      if(man_count != 0 && (num_length - (i+1)) % 4 == 0)
      {
         man_count = 0;
         strTextWord = strTextWord + arrManWord[(num_length - (i+1)) / 4];
      }
   
      han_value += strTextWord;
   }
   
   if(num_value != 0)
         han_value = han_value + " 원";
   
   document.all.han_money.innerText = han_value;
   
   var strReverse = num_value.split("").reverse().join("");
   var value="";
   for(var i = 0 ; i < strReverse.length ; i++){
      value += strReverse[i];
      if((i+1)%3==0 && (i+1)!=strReverse.length) value+=",";
   }
   var sendMoney = value.split("").reverse().join("").toString();
   sendInputObject.value=sendMoney;
}

