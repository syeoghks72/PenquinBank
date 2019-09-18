<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/header.jsp" />
<script type="text/javascript">
	$(function(){
		$('#btnNotice').click(function(){		
		var md=$('#mode').val();
		//alert(typeof md);
		if(md=='1'){
			//편집
			$('#pF').prop('action','noticeEdit.do');
		}else if(md=='2'){
			//삭제
			$('#pF').prop('action','noticeDel.do');
		}
		$('#pF').prop('method','POST');//비번이 있기 때문에 post로 가야함
		$('#pF').submit();
	})//click end-----		
})	//$() end----
</script>
<div class="row">
	<div class="col-md-10 col-md-offset-1 text-center">
		<h1>${title}</h1>
		<form name="pF" id="pF" class="form-inline">
			<input type="hidden" name="mode" id="mode" value="${mode}">
			<input type="hidden" name="idx" id="idx" value="${nnum}">
			<button type="button" id="btnNotice" class="btn btn-primary">${title}</button>		
		</form>
	</div>
</div>
<jsp:include page="/footer.jsp"/>