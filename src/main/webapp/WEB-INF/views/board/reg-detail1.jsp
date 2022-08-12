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

<body class="container">
  <br>
  <br>
  <div class="btn-reg-detail">
<button type="button" style="border-radius: 5px;">목록</button>
<button type="button" style="border-radius: 5px;">다음글></button>
  </div>
  <br>
  <br>
    <div class="div">
      <div class="div2">
        <h2><b><c:out value="${board.title }"/></b></h2>
        <h5><b><c:out value="${board.userid }"/></b></h5>
        <div class="btn-reg-detail">
          <button type="button" style="border-radius: 5px;" onclick="location.href = './modify1.html'">수정</button>
          <button type="button" style="border-radius: 5px;">삭제</button>
            </div>
        <h6><c:out value="${board.regdate }"/></h6>
            <hr>
            <br>
            <div class="btn-reg-detail-content">
             <c:out value="${board.content }"/>
            </div>
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
    
<script type="text/javascript" src="/resources/js/reply2.js"></script>
    
  <script>
  console.log("==================")
  console.log("JS TEST")
  var bnoValue = '<c:out value = "${board.bno}"/>';
  
  replyService.getList({bno:bnoValue, page:1}, function(list){
	  
	  for(var i = 0, len = list.length||0; i < len; i++){
		  console.log(list[i]);
	  }
  });
  
  replyService.get(6, function(data){
	  console.log(data);
  });
  </script>  
    
<!-- <script type="text/javascript">

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
		
		if(operation === "modify1"){
			operForm.attr("action", "/board/modify1");
		}else if(operation === "community3"){
			operForm.find("#bno").remove();
			operForm.attr("action", "/board/community3");
		}else if(operation === "remove"){
			operForm.attr("action", "/board/remove3").attr("method", "post");
		}
		
		operForm.submit();
	});
	

	//댓글
	$(document).ready(function(){
	   
	   console.log("==================")
	   console.log("JS TEST")
	   var bnoValue = '<c:out value = "${board.bno}"/>';
	   
	   var replyUL = $(".chat");
	   showList(1);
	   
	   function showList(page){
	      
	     console.log("show list " + page);
	     
	     replyService.getList({bno:bnoValue, page:page||1},
	      function(replyCnt, list){
	        
	        console.log("replyCnt: "+ replyCnt );
	        console.log("list: " + list);
	        console.log(list);
	        
	        if(page==-1){
	           pageNum = Math.ceil(replyCnt/10.0);
	           showList(pageNum);
	           return;
	        }
	        
	        
	         var str = "";
	         if (list==null|| list.length==0){
	            replyUL.html("");
	            return;
	         }
	        for(var i = 0, len=list.length||0 ; i<len ; i++){
	         str += "<div class='chat-content' data-rno='12'>";
	         str += "<strong>" + list[i].userid + "</strong>";
	         str += "<small>" + replyService.displayTime(list[i].regdate) + "</small>"
			 str += "<p>"+list[i].reply+"</p>" 
	        }
	        replyUL.html(str);
	        
	        showReplyPage(replyCnt);
	     });// end function
	   }// end show list
	   
	   var pageNum = 1;
	   var replyPageFooter = $(".panel-footer");
	   
	   function showReplyPage(replyCnt){
	      var endNum = Math.ceil(pageNum / 10.0) *10;
	      var startNum = endNum - 9;
	      
	      var prev = startNum != 1;
	      var next = false;
	      
	      if(endNum * 10 >= replyCnt){
	         endNum = Math.ceil(replyCnt / 10.0)
	      }
	      
	      if(endNum * 10 < replyCnt){
	         next = true;
	      }
	      
	      var str ="<ul class='pagination pull-right'>";
	      if(prev){
	         str += "<li class='page-item'><a class='page-link' href='"
	         +(startNum - 1)+"'>Previous</a></li>";
	      }
	      
	      for(var i=startNum ; i<=endNum ; i++){
	         var active = pageNum == i?"active":"";
	         str += "<li class='page-item'" + active+ "'><a class='page-link' href='"
	         +i+"'>" + i + "</a></li>";
	      }
	      
	      str += "</ul></div>";
	      console.log(str);
	      replyPageFooter.html(str);
	   }
	   
	   replyPageFooter.on("click", "li a", function(e){
	      e.preventDefault();
	      
	      console.log("page click~");
	      
	      var targetPageNum = $(this).attr("href");
	      console.log("targetPageNum: " + targetPageNum);
	      pageNum = targetPageNum;
	      showList(pageNum);
	      
	   });
});
</script>  -->