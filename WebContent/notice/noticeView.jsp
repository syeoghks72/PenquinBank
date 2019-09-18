<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:import url="/header.jsp" />

<section id="noticeDetailSection" class="section">
	<div class="titleWrap">
		<h2 class="mainTitle inlineBlock">공지사항</h2>
		<div class="titleLocationWrap fRight inlineBlock">
			<a href="main.jsp"><img src="./images/homeBtn.png" class="top" alt="홈"></a>
			<span class="titleLocation">&nbsp;  /  &nbsp;  새소식  &nbsp;  /  &nbsp;  공지사항</span>
		</div>
	</div>
	
	<div class="container">
		<!-- 공지사항 사이드 메뉴 -->
		<div class="sideMenuContainer fLeft inlineBLock bgWhite"> 
			<ul class="menu inlineBlock"> 
				<li rel="tab1" id="faq" class="menuitem active">
					<a href="noticeList.do">공지사항</a>
				</li> 
				<li rel="tab2" id="event" class="menuitem">
					<a href="event.jsp">이벤트</a>
				</li> 
			</ul> 
			<div class="slidingBar"></div> 
		</div>
		
		<div class="tabContentWrap inlineBlock bgWhite">	
			<!-- 서브 타이틀 -->
			<h3 class="subTitle">공지사항</h3>
			
			<div class="tableWrap">
				<table class="table">
					<tr>
						<th class="blackPoint"><c:out value="${notice.title }"/></th>
						<th class="date"><c:out value="${notice.ndate }"/></th>
						<th class="date"><c:out value="${notice.vnum}"/></th>
					</tr>
					<tr>
						<td colspan="3">
							<pre class="uPadding"><c:out value="${notice.contents}"/></pre>
						</td>
					</tr>
					<tr>
					<td>첨부파일</td>
					<td>
					<c:forEach var="fileinfo" items="${fileList}">
					<c:if test="${fileinfo.fname ne null }">
						<a href="<%=request.getContextPath()%>/FileDown.do?filename=${fileinfo.fname}">
								<!--FileDownloadServlet 과 매핑된 FileDown을 걸어주자.  -->
						<c:out value="${fileinfo.fname}"/>
						</a> [ <c:out value="${fileinfo.fsize}"/>bytes]  
						<c:if test="${fn:endsWith(fileinfo.fname,'.jpg') or fn:endsWith(fileinfo.fname,'.png')}">
							<img width="80px" class="img img-thumbnail"
							 src="notice/Upload/${fileinfo.fname}">
					  </c:if>
					</c:if>		 
					</c:forEach>
				</td>
					</tr>
				</table>
				<div class="btnWrap">
					<div class="leftBtnWrap fLeft">
					<button class="borderMiddleBtn nextBtn" onclick="location.href='noticeEdit.do?nnum=${notice.nnum}'">수정</button>
					<button class="borderMiddleBtn nextBtn" onclick="location.href='noticeDel.do?nnum=${notice.nnum}'">삭제</button>
					</div>
					<div class="rightBtnWrap fRight">
						<button class="middleBtn" onclick="location.href='noticeList.do'">목록</button>
					</div>
				</div>
			</div>
			
		</div><!-- tabContentWrap -->
	</div>
	</section>

<jsp:include page="/footer.jsp" />