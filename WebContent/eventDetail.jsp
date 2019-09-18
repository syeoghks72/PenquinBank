<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/header.jsp" />

<section id="eventDetailSection" class="section">
	<div class="titleWrap">
		<h2 class="mainTitle inlineBlock">이벤트</h2>
		<div class="titleLocationWrap fRight inlineBlock">
			<a href="main.jsp"><img src="./images/homeBtn.png" class="top" alt="홈"></a>
			<span class="titleLocation">&nbsp;  /  &nbsp;  새소식  &nbsp;  /  &nbsp;  이벤트</span>
		</div>
	</div>
	
	<div class="container">
		<!-- 이벤트 사이드 메뉴 -->
		<div class="sideMenuContainer fLeft inlineBLock bgWhite"> 
			<ul class="menu inlineBlock"> 
				<li rel="tab1" id="faq" class="menuitem active">
					<a href="notice.jsp">공지사항</a>
				</li> 
				<li rel="tab2" id="event" class="menuitem">
					<a href="event.jsp">이벤트</a>
				</li> 
			</ul> 
			<div class="slidingBar"></div> 
		</div>
		
		<div class="tabContentWrap inlineBlock bgWhite">	
			<!-- 서브 타이틀 -->
			<h3 class="subTitle">이벤트</h3>
			
			<div class="tableWrap">
				<table class="table">
					<tr>
						<th class="blackPoint left">펭귄벵크 주식계좌 개설하기 신규 이벤트</th>
						<th class="tag mainColor small">#주식계좌 #한국투자증권</th>
						<th class="date">2019.06.10 ~ 07.31</th>
					</tr>
					<tr>
						<td colspan="3" class="left">
							<pre class="uPadding">
안녕하세요, 펭귄뱅크입니다.

1차 10% 자유적금에 대한 성원에 감사드리며, 2차로 자유적금 특판을 진행합니다. 
2차 10%자유적금은 선착순이 아니라 추첨제 방식으로 진행됩니다. 
 
● 응모대상 : 입출금통장 가입 고객 중 5,000명 추첨 (1차 10% 자유적금 가입고객은 제외)
● 입출금통장 가입기간 : 2019년 6월 24 ~ 8월 11일 까지
● 당첨자발표 : 2019년 8월 14일 오전 10시
● 적금가입기간 : 2019년 8월 14일 ~ 9월 2일 까지
● 적금가입방법 : 상품가입 시 8% 우대금리쿠폰 선택

<span class="purple">'전체메뉴 > 혜택 > 쿠폰함'</span>을 통해 우대금리쿠폰을 확인 할 수 있습니다.
 
 자세한 내용은 이벤트 또는 상품안내 페이지에서 확인하실 수 있습니다.

※ '8% 우대금리쿠폰'은 '자유적금' 상품에 한하여 본인만 사용 가능하며, 
쿠폰유효기간(상품가입기간)이 경과한 이후에는 사용이 불가능합니다.

※ '자유적금' 상품을 중도해지한 경우 재가입은 할 수 없으며, 
이미 사용된 우대금리쿠폰의 경우에도 재발행이 불가합니다.

※ 특판 이벤트 세부 내용은 내부사정에 의해 변경될 수 있으며, 
변경될 경우 사전에 APP/홈페이지 등을 통해 안내드립니다.

고객님께 놀라운 혜택을 드리기 위해 언제나 최선을 다하겠습니다. 
							</pre>
						</td>
					</tr>
				</table>
				<div class="btnWrap center">
					<div>
						<button class="middleBtn" onclick="location.href='notice.jsp'">목록으로</button>
					</div>
				</div>
			</div>
			
		</div><!-- tabContentWrap -->
	</div>
</section>
	
<jsp:include page="/footer.jsp" />