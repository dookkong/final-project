<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>

<link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/headers/">
<link href="/resources/dist/css/bootstrap.css" rel="stylesheet">  
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
 
<link rel="icon" type="img/png" sizes="16x16" href="/resources/image/favicon-16x16.png">

</head>
<body>

<main>

<div class="container">
   <h1>
   	<a href="./index.html" style="text-decoration: none; color: black;">
   DEV'ILs 
  	</a>
  </h1>
</div>
<hr>

<header class="p-3 mb-3 border-top" id="menu">
  <div class="container" >
    <ul class="nav col-12 col-lg-auto me-lg-auto mb-5 justify-content-center mb-md-0" id="main-menu">
      <li><a href="./index.html">홈</a></li>
      <li><a href="./community1.html">회사평가</a></li>
      <li><a href="./community2.html">면접질문</a></li>
      <li><a href="./community3.html">합격후기</a></li>
      <li><a href="./community4.html">고민Q&A</a></li>
      <li><a href="./community5.html">합격자소서</a></li>
    </ul>
    
    <sec:authorize access="isAuthenticated()">
      <div class="container" id="log">반가워요:)  <sec:authentication property="principal.username"/>  님</div>
   </sec:authorize> 

	<div class="container" id="log">
        <a href="./login.html">
        <sec:authorize access="isAnonymous()">
          <button type="button" class="btn btn-outline-primary" name="login" >로그인</button>
          <a href="/board/sign"><button type="button" class="btn btn-outline-primary" name="signup" >회원가입</button></a>
         </sec:authorize>
         <sec:authorize access="hasRole('ROLE_USER')">
          <a href="/board/mypage?userid=<sec:authentication property="principal.username"/>"><button type="button" class="btn btn-outline-primary" data-oper="mypage">마이페이지</button></a>
          <a href="/board/logout"><button type="button" class="btn btn-outline-primary" data-oper="logout" >로그아웃</button></a>
         </sec:authorize>
         <sec:authorize access="hasRole('ROLE_ADMIN')" >
         <a href="/board/management"><button type="button" class="btn btn-outline-primary" data-oper="admin" >관리자페이지</button></a>
         <a href="/board/logout"><button type="button" class="btn btn-outline-primary" data-oper="logout" >로그아웃</button></a>
         </sec:authorize>
        </a>
      </div>
    </div>
</header>

