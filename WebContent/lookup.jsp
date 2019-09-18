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
					<h3 class="subTitle">조회</h3>
					<div class="boxRecord">
						<!-- 입출금 계좌 -->
						<c:if test="${accountList != null and not empty accountList}">
							<c:forEach var="account" items="${accountList}" >
								<div id="box1" class="box">
									<div class="textBox inlineBlock fLeft">
										<span class="mainColor">${account.accountDetail.acctype}</span> <span class="grey">${account.accnum}</span>
										<h3 class="blackPoint"><span><fmt:formatNumber value="${account.money}" pattern="###,###"/></span>원</h3>
									</div>
									<div class="btnWrap fRight">
										<button id="transfer" class="borderSmallBtn"
											onclick="location.href='transfer.jsp'">이체</button>
									</div>
								</div>
							</c:forEach>
						</c:if>
						<c:if test="${empty accountList}">
							<h1>개설한 계좌가 존재하지 않습니다.</h1>
						</c:if>
						<!-- 						<div id="box1" class="box">
							<div class="textBox inlineBlock fLeft">
								<span class="mainColor">입출금 계좌</span>
								<span class="grey">3333-12-1423423</span>
								<h3 class="blackPoint">2,675,000원</h3>
							</div>
							<div class="btnWrap fRight">
								<button id="transfer" class="borderSmallBtn"
								onclick="location.href='transfer.jsp'">이체</button>
		           			 </div>
						</div>
						자유적금
						<div id="box2" class="box">
							<div class="textBox inlineBlock fLeft">
								<span class="mainColor">자유적금</span>
								<span class="grey">3355-04-1421231</span>
								<h3 class="blackPoint">19,005,000원</h3>
							</div>
							<div class="btnWrap fRight">
								<button id="requestNum" class="borderSmallBtn"
								onclick="location.href='manage.jsp'">관리</button>
							</div>
						</div> -->
					</div>
				</div>
				<div class="btnWrap center">
					<button class="bigBtn" onclick="location.href='${pageContext.request.contextPath}/addAccount.do'">추가하기</button>
				</div>
			</div>

		</div>
	</div>
</section>

<jsp:include page="/footer.jsp" />