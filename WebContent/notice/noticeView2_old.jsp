<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:import url="/header.jsp" />

<form enctype="multipart/form-data">
<div class="section">
<div class="row">
	<div class="col-md-8 col-md-offset-2">

	<c:if test="${notice eq null }">
	<!-- eq연산자(==와 동일한 연산자), ne(not equal !=와 동일한 의미 -->	
		<h3>존재하지 않는 글입니다.</h3>
		</c:if>
		<c:if test="${notice ne null }">
	<table class="table table-bordered">
		<tr>
			<td width="20%">글번호</td>
			<td width="30%">
				<c:out value="${notice.nnum}"/>
			</td>
			<td width="20%">작성일</td>
			<td width="30%" >
				<c:out value="${notice.ndate }"/>
			</td>
		</tr>
		<tr>
			<td width="20%">조회수</td>
			<td width="30%">
				<c:out value="${notice.vnum}"/>
			</td>
		</tr>

		<tr>
			<td width="20%">제목</td>
			<td colspan="3" align="left">
				<c:out value="${notice.title }"/>
			</td>
		</tr>
		<tr height="60">
			<td width="20%">글내용</td>
			<td colspan="3" align="left">
				<pre><c:out value="${notice.contents}"/></pre>
			</td>
		</tr>
		<tr>
			<td width="20%">첨부파일</td>
			<td colspan="3">
			<c:forEach var="fileinfo" items="${fileList}">
			<c:if test="${fileinfo.fname ne null }">
				<a href="<%=request.getContextPath()%>/FileDown?filename=${fileinfo.fname}">
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
		<tr style="font-weight:bold;font-size: 2em;" >
			<td colspan="4" align=center>
			<a href="noticeForm.do">글쓰기</a>|
			<a href="noticeList.do">목록</a>| <a
			   href="noticeEdit.do?nnum=${notice.nnum}">편집</a>| <a
			   href="noticeDel.do?nnum=${notice.nnum}">삭제</a>
		</tr>

	</table>
	</c:if>
			</div>
	</div>	

</div>
<script type="text/javascript">

	
</script>
</form>
<c:import url="/footer.jsp" />

