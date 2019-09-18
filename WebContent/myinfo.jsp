<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/header.jsp" />

<section id="myinfoSection" class="section">
	<div class="titleWrap">
		<!-- 메인 타이틀 -->
		<h2 class="mainTitle inlineBlock">마이페이지</h2>
		<div class="titleLocationWrap fRight inlineBlock">
			<a href="main.jsp"><img src="./images/homeBtn.png" class="top" alt="홈"></a>
			<span class="titleLocation">&nbsp;  /  &nbsp;  마이페이지  &nbsp;  /  &nbsp;  내정보</span>
		</div>
	</div>
	<div class="container">
		
		<!-- 마이페이지 사이드 메뉴 -->
		<div class="sideMenuContainer fLeft inlineBLock bgWhite"> 
			<ul class="menu inlineBlock"> 
				<li rel="tab1" id="myinfo" class="menuitem active"><a href="${pageContext.request.contextPath}/myPage.do">내정보</a></li> 
				<li rel="tab2" id="lookup" class="menuitem"><a href="${pageContext.request.contextPath}/lookup.do">조회</a></li> 
				<li rel="tab3" id="timeline" class="menuitem"><a href="${pageContext.request.contextPath}/timeline.do">타임라인</a></li>
			</ul> 
			<div class="slidingBar"></div> 
		</div>
	
		<div class="tabContentWrap inlineBlock bgWhite">
			<!-- tab1 -->
			<div id="tab1" class="tabContent">
				<form id="myinfoForm" method="post" onsubmit="return editInfoCheck()" action="${pageContext.request.contextPath}/editMyInfo.do">
					<!-- 서브 타이틀 -->
					<h3 class="subTitle">내정보</h3>
					
					<p class="label udPadding">이름</p>
		            <input type="text" id="userName" name="userName" 
		            value="${myInfo.name}">
		            
<!-- 					<p class="label udPadding">이메일 아이디</p>
		            <input type="text" id="userId" name="userId" 
		            maxlength="30" value="sydesign24@naver.com"> -->
		            
		            <p class="label udPadding">휴대전화 번호</p>
		            <input type="text" id="userPhone" name="userPhone" 
	            	value="${myInfo.phone}" maxlength="11">
	            	
	            	<!--  변경하기 버튼 누르면 -->
	   <!--          	<input type="button" value="변경하기" id="modifiedBtn" 
	            	class="borderMiddleBtn upPadding center">
		            
	            	 변경할 휴대전화번호를 입력하세요.
	            	<div class="hideContent">
		            	<p class="purple udPadding">변경할 전화번호를 '-'를 제외하고 입력해주세요.</p>
			            <input type="text" id="userPhoneChange" name="userPhoneChange" 
			            maxlength="30">
			            <input type="button" value="인증번호 요청"
			            id="requestNum" class="borderMiddleBtn upPadding">
		            </div> -->
		            <!--  변경할 비밀번호를 입력하세요. -->
	            	
	            	<p class="label udPadding">변경할 비밀번호를 입력해주세요.</p>
		            <input type="password" id="userPwdChange" name="userPwdChange" 
		            maxlength="30">
<!-- 		            <input type="button" value="비밀번호 변경"
		            id="userPwdChangeBtn" class="borderMiddleBtn udPadding"> -->
		            
	            	<div class="btnWrap center">
						<button class="bigBtn">내정보 수정완료</button>
					</div>
				</form>
			</div>		

		</div><!-- tabContentWrap -->
	</div>
</section>

<jsp:include page="/footer.jsp" />