<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<hr style="color: rgb(8, 150, 3); height: 10px;">

<div class="container" id="footer">
<div class="footer">
  <div class="row">
    <div class="col">
      <h4 class="footer-top">고객지원실 운영안내</h4>
      <ul class="nav">
        <li class="li_1">연중무휴 09:00-18:00 (점심시간 12:00-13:00)</li>
        <li class="li_1">주말/공휴일 포함, 한국시간 기준</li>
        <li class="li_1">유선상담 1800-5011</li>
        <li class="li_1"><button class="btnn" type="button">1:1 채팅상담</button></li>
      </ul>
    </div>

    <div class="col">
      <h4 class="footer-top">About us</h4>
      <ul class="nav">
        <li class="li_1"><a href="#">회사소개</a></li>
        <li class="li_1"><a href="#">채용</a></li>
        <li class="li_1"><a href="#">공고</a></li>
        <li class="li_1"><a href="#">자주 묻는 질문</a></li>
        <li class="li_1"><a href="#">이벤트</a></li>
      </ul>
    </div>

    <div class="col">
      <form>
        <h4  class="footer-top">월간 여행정보 구독하기</h4>
        <div class="subscribe">
          <p>다양한 여행지 혜택과 정보를 구독해보세요!</p>
          <label for="news">Email address</label>
          <input id="news" type="email" placeholder="Email address" required>
          <input class="btnn" type="submit" name="submit" value="구독하기"/>
        </div>
      </form>
    </div>
  </div>

  <div class="sub_in p-3 mb-3 border-top">
    <span>자사는 서울특별시관광협회 공제영업보증보험에 가입되어 있습니다. 
      드래블은 통신판매중개자이며 통신판매의 당사자가 아닙니다. 
      따라서 상품·거래정보 및 거래에 대하여 책임을 지지않습니다.
    </span>
  </div>
</div>
</div>

	<!-- DataTables JavaScript -->
    <script src="/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>
   
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    
        $(".sidebar-nav")
        .attr("class","sidebar-nav navbar-collapse collapse")
        .attr("aria-expanded","false")
        .attr("style","height:1px");
    });
    </script>
</body>
</html>