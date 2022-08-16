<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../includes/header.jsp" %> 
    
<link href="/resources/dist/css/headers.css" rel="stylesheet">
<link href="/resources/dist/css/community.css" rel="stylesheet">
<link href="/resources/dist/css/reg.css" rel="stylesheet">   
    
<nav class="container">
  <img src="/resources/image/re.png" id="re">
</nav>

<body  class="container">
  <br>
  <br>
  <hr>
<form id="register-form" action="/board/reg1-1" method="post">
  <div>
  	<select style="border-radius: 5px; background: aqua;" name="select">
   		<option value="PassSelfIntroduct">합격자소서 게시판</option>
  		<option value="CompanyVal">회사평가 게시판</option>
  		<option value="InterviewAns">면접질문 게시판</option>
  		<option value="Passlatter">합격후기 게시판</option>
  		<option value="WorryQnA">고민Q&A 게시판</option>
  	</select>
  </div>
  
  <br>
  
  <div class="btn-reg">
  	<button type="submit" style="border-radius: 5px; background: aqua; border: 1px solid black;">등록</button>
  </div>

  <input type="text" placeholder="글제목을 입력하세요" style="width: 1200px;" name="title">  
<br>
<br>
  <input type="file"> 
<br>
<br>
  <textarea style="width: 1400px; height: 1200px; resize: none;" name="content"></textarea>
</form>

<script type="text/javascript">
$(document).ready(function () {
	var count = 1;
	
	function fn_addFile() {
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
		});
});
</script>