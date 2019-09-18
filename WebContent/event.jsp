<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/header.jsp" />

<section id="eventSection" class="section">
	<div class="titleWrap">
		<h2 class="mainTitle inlineBlock">이벤트</h2>
		<div class="titleLocationWrap fRight inlineBlock">
			<a href="main.jsp"><img src="./images/homeBtn.png" class="top" alt="홈"></a>
			<span class="titleLocation">&nbsp;  /  &nbsp;  새소식  &nbsp;  /  &nbsp;  이벤트</span>
		</div>
	</div>
	<div class="container">
		<!-- 공지사항 사이드 메뉴 -->
		<div class="sideMenuContainer fLeft inlineBLock bgWhite"> 
			<ul class="menu inlineBlock"> 
				<li rel="tab1" id="faq" class="menuitem active">
					<a href="${pageContext.request.contextPath}/noticeList.do">공지사항</a>
				</li> 
				<li rel="tab2" id="event" class="menuitem">
					<a href="${pageContext.request.contextPath}/event.do">이벤트</a>
				</li> 
			</ul> 
			<div class="slidingBar"></div> 
		</div>
		
		<div class="tabContentWrap inlineBlock bgWhite">	
			<!-- 서브 타이틀 -->
			<h3 class="subTitle">이벤트</h3>
			
			<div class="tabWrap">
				<ul class="tabLine">
					<li rel="tab1" class="active">진행중인 이벤트</li>
					<li rel="tab2">종료된 이벤트</li>
				</ul>
			</div>
			
			<!-- tab1 -->
			<div id="tab1" class="tabContent">
				<div class="boxWrap uMargin">
				
					<div class="boxRecord">
						<div id="box1" class="box fLeft">
							<a href="#">
								<img src="./images/event10.jpg" alt="이벤트이미지">
							</a>
							<div class="textBox">
								<p class="tag mainColor">#주식계좌 #한국투자증권</p>
								<h3 class="blackPoint udPadding">
									<a href="#">
										펭귄벵크 주식계좌 개설하기 신규 이벤트
									</a>
								</h3>
								<p class="date grey">2019.06.10 ~ 07.31</p>
							</div>
						</div>
						<div id="box2" class="box lastBox">
							<a href="#">
								<img src="./images/event11.jpg" alt="이벤트이미지">
							</a>
							<div class="textBox">
								<p class="tag mainColor">#체크카드 #캐시백 #시즌4</p>
								<h3 class="blackPoint udPadding">
									<a href="#">
										펭귄뱅크 프렌즈 체크카드 매월 최대 7만원의 추가 혜택
									</a>
								</h3>
								<p class="date grey">2019.06.10 ~ 07.31</p>
							</div>
						</div>
					</div>
					<div class="boxRecord">
						<div id="box3" class="box fLeft">
							<a href="#">
								<img src="./images/event06.jpg" alt="이벤트이미지">
							</a>
							<div class="textBox">
								<p class="tag mainColor">#계좌결제 #추가적립 #L.pay</p>
								<h3 class="blackPoint udPadding">
									<a href="#">
										[카카오뱅크 X L.pay] 쓰는대로 2% L.POINT 무한 추가 적립
									</a>
									
								</h3>
								<p class="date grey">2019.06.10 ~ 07.31</p>
							</div>
						</div>
						<div id="box4" class="box lastBox">
							<a href="#">
								<img src="./images/event07.jpg" alt="이벤트이미지">
							</a>
							<div class="textBox">
								<p class="tag mainColor">#주식계좌 #한국투자증권</p>
								<h3 class="blackPoint udPadding">
									<a href="#">
										펭귄벵크 주식계좌 개설하기 신규 이벤트
									</a>
								</h3>
								<p class="date grey">2019.06.10 ~ 07.31</p>
							</div>
						</div>
					</div>
					<div class="boxRecord">
						<div id="box5" class="box fLeft">
							<a href="#">
								<img src="./images/event08.jpg" alt="이벤트이미지">
							</a>
							<div class="textBox">
								<p class="tag mainColor">#체크카드 #캐시백 #시즌4</p>
								<h3 class="blackPoint udPadding">
								<a href="#">
									펭귄뱅크 프렌즈 체크카드 매월 최대 7만원의 추가 혜택
								</a>	
								</h3>
								<p class="date grey">2019.06.10 ~ 07.31</p>
							</div>
						</div>
						<div id="box6" class="box lastBox">
							<a href="#">
								<img src="./images/event09.jpg" alt="이벤트이미지">
							</a>
							<div class="textBox">
								<p class="tag mainColor">#계좌결제 #추가적립 #L.pay</p>
								<h3 class="blackPoint udPadding">
									<a href="#">
										[카카오뱅크 X L.pay] 쓰는대로 2% L.POINT 무한 추가 적립
									</a>		
								</h3>
								<p class="date grey">2019.06.10 ~ 07.31</p>
							</div>
						</div>
					</div>
					<div class="boxRecord">
						<div id="box7" class="box fLeft">
							<a href="#">
								<img src="./images/event07.jpg" alt="이벤트이미지">
							</a>
							<div class="textBox">
								<p class="tag mainColor">#주식계좌 #한국투자증권</p>
								<h3 class="blackPoint udPadding">
									<a href="#">
										펭귄벵크 주식계좌 개설하기 신규 이벤트
									</a>
								</h3>
								<p class="date grey">2019.06.10 ~ 07.31</p>
							</div>
						</div>
						<div id="box8" class="box lastBox">
							<a href="#">
								<img src="./images/event08.jpg" alt="이벤트이미지">
							</a>
							<div class="textBox">
								<p class="tag mainColor">#체크카드 #캐시백 #시즌4</p>
								<h3 class="blackPoint udPadding">
									<a href="#">
										펭귄뱅크 프렌즈 체크카드 매월 최대 7만원의 추가 혜택
									</a>
								</h3>
								<p class="date grey">2019.06.10 ~ 07.31</p>
							</div>
						</div>
					</div>
					<div class="boxRecord">
						<div id="box9" class="box fLeft">
							<a href="#">
								<img src="./images/event09.jpg" alt="이벤트이미지">
							</a>
							<div class="textBox">
								<p class="tag mainColor">#주식계좌 #한국투자증권</p>
								<h3 class="blackPoint udPadding">
									<a href="#">
										펭귄벵크 주식계좌 개설하기 신규 이벤트
									</a>
								</h3>
								<p class="date grey">2019.06.10 ~ 07.31</p>
							</div>
						</div>
						<div id="box10" class="box lastBox">
							<a href="#">
								<img src="./images/event10.jpg" alt="이벤트이미지">
							</a>
							<div class="textBox">
								<p class="tag mainColor">#체크카드 #캐시백 #시즌4</p>
								<h3 class="blackPoint udPadding">
									<a href="#">
										펭귄뱅크 프렌즈 체크카드 매월 최대 7만원의 추가 혜택
									</a>
								</h3>
								<p class="date grey">2019.06.10 ~ 07.31</p>
							</div>
						</div>
					</div>
					<div class="boxRecord">
						<div id="box11" class="box fLeft">
							<a href="#">
								<img src="./images/event11.jpg" alt="이벤트이미지">
							</a>
							<div class="textBox">
								<p class="tag mainColor">#주식계좌 #한국투자증권</p>
								<h3 class="blackPoint udPadding">
									<a href="#">
										펭귄벵크 주식계좌 개설하기 신규 이벤트
									</a>		
								</h3>
								<p class="date grey">2019.06.10 ~ 07.31</p>
							</div>
						</div>
						<div id="box12" class="box lastBox">
							<a href="#">
								<img src="./images/event12.jpg" alt="이벤트이미지">
							</a>
							<div class="textBox">
								<p class="tag mainColor">#체크카드 #캐시백 #시즌4</p>
								<h3 class="blackPoint udPadding">
									<a href="#">
										펭귄뱅크 프렌즈 체크카드 매월 최대 7만원의 추가 혜택
									</a>
								</h3>
								<p class="date grey">2019.06.10 ~ 07.31</p>
							</div>
						</div>
					</div>
				</div>
				
				<div class="pagingBtnArea">
					<div class="pagingBtnWrap">
						<button class="preBtn">
							<img src="./images/preBtn.png" alt="이전">
						</button>
						<button class="pagingBtn">1</button>
						<button class="pagingBtn">2</button>
						<button class="pagingBtn">3</button>
						<button class="nextBtn">
							<img src="./images/nextBtn.png" alt="다음">
						</button>
					</div>
				</div>
			</div>

			<!-- tab2 -->
			<div id="tab2" class="tabContent">
				<div class="boxWrap uMargin">
					<div class="boxRecord">
						<div id="box1" class="box fLeft">
							<a href="#">
								<img src="./images/event10.jpg" alt="이벤트이미지">
							</a>
							<div class="textBox">
								<p class="tag mainColor">#주식계좌 #한국투자증권</p>
								<h3 class="blackPoint udPadding">
									<a href="#">
										펭귄벵크 주식계좌 개설하기 신규 이벤트
									</a>
								</h3>
								<p class="date grey">2019.06.10 ~ 07.31</p>
							</div>
						</div>
						<div id="box2" class="box lastBox">
							<a href="#">
								<img src="./images/event11.jpg" alt="이벤트이미지">
							</a>
							<div class="textBox">
								<p class="tag mainColor">#체크카드 #캐시백 #시즌4</p>
								<h3 class="blackPoint udPadding">
									<a href="#">
										펭귄뱅크 프렌즈 체크카드 매월 최대 7만원의 추가 혜택
									</a>
								</h3>
								<p class="date grey">2019.06.10 ~ 07.31</p>
							</div>
						</div>
					</div>
						
					<div class="pagingBtnArea">
						<div class="pagingBtnWrap">
							<button class="preBtn">
								<img src="./images/preBtn.png" alt="이전">
							</button>
							<button class="pagingBtn">1</button>
							<button class="pagingBtn">2</button>
							<button class="pagingBtn">3</button>
							<button class="nextBtn">
								<img src="./images/nextBtn.png" alt="다음">
							</button>
						</div>
					</div>
				</div>
				
			</div><!-- tabContentWrap -->
		</div>
	</div>
</section>

<jsp:include page="/footer.jsp" />