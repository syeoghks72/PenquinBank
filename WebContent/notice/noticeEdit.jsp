<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/header.jsp" />

<script type="text/javascript">
	$(function() {
		 $('#btn').click(function() {
			$('#n').submit();
		}); 
	});
</script>
<section id="noticeWriteSection" class="section">
	<div class="titleWrap">
		<h2 class="mainTitle inlineBlock">공지사항 수정하기</h2>
		<div class="titleLocationWrap fRight inlineBlock">
			<a href="main.jsp"><img src="./images/homeBtn.png" class="top" alt="홈"></a>
			<span class="titleLocation">&nbsp;  /  &nbsp;  새소식  &nbsp;  /  &nbsp;  공지사항</span>
		</div>
	</div>
	<div class="container">
		<form id="n" name="noticeWriteForm" class="formWrap noPadding" name="f" 
		action="noticeEditEnd.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="nnum" style="font-weight:bold"  value="${notice.nnum}">
		<input type="text" style="font-weight:bold;text-align: center;font-size: 2em"  value="${notice.nnum}번 글을 수정합니다.">
			<div class="tableWrap">
				<table class="table">
					<tr>
						<td class="tableHeader" >제목</td>
						<td ><input type="text" name="title"value="${notice.title}"  class="form-control"></td>
					</tr>
					<tr>
						<td class="tableHeader">글내용</td>
						<td>
							<textarea name="contents" id="contnt" class="noticeWriteTextarea">${notice.contents}</textarea>
						</td>
					</tr>
					<tr>
			<tr>		
			<td style="width: 20%"><b>첨부파일</b></td>
			<td style="width: 80%">
			<div>
				${fileinfo.fname} [${fileinfo.fsize} bytes]
				<input type="hidden" name="oldfile" value="${fileinfo.fname}">
				<!-- 기존에 업로드했던 파일을 hidden으로 넘기자. -->
			</div>
			
			<input type="file" name="fname"
				id="fname" class="form-control"></td>
				</tr>
	
				</table>
				<div class="btnWrap center">
				<button id="btn" class="borderMiddleBtn">글수정</button>
				</div>
			</div>
		</form>	
		
	</div>
</section>

<jsp:include page="/footer.jsp" />
