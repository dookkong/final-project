<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../includes/header.jsp" %>
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h2>게시글 수정</h2>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-lg-6">
                    	<form role="form" action="/board/modify3" method="post">
                          <div class="form-group">
                          	  <input type='hidden' name='bno' value='<c:out value="${board.bno }"/>'>
                          	  <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
                          	  <input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
                          	  <input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
                          	  <input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
                          	  
                              <label>제목</label>
                              <input class="form-control" name="title" 
                              value='<c:out value="${board.title }"/>' >
                          </div>
                          
                          <div class="form-group">
                          <label>작성자</label>
                              <input class="form-control" name="userid" 
                              value='<c:out value="${board.userid }"/>' readonly="readonly">
                          </div>
                          
                          <div class="form-group">
                          <label>수정일자</label>
                              <input class="form-control" name="updatedate" 
                              value='<fmt:formatDate pattern="yyyy-MM-dd" value="${board.updatedate }"/>' readonly="readonly">
                          </div>
                          
                          <div class="form-group">
                              <label>내용</label>
                              <textarea class="form-control" rows="10" cols="10000" name="content">${board.content }</textarea>
                          </div>
                          
                          <%-- data-xxx 데이터 속성 --%>
                          <%-- 특정한 데이터를 DOM 요소에 저장해두기 위함 --%>
                          <%-- data-form='' data-value='' 등과 같이 임의로 속성을 만들어 사용할 수 있으며 한 input 태그에 여러개 사용 가능하다. --%>
                          <button type="submit" data-oper="modify3" class="btn btn-default">수정 완료</button>
                          <button type="submit" data-oper="community3" class="btn btn-info">목록</button>
                    	</form>
                    </div>
                    <!-- /.col-lg-6 (nested) -->
                    
                </div>
                <!-- /.row (nested) -->
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<%@include file="../includes/footer.jsp" %>

<script type="text/javascript">
$(document).ready(function () {
	var formObj = $("form");
	
 	$("button").on("click", function (e) {
		e.preventDefault();
		
		//잘 실행되는지 확인 this === button
		var operation = $(this).data("oper");
		console.log(operation);
		
		if(operation === "community3"){
			formObj.attr("action", "/board/community3")
				   .attr("method", "get");
		}
		
		formObj.submit();
	});
	
	

});
</script>