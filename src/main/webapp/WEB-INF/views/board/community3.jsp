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
    <h2><b>고민Q&A 게시판</b></h2>
  </div>

<section class="container" style="height: 500px;" id="sec3">
<div  style="text-align: center;" id="list">
  <div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">            
              <button id="regBtn" type="button" class="btn btn-xs pull-right" style="border-radius: 5px;">
                  게시글 등록
              </button>
            </div>
           
            <!-- /.panel-heading -->
            <div class="panel-body">
                <table width="100%" class="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>수정일</th>
                        </tr>
                    </thead>        
                    <tbody>
                      <c:forEach items="${list}" var="board">
                        <tr class="odd gradeX">
                            <td><c:out value="${board.bno}"/></td>
                            <td><a class="move" href='<c:out value="${board.bno }"/>'>
                            	<c:out value="${board.title}"/>
                            	</a>
                            </td>
                            <td><c:out value="${board.userid}"/></td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd"
                            value="${board.regdate}"/></td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd"
                            value="${board.updatedate}"/></td>
                        </tr>
                       </c:forEach>
                    </tbody>
                </table>
                <!-- /.table-responsive -->
                 <div class='row'>
                   <div class="col-lg-12">
                     <form id='searchForm' action="/board/community3" method="get">
                       <select name='type'>
                         <option value="${pageMaker.cri.type == null?'selected':'' }">--</option>
                         <option value="T">제목</option>
                         <option value="C">내용</option>
                         <option value="W">작성자</option>
                         <option value="TC">제목 & 내용</option>
                         <option value="TW">제목 & 작성자</option>
                         <option value="TCW">제목 & 내용 & 작성자</option>
                       </select>
                       <%-- 검색란 --%>
                       <input type="text" name="keyword" >
                       <%-- 전송 버튼을 누르면 페이지 번호, 게시물 개수 함께 전송(페이지를 검색한 내용에 맞게 뿌려주기 위해) --%>
                       <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                       <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                       <button class="btn btn-default">검색</button>
                     </form>
                   </div>
               </div>
               
               <div class='pull-right'>
                 <ul class="pagination">
                 
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
            <%-- 검색 방법이 다양해 질 수 있기 때문에 form을 따로 만든다.--%>
            <form id="actionForm" action="/board/community3" method='get'>
               <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
               <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
               <input type="hidden" name="type" value="${pageMaker.cri.type }">
               <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
            </form>
            
            <!-- Modal 추가-->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel">게시판</h4>
                        </div>
                        <div class="modal-body">
                            Modal Here
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save changes</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!-- /.modal 끝 -->
</div>
</div>
</div></div>
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
			console.log("modal........")
			
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
	
	var searchForm = $("#searchForm");
	
	$("#searchForm button").on("click", function (e) {
		
		console.log("searchForm.............");
		
		//유효성 검사
		if(!searchForm.find("option:selected").val()){
			alert("검색 종류를 선택하세요.");
			
			return false;
		}
		
		if(!searchForm.find("input[name='keyword']").val()){
			alert("검색어를 입력하세요.");
			
			return false;
		}
		
		//검색버튼을 눌렀을 때 새롭게 페이지를 보여줘야 하므로 페이지번호를 1번으로 변경
		searchForm.find("input[name='pageNum']").val("1");
		
		e.preventDefault();
		searchForm.submit();
	});
	
});
</script>