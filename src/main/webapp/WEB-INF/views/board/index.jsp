<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../includes/header.jsp" %> 

<link href="/resources/dist/css/headers.css" rel="stylesheet">
<link href="/resources/dist/css/index.css" rel="stylesheet">
<link href="/resources/dist/css/bootstrap.css" rel="stylesheet">
    
<!-- ----------------------------------------슬라이드 부분------------------------------------------------- -->
 

<div id="slider" style="z-index: 1;">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet" />

<script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>
<div class="container">
  <div class="bxslider">
    <div id="img"><img src="/resources/image/qwe.jpg"></div>
    <div id="img"><img src="/resources/image/wer.jpg"></div>
    <div id="img"><img src="/resources/image/ert.jpg"></div>
  </div>
</div>
</div>
<script>
  $(document).ready(function(){
    $('.bxslider').bxSlider();
  });
</script>

<!-- ----------------------------------------/슬라이드 부분------------------------------------------------- -->
  
</main>


<section class="container" id="sec">
<div id="sec-1">
<h3 style="text-align: center">인기글</h3>
</div>

<div id="sec-2">
  <h3 style="text-align: center">인기글</h3>
</div>
</section>

<section class="container" id="sec2">
  <div id="sec2-1">
    <h3 style="text-align: center">프로그램 순위</h3>
    <table style="text-align: center; width: 600px;">
        <tr id="tr">
            <th>2022년</th>
            <th>2021년</th>
            <th>변화</th>
            <th>프로그램 언어</th>
            <th>평가</th>
            <th>변화</th>
        </tr>
      <tbody>
        <tr id="tr">
          <td>1</td>
          <td>3</td>
          <td>△</td>
          <td>Python</td>
          <td>15.33%</td>
          <td>+4.47%</td>
        </tr>
        <tr id="tr">
          <td>2</td>
          <td>1</td>
          <td>▼</td>
          <td>C</td>
          <td>14.08%</td>
          <td>-2.26%</td>
        </tr>
        <tr id="tr">
          <td>3</td>
          <td>2</td>
          <td>▼</td>
          <td>Java</td>
          <td>12.13%</td>
          <td>+0.84%</td>
        </tr>
        <tr id="tr">
          <td>4</td>
          <td>4</td>
          <td></td>
          <td>C++</td>
          <td>08.01%</td>
          <td>+1.13%</td>
        </tr>
        <tr id="tr">
          <td>5</td>
          <td>5</td>
          <td></td>
          <td>C#</td>
          <td>5.37%</td>
          <td>+0.93%</td>
        </tr>
        <tr id="tr">
          <td>6</td>
          <td>6</td>
          <td></td>
          <td>Visual Basic</td>
          <td>5.23%</td>
          <td>-0.90%</td>
        </tr>
        <tr id="tr">
          <td>7</td>
          <td>7</td>
          <td></td>
          <td>JavaScript</td>
          <td>1.83%</td>
          <td>-0.45%</td>
        </tr>
        <tr id="tr">
          <td>8</td>
          <td>8</td>
          <td></td>
          <td>PHP</td>
          <td>1.79%</td>
          <td>+0.04%</td>
        </tr>
        <tr id="tr">
          <td>9</td>
          <td>10</td>
          <td>△</td>
          <td>Assembly Language</td>
          <td>1.60%</td>
          <td>-0.06%</td>
        </tr>
        <tr>
          <td>10</td>
          <td>9</td>
          <td>▼</td>
          <td>SQL</td>
          <td>1.55%</td>
          <td>-0.18%</td>
        </tr>
      </tbody>
    </table>
    </div>
</section>

<%@include file="../includes/footer.jsp" %>