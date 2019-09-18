<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- jstl예제는 MVC Project의 boardView를 참고하자 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<button>${val}</button>
	
	<c:if test="${ifval ne null}">
		<button>${ifval}</button>
	</c:if>
	
	<c:if test="${ifval eq null}">
		<button>넘어온값이 없어요!!</button>
	</c:if>
	
	터허이

</body>
</html>