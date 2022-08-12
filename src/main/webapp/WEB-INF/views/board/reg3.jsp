<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<%@ include file="../includes/header.jsp" %> 
    
<link href="/resources/dist/css/headers.css" rel="stylesheet">
<link href="/resources/dist/css/community.css" rel="stylesheet">
<link href="/resources/dist/css/reg.css" rel="stylesheet">
<link href="/resources/dist/css/bootstrap.css" rel="stylesheet">    
    
<nav class="container">
  <img src="/resources/image/re.png" id="re">
</nav>

<body  class="container">
	<form id="register-form" action="/board/reg3" method="post">
  		<br>
  		<br>
  		<h1>회사 평가 게시판</h1>
  		<hr>
  		<br>
  		<div class="btn-reg">
  			<button type="submit" style="border-radius: 5px;">등록</button>
		</div>
  		<input type="text" name="title" placeholder="글제목을 입력하세요" style="width: 1200px;">
		<br>
		<br>
  		<!-- <input type="file"> -->
		<br>
		<br>
  		<textarea name="content" style="width: 1400px; height: 1200px; resize: none;"></textarea>
  	</form>
  	
<script type="text/javascript">

$(document).ready(function () {
	var count = 1;
	
	/* function fn_addFile() {
		$("#d_file").append("<br>"+"<input type='file' name='file"+count+"'/>");
		count++;
	};
		
		var registerForm = $("#register-form");
		var registerTitle = registerForm.title.value;
		var registerContent = registerForm.content.value;
		
 		$("#register-btn").on("click", function () {
			if(!registerTitle || !registerContent){
				alert("제목과 내용을 모두 작성해주세요.");
			}else{
				registerForm.submit();
			}
		});  */
});

</script>