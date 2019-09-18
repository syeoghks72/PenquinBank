<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<!-- favicon -->
<link rel="shortcut icon" href="./images/favicon.ico">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/ui.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/tabs.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/table.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/popup.css">


<script type='text/javascript' src='<%=request.getContextPath()%>/js/jquery-3.4.1.min.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/js/bootstrap-4.3.1/js/bootstrap.min.js'></script>
<script type='text/javascript' src="//code.jquery.com/jquery.min.js"></script>

<script type='text/javascript' src='<%=request.getContextPath()%>/js/ui.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/js/tabs.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/js/rolling.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/js/join.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/js/sendMoney.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/js/popup.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/js/search.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/js/cardbox.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/js/myPage.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/js/timeline.js'></script>

<!-- datepicker -->
<link href="./dist/css/datepicker.min.css" rel="stylesheet" type="text/css">
<script src='<%=request.getContextPath()%>/dist/js/datepicker.min.js'></script>
<!-- Include English language -->
<script src='<%=request.getContextPath()%>/dist/js/i18n/datepicker.en.js'></script>

<title>PenguinBank</title>

</head>
<body>
	<div id="headerWrap">
		<div id="headerContainer" class="container">
			<div id="headerTop">
				<button type="button" id="sendMoney" onclick="location.href='${pageContext.request.contextPath}/sendMoney.do'">송금하기</button>
				<c:if test="${loginUser eq null}">
					<button type="button" id="login" onclick="location.href='${pageContext.request.contextPath}/login.do'">로그인</button>
					<button type="button" id="join" onclick="location.href='${pageContext.request.contextPath}/join.do'">회원가입</button>
				</c:if>
				<c:if test="${loginUser ne null}">
					<button type="button" id="login" onclick="location.href='${pageContext.request.contextPath}/logout.do'">로그아웃</button>
					<button type="button" id="mypage" onclick="location.href='${pageContext.request.contextPath}/myPage.do'">마이페이지</button>
				</c:if>
			</div>
		</div>
		<header id="header">
			<div class="container">
				<!-- 로고 -->
				<div id="logoWrap">
					<h1 id="mainLogo">
						<a href="${pageContext.request.contextPath}/main.do">
							<img src="./images/headerLogo.png" alt="로고" width="160px"> 
						</a>
					</h1>
					<span>내 모든 돈을, 펭귄뱅크에서 간편하게.</span>
				</div>
				<!-- 실시간 인기 검색어 -->
				<div id="PopularSaearch" class="inlineBlock fRight">
					<span class="fLeft">실시간 인기 검색어</span> 
					<div id="searchRolling" class="inlineBlock">
					    <ul id="searchTicker">
					        <li><a href="#"><span>1</span>PAY백 체크카드 상품서비스</a></li>
					        <li><a href="#"><span>2</span>증명서 발급</a></li>
					        <li><a href="#"><span>3</span>전자민원 접수</a></li>
					        <li><a href="#"><span>4</span>입출금 통장</a></li>
					        <li><a href="#"><span>5</span>중금리 신용대출</a></li>
					        <li><a href="#"><span>6</span>이자납입</a></li>
					        <li><a href="#"><span>7</span>정기예금</a></li>
					        <li><a href="#"><span>8</span>소액마이너스통장</a></li>
					        <li><a href="#"><span>9</span>마이너스 통장</a></li>
					    </ul>
					</div>
				</div>
			</div>
		</header>
		<!-- 네비게이션 -->
		<nav id="nav">
			<div class='zeta-menu-bar container'>
			  <ul class="zeta-menu">
			    <li><a href="productGuidance.jsp">상품안내</a>
			    	<ul>
						<li>
							<a href="productGuidance.jsp">전체상품</a>
						</li>
						<li>
							<a href="#">예/적금</a>
							<ul>
								<li><a href="#">입출금통장</a></li>
								<li><a href="#">복리정기예금</a></li>
								<li><a href="freeFunds.jsp">복리자유적금</a></li>
								<li><a href="#">연10% 이자주는 자유적금</a></li>
							</ul>
						</li>
						<li>
							<a href="#">대출</a>
							<ul>
								<li><a href="#">중금리신용대출</a></li>
								<li><a href="#">마이너스통장대출</a></li>
								<li><a href="#">소액마이너스대출</a></li>
							</ul>
						</li>
						<li>
							<a href="#">카드</a>
							<ul>
								<li><a href="#">PAY백 체크카드</a></li>
							</ul>
						</li>
						<li>
							<a href="#">내신용관리</a>
							<ul>
								<li><a href="#">내신용정보</a></li>
							</ul>
						</li>
			    	</ul>
			    </li>
			    <li>	
			    	<a href="#">펭귄뱅크</a>
			    	<ul>
						<li><a href="#">브랜드소개</a></li>
						<li><a href="#">윤리경영</a></li>
						<li><a href="#">홍보/미디어</a></li>
						<li><a href="#">오시는길</a></li>
						<li><a href="#">제휴문의</a></li>
			    	</ul>
			    </li>
			    <li><a href="faq.jsp">고객센터</a>
					<ul>
						<li><a href="#">고객상담</a>
						<li>
							<a href="#">이용안내</a>
							<ul>
								<li><a href="faq.jsp">자주묻는질문</a></li>	
								<li><a href="userGuide.jsp">이용가이드</a></li>	
							</ul>
						</li>
						<li>
							<a href="#">약관 및 서식</a>
							<ul>
								<li><a href="#">약관</a></li>	
								<li><a href="#">서식</a></li>
								<li><a href="#">상품설명서</a></li>	
								<li><a href="#">상품공시</a></li>	
							</ul>
						</li>
						<li><a href="#">인증서 복사</a></li>
						<li><a href="#">증명서 발급 내역</a></li>
					</ul>
		        </li>
		        <li><a href="complaintsReceived.jsp">소비자보호/민원</a>
		        	<ul>
						<li><a href="complaintsReceived.jsp">민원접수</a></li>
						<li>
							<a href="#">소비자보호</a>
							<ul>
								<li><a href="#">소비자보호헌장</a></li>	
								<li><a href="#">금융소비자보호체계</a></li>
								<li><a href="#">개인정보보호</a></li>	
								<li><a href="#">위탁제공현황</a></li>
								<li><a href="#">금융생활가이드</a></li>
								<li><a href="#">채권추심가이드라인</a></li>
								<li><a href="#">이용자유의사항</a></li>
								<li><a href="#">개인정보열람청구</a></li>
								<li><a href="#">금융주소한번에</a></li>	
							</ul>
						</li>
		        	</ul>
		        </li>
		        <li><a href="${pageContext.request.contextPath}/noticeList.do">새소식</a>
		          <ul>
		            <li><a href="${pageContext.request.contextPath}/noticeList.do">공지사항</a></li>
	              	<li><a href="${pageContext.request.contextPath}/event.do">이벤트</a></li>
		          </ul>
		        </li>
		      </ul>
   			</div>
	      
		</nav>	
	</div>
