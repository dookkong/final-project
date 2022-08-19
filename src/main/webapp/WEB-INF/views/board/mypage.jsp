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
                                <h5><sec:authentication property="principal.username"/> 님</h5>
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
                            <strong> <sec:authentication property="principal.username"/> 님의 최근 게시물</strong>
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
               <a href="/board/AskReg"><button class="btn btn-info">문의글쓰기</button></a> 
                 <div class="panel-body">  	
               	  <table class="table table-striped table-bordered table-hover" style="width: 1000px;">
                    <thead>
                        <tr>
                            <th>문의종류</th>
                            <th>제목</th>
                            <th>아이디</th>
                            <th>작성일자</th>
                        </tr>
                    </thead>        
                    <tbody>
                      <c:forEach items="${list}" var="board">
                        <tr class="odd gradeX">
                            <td>${board.category}</td>
                            <td>${board.title}</td>
                            <td>${board.userid}</td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/></td>
                        </tr>
                       </c:forEach>
                    </tbody>
                </table>
          		</div>
<hr>
                        

<%@include file="../includes/footer.jsp" %>