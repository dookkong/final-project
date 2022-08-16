<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/includes/header.jsp" %>

  <style>
    .container {
      max-width: 960px;
    }

    .container main {
      margin-top: 10px;
      background-color: wheat;
      display: flex;
    }

    .container main .edit-form {
      margin-left: 250px;
      margin-bottom: 50px;
      margin-top: 30px;
      align-items: center;

    }

    .bd-placeholder-img {
      font-size: 1.125rem;
      text-anchor: middle;
      -webkit-user-select: none;
      -moz-user-select: none;
      user-select: none;
    }

    @media (min-width: 768px) {
      .bd-placeholder-img-lg {
        font-size: 3.5rem;
      }
    }
  </style>

<body class="bg-light">

  <div class="container">
    <h4 style="text-align: center;">
      <b style="color:rgb(91, 21, 114);">회원정보수정</b></h4>
    <main>
      <div class="row g-5">
        <div class="col-md-8 col-lg-10">
          <form class="edit-form" novalidate="">
            <div class="row g-6">
              <div class="col-sm-10">
                <b><label for="name" class="form-label">이름</label></b>
                <input type="text" class="form-control" id="name" placeholder="" value="" required="">
                <div class="invalid-feedback">
                  이름은 필수 입력사항입니다.
                </div>
              </div>
              <div class="col-10">
                <b><label for="nickname" class="form-label">닉네임</label></b>
                <div class="input-group has-validation">
                  <span class="input-group-text">★</span>
                  <input type="text" class="form-control" id="nickname" placeholder="nickname" required="">
                  <div class="invalid-feedback">
                    변경할 닉네임을 입력해주세요.
                  </div>
                </div>
              </div>

              <div class="col-10">
                <label for="email" class="form-label">Email </label>
                <input type="email" class="form-control" id="email" placeholder="devil@example.com">
                <div class="invalid-feedback">
                  이메일 양식을 확인해주세요.
                </div>
              </div>

              <div class="col-10">
                <label for="password" class="form-label">비밀번호</label>
                <input type="password" class="form-control" id="password" placeholder="password" required="">
                <div class="invalid-feedback">
                  Please enter your password.
                </div>
              </div>

              <div class="col-10">
                <label for="password_ck" class="form-label">비밀번호 확인<span class="text-muted">(필수)</span></label>
                <input type="password" class="form-control" id="password_ck" placeholder="password">
              </div>

              <div class="col-md-5">
                <label for="option" class="form-label">option</label>
                <select class="form-select" id="country" required="">
                  <option value="">Choose...</option>
                  <option>Korea</option>
                </select>
                <div class="invalid-feedback">
                  Please select a valid option.
                </div>
              </div>
            </div>

            <hr class="my-6">
            <div class="col-10 text-center">
              <button class="w-40 btn btn-outline-info btn-md" type="reset">취소</button>
              <button class="w-40 btn btn-outline-info btn-md" type="submit">수정</button>
            </div>
          </form>
        </div>
      </div>
    </main>
  </div>


  <script src="js/bootstrap.bundle.min.js"></script>

  <script src=" js/form-validation.js"></script>
<%@include file="/WEB-INF/views/includes/footer.jsp" %>