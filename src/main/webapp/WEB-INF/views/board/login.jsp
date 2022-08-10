<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../includes/header.jsp" %> 
    
<link href="/resources/dist/css/headers.css" rel="stylesheet">
<link href="/resources/dist/css/login.css" rel="stylesheet">
<link href="/resources/dist/css/bootstrap.css" rel="stylesheet">    
    
<section class="sec">
    <br>
    <br>
      <div>
        <h3 style="text-align: center;"><b>로그인</b></h3>
    </div>
    <hr>
    <br>

      <div class="log">
        <img src="/resources/image/pngwing.com.jpg" style="width: 60px;" class="img-id">
        <input type="text" name="id"
            style="width: 300px; height: 40px; border-radius: 5px; margin-left: 15px;"
            placeholder="아이디">
        <img src="/resources/image/pass.jpg" style="width: 50px;" class="img-pass">
        <input type="password" name="pass"
            style="width: 300px; height: 40px; border-radius: 5px; margin-left: 15px;"
            placeholder="비밀번호">
       </div>

       <div class="search">
          <img src="/resources/image/icon1.png" style="width: 15px;">
          <a href="#" style="text-decoration: none; color: rgb(0, 0, 0); font-size: 13px;">아이디 찾기</a>
          <img src="/resources/image/icon1.png" style="width: 15px;">
          <a href="#" style="text-decoration: none; color: rgb(0, 0, 0); font-size: 13px;">비밀번호 찾기</a>
          <img src="/resources/image/sign.png" style="width: 15px;">
          <a href="./sign.html" style="text-decoration: none; color: rgb(0, 0, 0); font-size: 13px;">회원가입</a>
        </div>
        <div id="loginbox">
          <button type="submit" value="로그인" name="login" id="login">로그인</button>

        </div>
  </section>

<%@include file="../includes/footer.jsp" %>