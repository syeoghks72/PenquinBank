<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/header.jsp"/>
<section id="loginSection" class="section">
	<div class="titleWrap">
	<!-- 메인 타이틀 -->
		<h2 class="mainTitle inlineBlock">로그인</h2>
		<div class="titleLocationWrap fRight inlineBlock">
			<a href="main.jsp"><img src="./images/homeBtn.png" class="top" alt="홈"></a>
			<span class="titleLocation">&nbsp;  /  &nbsp;  로그인  &nbsp;</span>
		</div>
	</div>

	<div class="container bgWhite">
		<!-- 로고 영역 -->
		<div class="logoArea">
			<img src="./images/headerLogo.png" class="full">
			<p class="center">내 모든 돈을, 펭귄뱅크에서 간편하게.</p>
		</div>
		<!-- 로그인 영역 -->
		<form class="formWrap half" name="f" 
		action="${pageContext.request.contextPath}/loginEnd.do" method="post">
			<!-- 아이디 -->
			<h3 class="label udPadding">아이디</h3>
			<input type="text" id="userId" name="userId" 
			value="${failId}" placeholder="아이디를 입력해 주세요.">
			
			<!-- 비밀번호 -->
			<h3 class="label udPadding">비밀번호</h3>
			<input type="password" id="userPwd" name="userPwd" 
			placeholder="비밀번호를 입력해 주세요.">
           	
           	<!-- 아이디/비밀번호 찾기 -->
			<div id="idpwSearch" class="fRight udPadding">
				<span><a href="#">아이디 찾기</a></span>
				<span class="lPadding"><a href="#">비밀번호 찾기</a></span>
			</div>
		 
		     <!-- 로그인 버튼 -->
			<div class="btnWrap udPadding center">
			   <button class="bigBtn center full">로그인</button>
			</div>
		</form>
	</div>
</section>

<jsp:include page="/footer.jsp"/>