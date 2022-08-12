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
  <br>
  <br>
  <hr>
<form action="/board/reg2" method="post">
  <div>
  	<select style="border-radius: 5px; background: aqua;" name="select">
  		<option value="1">회사평가 게시판</option>
  		<option value="2">면접질문 게시판</option>
  		<option value="3">고민Q&A 게시판</option>
  		<option value="4">합격자소서 게시판</option>
  	</select>
  	
  	  	<select style="border-radius: 5px; background: aqua;" name="select2">
  		<option value="0">말머리</option>
  		<option value="1">흔한고민</option>
  		<option value="2">취업관련</option>
  		<option value="3">스택관련</option>
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
   <input type="hidden" name="userid" value="chun">
</form>