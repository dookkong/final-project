<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
<button type="button" data-oper="community4" style="border-radius: 5px;">목록</button>
<button type="button" id="next" style="border-radius: 5px;">다음글></button>
  </div>
  <br>
  <br>
    <div class="div">
      <div class="div2">
        <h2><b><c:out value="${board.title }"/></b></h2>
        <h5><b>작성자 이름</b></h5>
        <div class="btn-reg-detail">
          <button type="button" style="border-radius: 5px;">수정</button>
          <button type="button" style="border-radius: 5px;">삭제</button>
            </div>
        <h6>2022-08-01</h6>
            <hr>
            <br>
            <div class="btn-reg-detail-content">
              그러므로 그들은 이상의 보배를 능히 품으며 
              그들의 이상은 아름답고 소담스러운 열매를 맺어 우리 
              인생을 풍부하게 하는 것이다 보라 청춘을 ! 
              그들의 몸이 얼마나 튼튼하며 그들의 피부가 얼마나 생생하며 
              그들의 눈에 무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 
              우리의 귀는 생의 찬미를 듣는다 그것은 웅대한 관현악이며 
              미묘한 교향악이다 뼈 끝에 스며들어 가는 열락의 소리다이것은 
              피어나기 전인 유소년에게서 구하지 못할 바이며 시들어 가는 
              노년에게서 구하지 못할 바이며 오직 우리 청춘에서만 구할 수 
              있는 것이다 청춘은 인생의 황금시대다 우리는 이 황금시대의 
              가치를 충분히 발휘하기 위하여 이 황금시대를 영원히 붙잡아 
              두기
              <br>
              보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보이는 
              것은 거친 모래뿐일 것이다 이상의 꽃이 없으면 쓸쓸한 인간에 남는 
              것은 영락과 부패 뿐이다 낙원을 장식하는 천자만홍이 어디 있으며 
              인생을 풍부하게 하는 온갖 과실이 어디 있으랴? 이상! 우리의 청춘이 
              가장 많이 품고 있는 이상! 이것이야말로 무한한 가치를 가진 것이다 
              사람은 크고 작고 간에 이상이 있음으로써 용감하고 굳세게 살 수 있는
               것이다 석가는 무엇을 위하여 설산에서 고행을 하였으며 예수는 무엇을 
               위하여 광야에서 방황하였으며 공자는 무엇을 위하여 천하를 
               철환하였는가? 밥을 위하여서 옷을 위하여서 미인을 구하기 위하여서 
               그리하였는가? 아니다 그들은
            </div>
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
        <button type="button" style="border-radius: 5px;">등록</button>
      </div>
    </div>