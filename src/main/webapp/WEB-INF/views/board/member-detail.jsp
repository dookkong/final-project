<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
<%@ include file="../includes/header.jsp" %> 
    
<link href="/resources/dist/css/headers.css" rel="stylesheet">
<link href="/resources/dist/css/bootstrap.css" rel="stylesheet">   

<section class="container" style="height: 850px; margin-top: 100px;">
	<div  style="text-align: center; position: relative; right: 230px;" id="list">
   	 <h2><b>회원상세화면</b></h2>
        <br>
            <div class="panel-body"> 
            <form> 	
                <table class="table table-striped table-bordered table-hover" style="width: 1000px;">
                    <thead>
                        <tr>
                            <th>회원이름</th>
                            <th>아이디</th>
                            <th>전화번호</th>
                            <th>가입일자</th>
                            <th>수정일자</th>
                            <th>수정</th>
                            <th>삭제</th>
                        </tr>
                    </thead>        
                    <tbody>
                         <tr class="odd gradeX">
                            <td><input value="${member.userName}" name="username" /></td>
                            <td><input value="${member.userid}" name="userid" readonly="readonly"/></td>
                            <td><input value="${member.userphone }" name="userphone" /></td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${member.regdate}"/></td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${member.updatedate}"/></td>
                        	<td><button class="btn btn-info" data-oper="modify">수정</button></td>
                        	<td><button class="btn btn-danger" data-oper='remove'>삭제</button></td>
                        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />      
                         </tr>
                    </tbody>
                </table>
              </form> 
             </div>
		</div>
</section>

<script type="text/javascript">
$(document).ready(function(){
	var formobj=$("form");
	
	$('.btn').click(function(e){
		e.preventDefault();
	var operation=$(this).data("oper");
	
	if(operation==='remove'){
		formobj.attr("action","/board/memberRemove")
			   .attr("method","post")
			   .submit();
	}else if(operation==='modify'){
		formobj.attr("action","/board/memberModify")
		       .attr("method","post")
		       .submit();	
	}else if(operation==='admin'){
		self.location="/board/management";
	}else if(operation==='logout'){
		self.location="/board/logout";
		
	});
});
</script>








