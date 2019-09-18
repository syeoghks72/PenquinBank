<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- //1. 로그인 했는지 여부를 먼저 체크 -->
<%@ include file="/login/loginCheckModule.jsp" %>
<%
	//2. 로그인을 했다면 관리자 아이디와 동일한지 체크
	if(!member.getEmail().equals("KUKU")){
		%>
		<script>
			alert('관리자 아이디가 아닙니다.');
			history.back();
		</script>
		<%
		return;
	}
%>