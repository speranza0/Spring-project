<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/view/common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width", initial-scale="1">
  <title>Insert title here</title>
  <jsp:include page="/WEB-INF/view/common/head.jsp" />
</head>
<body>
<%@ include file="/WEB-INF/view/common/header.jsp" %>
<div class="container">
  <div class="col-lg-4"></div>
  <div class="col-lg-4">
    <div class="jumbotron" style="padding-top: 20px;">
      <form method="post" action="/user/userModify">
        <h3 style="text-align: center;">회원정보 수정</h3>
        <div class="form-group">
          <input type="text" class="form-control" placeholder="아이디" name="username" maxlength="20" value="${userInfo.username}" readonly>
        </div>
        <div class="form-group">
          <input type="password" class="form-control" placeholder="비밀번호" name="password" maxlength="20">
        </div>
        <input type="submit" class="btn btn-primary form-control" value="회원정보 수정">
      </form>
    </div>
  </div>
  <div class="col-lg-4"></div>
</div>
<%@ include file="/WEB-INF/view/common/script.jsp" %>
</body>
</html>