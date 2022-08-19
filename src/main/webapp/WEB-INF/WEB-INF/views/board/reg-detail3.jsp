<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../includes/header.jsp" %> 
    
<link href="/resources/dist/css/headers.css" rel="stylesheet">
<link href="/resources/dist/css/community.css" rel="stylesheet">
<link href="/resources/dist/css/reg.css" rel="stylesheet">

    
 <nav class="container">
<img src="/resources/image/re.png" id="re">
 </nav>

<body class="container">
  <br>
  <br>
  <div class="btn-reg-detail">
<button type="button" data-oper="community3" style="border-radius: 5px;">목록</button>
<button type="button" id="next" style="border-radius: 5px;">다음글></button>
  </div>
  <br>
  <br>
    <div class="div">
      <div class="div2">
        <h2><b><c:out value="${board.title }"/></b></h2>
        <h5><b><c:out value="${board.userid }"/></b></h5>
        
	    <sec:authentication property="principal" var="pinfo"/>
	    <sec:authorize access="isAuthenticated()">
			<c:if test="${pinfo.username eq board.userid}">        
		        <div class="btn-reg-detail">
		          <button type="button" data-oper="modify" style="border-radius: 5px;">수정</button>
		          <button type="button" data-oper="remove" style="border-radius: 5px;">삭제</button>
		        </div>
            </c:if>
	    </sec:authorize> 
        <h6><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updatedate }"/> 조회수 
        	<c:out value="${board.views }"/></h6>
            <hr>
            <br>
            
        <div class="btn-reg-detail-content">
             <c:out value="${board.content }"/>
        </div>
            
        <form id="operForm" action="/board/modify3" method="get">
           <input type='hidden' id="bno" name="bno" value='${board.bno }'>
           <input type='hidden' name="pageNum" value='${cri.pageNum }'>
           <input type='hidden' name="amount" value='${cri.amount }'> 
           <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />                                   
        </form>
      </div>
    </div>
    
    <hr>
    
    <div style="position: relative; left: 60px;">
    <h4>댓글</h4>
		<div class="chat">
			<div class="chat-content" data-rno='12'>
          	<strong><c:out value="${Reply.userid }"></c:out></strong>
          	<small >2022-08-01</small>
          	<p><c:out value="${reply.reply }"></c:out></p>
      	</div>

     <div>
      	<button onclick="" style="border: 0px; background: none; 
      			position: relative; left: 1050px; bottom: 100px; font-size: 15px;">
      	수정하기</button>
      	<button onclick="" style="border: 0px; background: none; 
      			position: relative; left: 1050px; bottom: 100px; font-size: 15px;">
      	삭제하기</button>
      </div>
    </div>
    
    <br>
    <br>
    
    <div class="chat-reg">
      <textarea style="width: 1200px;   height: 100px;">댓글을 입력하시오
      </textarea>
      <div class="btn-reg-detail">
        <button type="button" style="border-radius: 5px;">등록</button>
      </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<script type="text/javascript">

$(document).ready(function () {
	var operForm = $("#operForm");
	//button 중 data-oper의 값이 modify인 것이 클릭 됐을 때 메서드 실행
	//= $(".또는 #").click(function (e)
	$("button").on("click", function (e) {
		//button의 기본 동작 정지
		e.preventDefault();
		
		//잘 실행되는지 확인 this == button
		var operation = $(this).data("oper");
		console.log(operation);
		
		var operation = $(this).data("oper");
		console.log(operation);
		
		if(operation === "modify"){
			operForm.attr("action", "/board/modify3");
		}else if(operation === "remove"){
			operForm.attr("action", "/board/remove3").attr("method","post");
		}else if(operation === "community1"){
			operForm.find("#bno").remove();
			operForm.attr("action", "/board/community1");
		}
		
		operForm.submit();
	});
	
	$("#next").on("click", function (e) {
		e.preventDefault();
		location.href="/board/reg-detail3?bno='${board.bno+1}'.jsp";
	});
});
</script>