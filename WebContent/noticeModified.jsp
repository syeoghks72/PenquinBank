<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/header.jsp" />

<section id="noticeWriteSection" class="section">
	<div class="titleWrap">
		<h2 class="mainTitle inlineBlock">공지사항 수정하기</h2>
		<div class="titleLocationWrap fRight inlineBlock">
			<a href="main.jsp"><img src="./images/homeBtn.png" class="top" alt="홈"></a>
			<span class="titleLocation">&nbsp;  /  &nbsp;  새소식  &nbsp;  /  &nbsp;  공지사항</span>
		</div>
	</div>
	<div class="container">
		<form id="noticeWriteForm" class="formWrap noPadding" name="f" action="/notice.jsp" method="post">
			<div class="tableWrap">
				<table class="table">
					<tr>
						<td class="tableHeader">제목</td>
						<td><input type="text" name="title"value="${notice.title}"  class="form-control"></td>
					</tr>
					<tr>
						<td class="tableHeader">내용</td>
						<td>
						<img src="images/noticeDetail01.jpg">
							<textarea name="content" id="contnt" class="noticeWriteTextarea">
							${notice.contents}
							</textarea>
						</td>
					</tr>
					<tr>
					
			<td style="width: 20%"><b>첨부파일</b></td>
			<td style="width: 80%">
			<div>
				${notice.filename} [${notice.filesize} bytes]
				<input type="hidden" name="oldfile" value="${notice.filename}">
				<!-- 기존에 업로드했던 파일을 hidden으로 넘기자. -->
			</div>
			
			<input type="file" name="filename"
				id="filename" class="form-control"></td>
		</tr>
				</table>
				<div class="btnWrap center">
					<button type="reset" class="borderMiddleBtn">다시쓰기</button>
				<button type="button" id="btnWrite" class="btn btn-success">글수정</button>
				</div>
			</div>
		</form>	
		
	</div>
</section>

<jsp:include page="/footer.jsp" />
