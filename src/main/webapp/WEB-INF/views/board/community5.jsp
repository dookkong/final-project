<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../includes/header.jsp" %>

<link href="/resources/dist/css/headers.css" rel="stylesheet">
<link href="/resources/dist/css/community.css" rel="stylesheet">
<link href="/resources/dist/css/bootstrap.css" rel="stylesheet">

  <nav class="container">
<img src="/resources/image/re.png" id="re">
  </nav>

  <div style="text-align: center;" id="title">
    <h2><b>합격자소서공유 게시판</b></h2>
  </div>

<section class="container" style="height: 950px;">
	<div  style="text-align: center; position: relative; right: 230px;" id="list">
    	<button type="button" class="btn btn-xs pull-right" onclick="location.href = './reg.html'"
              	style="border-radius: 5px; background: #22dd9b; float: left; font-size: 13px; width: 90px;">
        	<img alt="pencle" src="/resources/image/pencle.png" width="18px">
        	글쓰기
        </button>
        <br>
        <br>
            <div class="panel-body">  	
                <table class="table table-striped table-bordered table-hover" style="width: 1000px;">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th style="width: 500px;">제목</th>
                            <th>작성자</th>
                            <th style="width: 130px;">작성일</th>
                            <th>조회수</th>
                            <th>좋아요</th>
                        </tr>
                    </thead>        
                    <tbody>
                      <c:forEach items="${PassSelfIntroduct}" var="board">
                        <tr class="odd gradeX">
                            <td style="width: 80px;"><c:out value="${board.bno}"/></td>
                            <td><a class="move" style="text-decoration: none; color: black;" href='/board/reg-detail5?bno=<c:out value="${board.bno }"/>'>
                            	<c:out value="${board.title}"/>
                            </a></td>
                            <td><c:out value="${board.userid}"/></td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd"
                             value="${board.regdate}"/></td>
                            <td style="width: 80px;"><c:out value="${board.views}"/></td>
                            <td style="width: 80px;"><c:out value="${board.likes}"/></td>
                        </tr>
                      </c:forEach>
                    </tbody>
                </table>
                <!-- /.table-responsive -->
               <div class='row'>
                  <div class="col-lg-12">
                  <form id='searchForm' action="/board/community4" method="get">
                    <select name='type'>
                      <option value="${pageMaker.cri.type == null?'selected':'' }">--</option>
                      <option value="T"
                      >제목</option>
                      <option value="C" 
                      >내용</option>
                      <option value="W"
                      >작성자</option>
                      <option value="TC"
                      >제목 or 내용</option>
                      <option value="TW"
                      >제목 or 작성자</option>
                      <option value="TCW"
                      >제목 or 내용 or 작성자</option>
                    </select>
                    <input type="text" name="keyword" >
                    <input type="hidden" name="pageNum" >
                    <input type="hidden" name="amount">
                    <button id="search">Search</button>
                  </form>
                  </div>
               </div>
               
               <div>
              <ul class="pagination"
               style="list-style-type: none; position: relative; left: 350px; 
               display: flex; flex-direction: row; justify-content: space-around;
               width: 320px; color: black;">
                 
                 	<%-- prev가 true일 때 보이게 하기 --%>
                 	<c:if test="${pageMaker.prev}">
                 		<li class="paginate_button"><a href="${pageMaker.startPage-1}">Previous</a></li>
                 	</c:if>
                 	
                 	<%-- a href=""에 페이지 값을 담은 것을 actionForm hidden의 value에 넣어서 /board/community3로 이동한다. --%>
                 	<c:forEach var="page" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
                 		<li class="paginate_button ${pageMaker.cri.pageNum == page? 'active':''}"><a href="${page }">${page }</a></li>
                 	</c:forEach>
                 	
                 	<%-- next가 true일 때 보이게 하기 --%>
                 	<c:if test="${pageMaker.next}">
						<li class="paginate_button"><a href="${pageMaker.endPage+1}">Next</a></li>
					</c:if>
                 </ul>
            </div>
              </div>
            <form id="actionForm" action="/board/community1" method='get'>
               <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
               <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
               <input type="hidden" name="type">
            </form>
</div>
</section>
  
<%@include file="../includes/footer.jsp" %>

<script type="text/javascript">

$(document).ready(function () {
	var result = '<c:out value="${result}"/>';
	  
	  checkModal(result);
	  history.replaceState({},null,null);
	  
	  function checkModal(result) {
		if(result === ''|| history.state){
			return;
		}
		
		if(parseInt(result) > 0){
			$(".modal-body").html("게시글이 등록 되었습니다.");
		}
		$("#myModal").modal("show");
	}
	
	$("#regBtn").on("click", function () {
		self.location = "/board/reg3";
	});
	
	var actionForm = $("#actionForm");
	
	$(".paginate_button a").on("click", function (e) {
		e.preventDefault();
		//this == .paginate_button a
		var targetPage = $(this).attr("href");
		
		console.log(targetPage);
		
		//actionForm 안에서 찾는다 input name='pageNum' 인 것을 찾아서 value를 targetPage로 변경 
		actionForm.find("input[name='pageNum']").val(targetPage);
		actionForm.submit();
	});
	
	$(".move").on("click", function (e) {
		e.preventDefault();
		
		//.move href가 가지고 있는 bno값을 targetBno에 넣는다.
		var targetBno = $(this).attr("href");
		
		console.log(targetBno);
		
		actionForm.append("<input type='hidden' name='bno' value='"+targetBno+"'>");
		actionForm.attr("action", "/board/reg-detail3");
		actionForm.submit();
	});
});
</script>