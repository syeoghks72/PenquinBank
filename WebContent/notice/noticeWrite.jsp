<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/header.jsp" />

<script type="text/javascript">
	$(function() {
		$('#btnWrite').click(function() {
			if (!$('#title').val()) {
				alert('글제목을 입력하세요');
				$('#title').focus();
				return;
			}
			$('#bf').submit();
		});
	});
</script>

<section id="noticeWriteSection" class="section">
	<div class="titleWrap">
		<h2 class="mainTitle inlineBlock">공지사항 글쓰기</h2>
		<div class="titleLocationWrap fRight inlineBlock">
			<a href="main.jsp"><img src="./images/homeBtn.png" class="top" alt="홈"></a>
			<span class="titleLocation">&nbsp;  /  &nbsp;  새소식  &nbsp;  /  &nbsp;  공지사항</span>
		</div>
	</div>
	<div class="container">
		<form name="bf" id="noticeWriteForm" 
		 class="formWrap noPadding" action="noticeInsert.do" name="f" method="post" enctype="multipart/form-data">
			<div class="tableWrap">
				<table class="table">
					<tr>
						<td class="tableHeader">제목</td>
						<td><input type="text" name="title" id="title"></td>
						
					</tr>
					<tr>
						<td class="tableHeader">내용</td>
						<td>
							<textarea name="contents" id="contents" class="noticeWriteTextarea"></textarea>
						</td>
					</tr>
					<tr>
						<td class="tableHeader">첨부파일</td>
						<td>
							<div class="fileInput">
							    <label class="fLeft">파일첨부
							        <input type="file" class="fLeft" id="fname" name="fname" 
							        onchange="javascript:document.getElementById('fileRoute').value=this.value">
							    </label>
							    <input type="text" class="fLeft" readonly="readonly" 
							    title="File Route" id="fileRoute">
							</div>
						</td>
					</tr>
				</table>
				<div class="btnWrap center">
					<button type="reset" class="borderMiddleBtn">다시쓰기</button>
					<button  id="btnWrite" class="middleBtn">작성완료</button>
				</div>
			</div>
		</form>	
		
	</div>
</section>

<jsp:include page="/footer.jsp" />
