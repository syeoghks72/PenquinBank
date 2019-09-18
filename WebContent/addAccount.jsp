<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/header.jsp" />

<section id="lookupSection" class="section">
	<div class="titleWrap">
		<!-- 메인 타이틀 -->
		<h2 class="mainTitle inlineBlock">마이페이지</h2>
		<div class="titleLocationWrap fRight inlineBlock">
			<a href="lookup.jsp"><img src="./images/homeBtn.png" class="top"
				alt="조회"></a> <span class="titleLocation">&nbsp; / &nbsp;
				마이페이지 &nbsp; / &nbsp; 조회</span>
		</div>
	</div>
	<div class="container">

		<!-- 마이페이지 사이드 메뉴 -->
		<div class="sideMenuContainer fLeft inlineBLock bgWhite">
			<ul class="menu inlineBlock">
				<li rel="tab1" id="myinfo" class="menuitem active"><a
					href="${pageContext.request.contextPath}/myPage.do">내정보</a></li>
				<li rel="tab2" id="lookup" class="menuitem"><a
					href="${pageContext.request.contextPath}/lookup.do">조회</a></li>
				<li rel="tab3" id="timeline" class="menuitem"><a
					href="${pageContext.request.contextPath}/timeline.do">타임라인</a></li>
			</ul>
			<div class="slidingBar"></div>
		</div>

		<div class="tabContentWrap inlineBlock bgWhite">
			<!-- tab1 -->
			<div id="tab1" class="tabContent">
				<div class="boxWrap">
					<!-- 서브 타이틀 -->
					<h3 class="subTitle">계좌신청하기</h3>
					<div class="boxRecord">
						<div id="box1" class="box">
							<div class="textBox inlineBlock fLeft">
								<%-- <span class="mainColor">${account.accountDetail.acctype}</span>
								<span class="grey">${account.accnum}</span> --%>
								<h5 class="blackPoint">영문이름</h3>
								<input type="text" maxlength="15" placeholder="이름">
								<input type="text" maxlength="15" placeholder="성">
								<h5 class="blackPoint">집주소</h3>
								<input type="text" maxlength="15" placeholder="성">
								<h5 class="blackPoint">비밀번호</h3>
								<input type="text" maxlength="15" placeholder="비밀번호">
								<h5 class="blackPoint">비밀번호 확인</h3>
								<input type="text" maxlength="15" placeholder="비밀번호 확인">
							</div>
<!-- 							<div class="btnWrap fRight">
								<button id="transfer" class="borderSmallBtn"
									onclick="location.href='transfer.jsp'">계좌 계설</button>
							</div> -->
						</div>
					</div>
				</div>
				<div class="btnWrap center">
					<button class="bigBtn" onclick="location.href='lookup.jsp'">계좌 개설 신청</button>
				</div>
			</div>

		</div>
	</div>
</section>

<jsp:include page="/footer.jsp" />