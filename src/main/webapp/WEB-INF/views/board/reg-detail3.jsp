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
<button type="button" data-oper="community3" style="border-radius: 5px;">목록</button>
<%--ne == not equal == != == <> : 해당 값이 동일하지 않은지를 물어보는 연산자 --%>
	<input type="button" id="next" value="다음글" style="border-radius: 5px; background: green;">
  </div>
  <br>
  <br>
    <div class="div">
      <div class="div2">
        <h2><b><c:out value='${board.title }'/></b></h2>
        <h5><b><c:out value='${board.userid }'/></b></h5>
        <div class="btn-reg-detail">
          <button type="button" data-oper="modify" style="border-radius: 5px;">수정</button>
          <button type="button" data-oper="remove" style="border-radius: 5px;">삭제</button>
            </div>
        <h6><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updatedate }"/></h6>
            <hr>
            <br>
            <div class="btn-reg-detail-content">
              <c:out value='${board.content }'/>
            </div>
          <form id="operForm" action="/board/modify3" method="get">
             <input type='hidden' id="bno" name="bno" value='${board.bno }'>
             <input type='hidden' name="pageNum" value='${cri.pageNum }'>
             <input type='hidden' name="amount" value='${cri.amount }'>                               
             <input type='hidden' name="type" value='${cri.type }'>                               
             <input type='hidden' name="keyword" value='${cri.keyword }'>                               
          </form>
      </div>
    </div>
    <hr>
    <h4>댓글</h4>
    <div class="chat">
      <div class="chat-content">
          <strong>여행가는 인프피</strong>
          <small >2022-08-01</small>
        <p>나는 여행을 간다~</p>
      </div>
    </div>
    <br>
    <br>
    <div class="chat-reg">
      <textarea style="width: 1200px;   height: 100px;">댓글을 입력하시오
      </textarea>
      <div class="btn-reg-detail">
        <button type="button" id="addReplyBtn" style="border-radius: 5px;">등록</button>
      </div>
    </div>

<script type="text/javascript" src="/resources/js/reply.js"></script>

<script type="text/javascript">
	$(document).ready(function () {
		console.log("JS TEST================!!");
		
		//특정 게시글에 댓글이 달려있으므로 bno 값을 담기
		var bnoValue = '<c:out value="${board.bno}"/>';
		var replyUL = $(".chat"); //ul, li 생기면 ul class명으로 변경 예정
		
		showList(1); //1페이지 댓글 목록을 불러와줌
		
		function showList(page) {
			console.log("showList page: "+page);
			                                   //저장된 페이지 값이 없으면 1페이지
			replyService.getList({bno:bnoValue, page:page||1},
					function(list) {
				//reply.js    ReplyPageDTO > list
						console.log("list : "+list);
						
						showList(pageNum);
						
						return;
				
				var str = "";
				
				//글이 없거나 배열의 길이가 0이면
				if(list == null || list.length == 0){
					//.chat 의 내용을 가져온다.
					replyUL.html("");
					return;
				}
				
				for(var i=0, len=list.length || 0; i < len; i++){
					//일단 ul과 li가 있다는 전제하에 댓글 코드 작업
					//data-rno = list[i].rno > 커스텀속성
					str += "<li class='#' data-rno='"+list[i].rno+"'>";
				 	str += "<div><div class='chat-content'><strong class='#'>"
				 			+list[i].userid+"</strong>";
				 	str += "<small class='#'>"
				 			+replyService.displayTime(list[i].replydate)
				 			+"</small></div>";
					str += "<p>"+list[i].reply+"</p>";
					str += "</div></li>";
				}
				
				//str에 담아준 내용으로 replyUL의 내용 변경
				replyUL.html(str);
				
				showReplyPage(); //고민해보기
			}); //end replyService.getList
		} //end showList
	})
</script>
    
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
		
		if(operation === "modify"){
			operForm.attr("action", "/board/modify3");
		}else if(operation === "community3"){
			operForm.find("#bno").remove();
			operForm.attr("action", "/board/community3");
		}else if(operation === "remove"){
			operForm.attr("action", "/board/remove3").attr("method", "post");
		}
		
		operForm.submit();
	});
	
	$("#next").on("click", function (e) {
		e.preventDefault();
		location.href="/board/reg-detail3?bno='${board.bno+1}'.jsp";
	});
});
</script>
    