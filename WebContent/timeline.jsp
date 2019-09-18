<%@page import="java.util.Date"%>
<%@page import="org.apache.naming.java.javaURLContextFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/header.jsp" />

<section id="timelineSection" class="section">
	<div class="titleWrap">
		<!-- 메인 타이틀 -->
		<h2 class="mainTitle inlineBlock">마이페이지</h2>
		<div class="titleLocationWrap fRight inlineBlock">
			<a href="timeline.jsp"><img src="./images/homeBtn.png" class="top" alt="홈버튼"></a>
			<span class="titleLocation">&nbsp;  /  &nbsp;  마이페이지  &nbsp;  /  &nbsp;  타임라인</span>
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

		<div class="tabContentWrap inlineBlock bgWhite scrollbar" id="style-7"> 
			<!-- tab1 -->
			<div id="tab1" class="tabContent">
				<div class="boxWrap ">
					<!-- 서브 타이틀 -->
					<c:set var="now" value="<%=new java.util.Date()%>" />
					<c:set var="year"><fmt:formatDate value="${now}" pattern="yy" /></c:set> 
					<c:set var="year2"><fmt:formatDate value="${now}" pattern="YYYY" /></c:set> 
					<c:set var="month"><fmt:formatDate value="${now}" pattern="MM" /></c:set> 
					
					<fmt:parseDate value="${StringDate}" var="selectedValue" pattern="yy/MM"/>
					<c:set var="selectedYear"><fmt:formatDate value="${selectedValue}" pattern="yy" /></c:set>
					 
<!-- 					<p class="label udPadding">날짜별로 검색하기</p>
					<input type="text"
					    data-range="true"
					    data-multiple-dates-separator=" - "
					    data-language="en"
					    class="datepicker-here"/>
					    
				    <input type="button" value="검색하기" id="modifiedBtn" 
				    class="borderMiddleBtn center">		 -->			
					
					<c:if test="${year eq selectedYear}">
						<h3 class="subTitle"><fmt:formatDate value="${selectedValue}" pattern="M월 "/> 타임라인</h3>
					</c:if>
					
					<c:if test="${year ne selectedYear}">
						<h3 class="subTitle">${year2}이전</h3>
					</c:if>
					
					<select id="monthlyLookup" onchange="changeLookup()">
					<c:forEach var="i" begin="1" end="${month}" step="1" >
						<c:set var="tempMonth" value="${month-i+1}"/>
						<fmt:formatNumber var="parseMonth" minIntegerDigits="2" value="${tempMonth}" type="number"/>
						<c:set var="yearMonth" value="${year}/${parseMonth}"/>
						
						<c:if test="${StringDate ne yearMonth}">
							<option value="${yearMonth}">${year2}년<c:out value="${tempMonth}"/>월</option>
						</c:if>
						<c:if test="${StringDate eq yearMonth}">
							<option value="${yearMonth}" selected>${year2}년<c:out value="${tempMonth}"/>월</option>
						</c:if>							
					</c:forEach>
						<c:set var="beforeDate" value="44/12"/>
						<c:if test="${StringDate eq beforeDate}">
							<option value="44/12" selected>이전 기록</option>
						</c:if>
						<c:if test="${StringDate ne beforeDate}">
							<option value="44/12">이전 기록</option>
						</c:if>						
					</select>
					
					<c:if test="${StringDate eq beforeDate}">
						<select id="selectBeforeYears" onchange="changeBeforeLookup()">
							<c:forEach var="i" begin="1990" end="${year2-1}" step="1" >
								<c:set var="tempYear" value="${year2-1-i+1990}"/>
								<c:if test="${beforeYear eq tempYear}">
									<option value="${tempYear}" selected>${tempYear}</option>
								</c:if>
								<c:if test="${beforeYear ne tempYear}">
									<option value="${tempYear}">${tempYear}</option>
								</c:if>
							</c:forEach>
						</select>
					</c:if>
		    
				    <c:if test="${timeLineList != null and not empty timeLineList}">
				    	<c:forEach var="timeline" items="${timeLineList}">
				    		<fmt:parseDate value="${timeline.whentime}" var="whentime" pattern="yy/MM/dd HH:mm:ss"/>
				    		<c:set var="whentime2"><fmt:formatDate value="${whentime}" pattern="yy/MM/dd"/></c:set>
				    		<c:if test="${tempDate eq null or (tempDate ne null and tempDate ne whentime2)}">	
					    		<p class="label udPadding">
									<fmt:formatDate value="${whentime}" pattern="yyyy년 dd일 E요일"/>
					    		</p>
							</c:if>    		
				    		<c:set var="tempDate" value="${whentime2}"/>
   							<div id="box1" class="box border">
								<div class="textBox lMargin">
									<c:if test="${timeline.sentmoney ne null}">
										<span class="tag mainColor">내 입출금계좌  (${timeline.account_accnum})->${timeline.trader}</span>
										<h3 class="blackPoint">-<span><fmt:formatNumber value="${timeline.sentmoney}" pattern="###,###"/></span>원</h3>
									</c:if>
									<c:if test="${timeline.sentmoney eq null}">
										<span class="tag mainColor"> ${timeline.trader}->내 입출금계좌  (${timeline.account_accnum})</span>
										<h3 class="blackPoint">+<fmt:formatNumber value="${timeline.receivemoney}" pattern="###,###"/>원</h3>
									</c:if>									
									<p class="time">
										<fmt:formatDate value="${whentime}" pattern="HH:mm"/>
									</p>
								</div>
							</div>
				    	</c:forEach>
				    </c:if>	   
				    <c:if test="${empty timeLineList}">
				    	<c:if test="${StringDate eq beforeDate}">
			    			<h1>거래 이력이 존재하지 않습니다.</h1>
			    		</c:if>
						<c:if test="${StringDate ne beforeDate}">
			    			<h1>${StringDate}의 거래 이력은 없습니다.</h1>
			    		</c:if>			    		
				    </c:if> 
				</div>
			</div>		
		</div>
	</div>
</section>

<jsp:include page="/footer.jsp" />