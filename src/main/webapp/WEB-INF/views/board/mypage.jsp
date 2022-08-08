<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../includes/header.jsp" %> 
    
<link href="/resources/dist/css/headers.css" rel="stylesheet">
<link href="/resources/dist/css/mypage.css" rel="stylesheet">
<link href="/resources/dist/css/bootstrap.css" rel="stylesheet">    
    
<h2><strong>마이홈</strong></h2>
                    <div class="profile-box">
                        <div class="my-profile-box">
                            <div class="my-introduce border-top-1px" id="nickname">
                                <h5>완듀 님</h5>
                                <h6>- 방문자수 : <span>{count}</span></h6>
                            </div>
                            <div class="img-box">
                                <div class="my-photo">
                                    <div class="photo">
                                        <img src="image\user.jpg" class="signimg" alt="회원사진" style="width: 80px;"> 
                                    </div>
                                 </div>
                            </div>
                        </div>
                     </div>

                    <div class="headline-short" id="list-box">
                        <h4>
                            <strong> {닉넴} 님의 최근 게시물</strong>
                        </h4>
                    </div>
                        <div>
                            <div id="list">
                                <h5>최근 게시물이 없습니다.</h5>
                            </div>
                            <hr>
                        </div>

                    <div class="headline-short" id="list-box">
                        <h4>
                            <strong> 내 문의 내역</strong>
                        </h4>
                    </div>
                        <div>
                            <div id="list">
                                <h5>문의 내역이 없습니다.</h5>
                            </div>
                            <hr>
                        </div>

<%@include file="../includes/footer.jsp" %>