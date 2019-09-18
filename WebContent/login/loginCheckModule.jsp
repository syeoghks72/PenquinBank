<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.*"%>
<!-- loginCheckModule.jsp -->
<%
	//로그인 여부를 체크하는 모듈
	//=> 회원 인증이 필요한 페이지에서는 이 모듈을 include하여 사용한다.
	MemberVO member=(MemberVO)session.getAttribute("loginUser");
	
	if(member==null){
		%>
		<script>
			alert('로그인 해야 이용할 수 있어요');
			console.log('dsdf');
			location.href='${pageContext.request.contextPath}' + '/login.do';
		</script>
		<%
		return;
	}
%>
