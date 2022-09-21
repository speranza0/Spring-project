<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/view/common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>회원정보 수정</title>
  <jsp:include page="/WEB-INF/view/common/head.jsp" />
</head>
<form commandName="searchVO" id="createForm" action="/user/userModify" method="post">
  <body class="bg-gradient-primary">
  <div class="container">
    <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
          <div class="col-lg-7">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">profile</h1>
              </div>
              <form class="user">
                <div class="form-group row">
                  <div class="col-sm-12 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" id="username" name="username" style="text-align:center;" value="${userInfo.username }"
                           placeholder="아이디" readonly="readonly">
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-sm-12 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" id="realname" name="realname" style="text-align:center;" value="${userInfo.realname }"
                           placeholder="이름" readonly="readonly">
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-sm-12 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" id="nickname" name="nickname" style="text-align:center;" value="${userInfo.nickname }"
                           placeholder="닉네임">
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-sm-12 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" id="telephone" name="telephone" style="text-align:center;" value="${userInfo.telephone }"
                           placeholder="전화번호">
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-sm-12 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" id="email" name="email" style="text-align:center;" value="${userInfo.email }"
                           placeholder="이메일 주소">
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-sm-12 mb-3 mb-sm-0">
                    <input type="password" class="form-control form-control-user" id="password" name="password" style="text-align:center;"
                           placeholder="비밀번호">
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-sm-12 mb-3 mb-sm-0">
                    <input type="password" class="form-control form-control-user" id="checkPw" style="text-align:center;"
                           placeholder="비밀번호 확인">
                  </div>
                </div>
                <a href="#" class="btn btn-primary btn-user btn-block" onclick="modifySumbit(); return false;">
                  수정
                </a>
                <hr>
                <a href="/" class="btn btn-warning btn-user btn-block">
                  홈페이지
                </a>
              </form>
              <hr>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script>
    function modifySumbit() {
      var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
      var tel_rule = /^\d{2,3}-\d{3,4}-\d{4}$/;


      if ($("#nickname").val() == null || $("#nickname").val() == "") {
        alert("닉네임을 입력해주세요.");
        $("#nickname").focus();

        return false;
      }

      if ($("#telephone").val() == null || $("#telephone").val() == "") {
        alert("전화번호를 입력해주세요.");
        $("#telephone").focus();

        return false;
      }

      if(!tel_rule.test($("#telephone").val())){
        alert("전화번호 형식에 맞게 입력해주세요.");
        return false;
      }

      if ($("#email").val() == null || $("#email").val() == "") {
        alert("이메일을 입력해주세요.");
        $("#email").focus();

        return false;
      }

      if(!email_rule.test($("#email").val())){
        alert("이메일을 형식에 맞게 입력해주세요.");
        return false;
      }

      if ($("#password").val() != "" && $("#checkPw").val() == "") {
        alert("비밀번호 확인을 입력해주세요.");
        $("#checkPw").focus();

        return false;
      }

      if ($("#password").val() == "" && $("#checkPw").val() != "") {
        alert("비밀번호를 입력해주세요.");
        $("#password").focus();

        return false;
      }

      if ($("#password").val() != $("#checkPw").val()) {
        alert("비밀번호가 일치하지 않습니다.");
        $("#checkPw").focus();

        return false;
      }

      if (confirm("회원정보를 수정하시겠습니까?")) {

        $("#createForm").submit();

        return false;
      }
    }
  </script>
  </body>
</form>
</html>