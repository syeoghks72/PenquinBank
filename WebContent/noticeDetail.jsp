<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/header.jsp" />

<section id="noticeDetailSection" class="section">
	<div class="titleWrap">
		<h2 class="mainTitle inlineBlock">공지사항</h2>
		<div class="titleLocationWrap fRight inlineBlock">
			<a href="main.jsp"><img src="./images/homeBtn.png" class="top" alt="홈"></a>
			<span class="titleLocation">&nbsp;  /  &nbsp;  새소식  &nbsp;  /  &nbsp;  공지사항</span>
		</div>
	</div>
	
	<div class="container">
		<div class="tableWrap">
			<table class="table">
				<tr>
					<th class="blackPoint">10%자유적금 2차 앙코르 이벤트 안내새 게시물</th>
					<th class="date fRight">2019.06.21</th>
				</tr>
				<tr>
					<td colspan="2">
						<img src="images/noticeDetail01.jpg">
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

※ '8% 우대금리쿠폰'은 '자유적금' 상품에 한하여 본인만 사용 가능하며, 쿠폰유효기간(상품가입기간)이 경과한 이후에는 사용이 불가능합니다.
※ '자유적금' 상품을 중도해지한 경우 재가입은 할 수 없으며, 이미 사용된 우대금리쿠폰의 경우에도 재발행이 불가합니다.
※ 특판 이벤트 세부 내용은 내부사정에 의해 변경될 수 있으며, 변경될 경우 사전에 APP/홈페이지 등을 통해 안내드립니다.

 고객님께 놀라운 혜택을 드리기 위해 언제나 최선을 다하겠습니다. 
						</pre>
					</td>
				</tr>
				<tr>
					<td colspan="2">첨부파일
						<span class="fileWrap lPadding">
							<img src="./images/fileIcon.png" alt="첨부파일 아이콘">
							<a href="#" class="fileName">image01.jpg</a>
							<a href="#" class="fileSize lPadding">120MB</a>
						</span>
						<span class="fileWrap lPadding">
							<img src="./images/fileIcon.png" alt="첨부파일 아이콘">
							<a href="#" class="fileName">image02.jpg</a>
							<a href="#" class="fileSize lPadding">170MB</a>
						</span>
						<span class="fileWrap lPadding">
							<img src="./images/fileIcon.png" alt="첨부파일 아이콘">
							<a href="#" class="fileName">image03.jpg</a>
							<a href="#" class="fileSize lPadding">95MB</a>
						</span>
					</td>
				</tr>
			</table>
			<div class="btnWrap">
				<div class="leftBtnWrap fLeft">
					<button class="borderMiddleBtn preBtn" onclick="location.href='noticeModified.jsp'">수정</button>
					<button class="borderMiddleBtn nextBtn" onclick="location.href='noticeDelete.jsp'">삭제</button>
				</div>
				<div class="rightBtnWrap fRight">
					<button class="middleBtn" onclick="location.href='notice.jsp'">목록으로</button>
				</div>
			</div>
			
		</div>
	</div>
</section>
	
<jsp:include page="/footer.jsp" />