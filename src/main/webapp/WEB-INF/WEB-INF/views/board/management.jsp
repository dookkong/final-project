<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
<%@ include file="../includes/header.jsp" %> 
    
<link href="/resources/dist/css/headers.css" rel="stylesheet">
<link href="/resources/dist/css/bootstrap.css" rel="stylesheet">   

<section class="container" style="height: 850px; margin-top: 100px;">
	<div  style="text-align: center; position: relative; right: 230px;" id="list">
   	 <h2><b>회원관리</b></h2>
        <br>
            <div class="panel-body"> 
                <table class="table table-striped table-bordered table-hover" style="width: 1000px;">
                    <thead>
                        <tr>
                            <th>회원이름</th>
                            <th>아이디</th>
                            <th>조회</th>
                        </tr>
                    </thead>        
                    <tbody>
                      <c:forEach items="${list}" var="member">
                        <tr class="odd gradeX">
                            <td>${member.userName}</td>
                            <td>${member.userid}</td>
                            <td>
                            <a href="/board/member-detail?userid=${member.userid}">
                            <button style="background: green; color: white;">회원상세정보</button>
                            </a>
                            </td>
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










