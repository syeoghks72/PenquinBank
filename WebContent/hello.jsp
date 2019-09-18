<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type='text/javascript' src='<%=request.getContextPath()%>/js/jquery-3.4.1.min.js'></script>
<%-- core태그 라이브러리. 주로 제어문들이 있음 --%>
<%-- View페이지에서는 주로 JSTL 태그라이브러리를 이용해
간단한 제어문을 구현한다.
이때 출력문은 el표현식을 사용 
http://jakarta.apache.org ==> Taglib

jar파일 4개 => 컨텍스트/WEB-INF/lib 아래 둔다.
--%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 50%; /* Could be more or less, depending on screen size */                          
        }
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

</style>
<script>
$(function() {
	// Get the modal
	var modal = document.getElementById('myModal');

	// Get the button that opens the modal
	var btn = document.getElementById("myBtn");

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];                                          

	// When the user clicks on the button, open the modal 
	btn.onclick = function() {
	    modal.style.display = "block";
	}

	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
	    modal.style.display = "none";
	}

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	    if (event.target == modal) {
	        modal.style.display = "none";
	    }
	}
})


</script>
<title>Insert title here</title>
</head>
<body>
	<h1>Hello MyMVC~</h1>
	<c:if test="${msg != null}">	
		<h2 style="color:red"><%=request.getAttribute("msg") %></h2>
		<h2 style="color:green">${msg}</h2><!-- el표현식. msg의 값을 출력해줌 -->
	</c:if>
	
	    <button id="myBtn">Open Modal</button>
 
    <!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
        <span class="close">&times;</span>                                                               
        <p>Some text in the Modal..</p>
      </div>
 
    </div>
	
</body>
</html>