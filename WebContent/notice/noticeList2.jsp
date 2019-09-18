<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/header.jsp" />

<%
	String ctx=request.getContextPath();
%>

<section id="noticeSection" class="section">
	<div class="titleWrap">
		<h2 class="mainTitle inlineBlock">공지사항</h2>
		<div class="titleLocationWrap fRight inlineBlock">
			<a href="noticeList.do"><img src="./images/homeBtn.png" class="top" alt="홈"></a>
			<span class="titleLocation">&nbsp;  /  &nbsp;  새소식  &nbsp;  /  &nbsp;  공지사항</span>
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
	<form name="pf" id="pf" action="noticeList.do" enctype="multipart/form-data">
				<input type="hidden" name="cpage" value="${cpage}" >
			</form>
		<p class="dPadding">총 <span class="purplePoint">${totalCount}</span>개의 글이 있습니다.</p>
		
		<table class="table table-condensed table-striped">
			<tr >
				<th>NO</th>
				<th>제목</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
			<!-- ---------------------------- -->
			
			<c:if test="${noticeArr==null or empty noticeArr}">
				<tr>
					<td colspan="4"><b>게시글이 없습니다.</b></td>
				</tr>
			</c:if>
			<c:if test="${noticeArr !=null and not empty noticeArr}">
			<c:forEach var="notice" items="${noticeArr}">
				<tr style=text-align: center;">
					<td>
						${notice.rn}
					</td>
					<td align="left">
					
					<a href="noticeView.do?nnum=${notice.nnum}">					
					<c:out value="${notice.title }"/>
					</a></td>
					<td>	
						${notice.ndate}
					</td>
					<td>
						<c:if test="${notice.vnum eq null}">
							0
						</c:if>
						<c:if test="${notice.vnum ne null}">
							${notice.vnum}
						</c:if>
					</td>
				</tr>
				</c:forEach>
				</c:if>
				
				
			<!-- ----------------------------- -->
				
			<tr>
				<td colspan="3" class="text-center">
				<c:set var="qstr" value="&findType=${findType}&findKeyword=${findKeyword}"/>				
				<ul class="pagination">
					<c:if test="${prevBlock>0}">
						<li><a href="noticeList.do?cpage=${prevBlock}${qstr}">이전 ${pagingBlock}개</a></li>
					</c:if>
				
				 <c:forEach  var="i" begin="${prevBlock+1}" end="${nextBlock-1}"> 
				<!-- 마지막에 오버되는 페이지 잘라내기    -->
					<c:if test="${i<=pageCount}">
					
					<li style="float:left"
					<c:if test="${cpage eq i}">
						class='active'
					</c:if>
					><button class="mypagingBtn"  onclick="location.href='noticeList.do?cpage=${i}${qstr}'">${i}</button></li>
					
					</c:if>
					
				</c:forEach>
				
					<c:if test="${nextBlock<=pageCount}">
						<li><a href="noticeList.do?cpage=${nextBlock}${qstr}">이후</a></li>
					</c:if>
				</ul>
				</td>
				<td class="text-danger" style="font-weight:bold" >
				 <span>${cpage }</span>
				 /${pageCount} pages
				</td>
			</tr>
		</table>
		<div class="rightBtnWrap fRight uMargin">
			<button class="middleBtn" onclick="location.href='noticeForm.do'">글쓰기</button>
		</div>
		</div>
		</div>
		
		</section>	



<jsp:include page="/footer.jsp" />

