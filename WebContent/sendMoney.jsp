<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/header.jsp" />

<section id="sendMoneySection" class="section">
	<div class="titleWrap">
		<!-- 메인 타이틀 -->
		<h2 class="mainTitle inlineBlock">송금하기</h2>
		<div class="titleLocationWrap fRight inlineBlock">
			<a href="main.jsp"><img src="./images/homeBtn.png" class="top"
				alt="홈"></a> <span class="titleLocation">&nbsp; / &nbsp;
				송금하기 &nbsp;</span>
		</div>
	</div>
	<div class="container bgWhite">
		<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
		<!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 main.jsp -->
		<!-- 송금하기 폼 -->
		<form id="sendMoneyForm" class="formWrap" name="f"
			action="${pageContext.request.contextPath}/sendMoneyEnd.do"
			method="post">
			<!-- 서브 타이틀 -->
			<p class="label udPadding">출금할 계좌</p>

			<select name="myAccount" id="selectAccount">
				<c:forEach var="testList" items="${accountList}" varStatus="i">
					<option value="${testList.accnum}">${testList.accnum}</option>
				</c:forEach>
			</select>

			<h3 class="udPadding">비밀번호</h3>
			<input type="password" id="accountPassword"  name="accountPassword"
				placeholder="비밀번호를 입력해주세요">

			<p class="label udPadding">은행명</p>
			<div class="boxWrap">
				<div class="boxRecord">
					<input type="button" id="pq" class="bankBtn" name="bankBtn"
						value="펭귄뱅크"> <input type="button" id="sh" class="bankBtn"
						name="bankBtn" value="신한은행"> <input type="button" id="kb"
						class="bankBtn noRightMargin" name="bankBtn" value="국민은행">

				</div>
				<div class="boxRecord">
					<input type="button" id="woori" class="bankBtn" name="bankBtn"
						value="우리은행"> <input type="button" id="nh" class="bankBtn"
						name="bankBtn" value="농협은행"> <input type="button" id="ibk"
						class="bankBtn noRightMargin" name="bankBtn" value="기업은행">
				</div>
				<div class="boxRecord">
					<input type="button" id="hana" class="bankBtn" name="bankBtn"
						value="하나은행">
				</div>
				<input type="hidden" id="bankId" name="bankId">
			</div>

			<h3 class="udPadding">계좌번호</h3>
			<input type="text" id="yourAccount"  name="userAccount"
				placeholder="계좌번호 입력해 주세요.">

			<h3 class="udPadding">보내는 금액</h3>
			<input type="text" id="txtMoney" name="txtMoney" class="format-money right"
				maxlength="15" onkeyup="changeHangulMoney(this)">

			<!-- 숫자를 한글로 변환 -->
			<span class="han_money blackPoint fRight right" id="han_money"></span>

			<!-- 확인 모달창을 띄움 -->
			<input type="button" value="송금하기" id="sendMoneyBtn"
				class="bigBtn upPadding center full btn-example">
		</form>
		<!-- sendMoneyForm -->
		
		<div id="wrongPasswordModal" class="modal">
			<div class="modal-content">
				<p class="bigPoint"></p>
				<span class="close">&times;</span>
				<p>잘못된 비밀번호입니다.</p>
				<input type="button" value="뒤로가기"
					class="alertModel bigBtn upPadding center full btn-example">
			</div>
		</div>

		<div id="wrongAccountModal" class="modal">
			<div class="modal-content">
				<p class="bigPoint"></p>
				<span class="close">&times;</span>
				<p>잘못된 계좌입니다.</p>
				<input type="button" value="뒤로가기"
					class="alertModel bigBtn upPadding center full btn-example">
			</div>
		</div>
		
		<div id="insufficientBalanceModal" class="modal">
			<div class="modal-content">
				<p class="bigPoint"></p>
				<span class="close">&times;</span>
				<p>잔액이 부족합니다.</p>
				<input type="button" value="뒤로가기"
					class="alertModel bigBtn upPadding center full btn-example">
			</div>
		</div>		

		<div id="checkAccountModal" class="modal">
			<div class="modal-content">
				<p class="bigPoint"></p>
				<span class="close">&times;</span>
				<table>
					<tr>
						<td>은행명</td>
						<td><span id="bankName"></span></td>
					</tr>
					<tr>
						<td>계좌번호</td>
						<td><span id="yourAccountNum"></span></td>
					</tr>
					<tr>
						<td>예금주</td>
						<td><span id="accountHolder"></span></td>
					</tr>
				</table>
				<input value="위 사람에게 송금하시겠습니까?" id="lastSending"
					class="bigBtn upPadding center full btn-example"> <input
					type="button" value="송금을 취소합니다."
					style="background-color: #3730b9" id="cancleSending"
					class="bigBtn upPadding center full btn-example">
			</div>
		</div>
		
		
	</div>
	<!-- container -->

</section>
<jsp:include page="/footer.jsp" />