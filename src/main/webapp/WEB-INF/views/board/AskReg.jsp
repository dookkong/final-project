<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../includes/header.jsp" %> 
    
<link href="/resources/dist/css/headers.css" rel="stylesheet">
<link href="/resources/dist/css/community.css" rel="stylesheet">
<link href="/resources/dist/css/reg.css" rel="stylesheet">
<link href="/resources/dist/css/bootstrap.css" rel="stylesheet">    
    
<nav class="container">
  <img src="/resources/image/re.png" id="re">
</nav>
<body  class="container">
 <form action="/board/AskReg" method="post">
	  <br>
	  <br>
	  <h1>문의글 작성</h1>
	  <hr>
	  <br>
		  <div class="btn-reg">
			  <button type="submit" style="border-radius: 5px;">등록</button>
		  </div>
		   <select name="select">
			   	<option value="inquiry">문의사항</option>
			   	<option value="complain">불편사항</option>
			   	<option value="etc">기타</option>
		   </select>
	   <br>
	   <br>
	    	<input type="text" placeholder="글제목을 입력하세요" style="width: 1200px;" name="title"> 
		<br>
		<br>  			
			  <textarea name="content" style="width: 1400px; height: 1200px; resize: none;" ></textarea>
			  <input type="hidden" name="userid" value='<sec:authentication property="principal.username"/>' />
			  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
 </form>