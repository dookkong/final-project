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
    <h2><b>회사 평가 게시판</b></h2>
  </div>

<section class="container" style="height: 850px;">
	<div  style="text-align: center; position: relative; right: 230px;" id="list">
    	<button type="button" class="btn btn-xs pull-right" 
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
                            <td><a class="move" style="text-decoration: none; color: black;">
                            <c:out value="${board.title}"/>
                            </a></td>
                            <td><c:out value="${board.writer}"/></td>
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
                  <form id='searchForm' action="/board/list" method="get">
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
                    <button class="btn btn-default">Search</button>
                  </form>
                  </div>
               </div>
               
               <div class='pull-right'>
              <ul class="pagination">
                
                <c:if test="${pageMaker.prev }">
                <li class="paginate_button previous"><a href="${pageMaker.startPage-1 }">Previous</a></li>
               </c:if> 
               
               <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
                <li class="paginate_button ${pageMaker.cri.pageNum == num ? 'active':'' }">
                <a href="${num }">${num }</a></li>
               </c:forEach>
                
               <c:if test="${pageMaker.next }">
                <li class="paginate_button next"><a href="${pageMaker.endPage+1 }">Next</a></li>
               </c:if>
              </ul>
            </div>
              </div>
            <form id="actionForm" action="/board/list" method='get'>
               <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
               <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
               <input type="hidden" name="type" >
            </form>
</div>
</section>
  
<%@include file="../includes/footer.jsp" %>
