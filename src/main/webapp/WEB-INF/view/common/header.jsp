<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <jsp:include page="/WEB-INF/view/common/head.jsp" />
</head>
<body>

<nav class="navbar navbar-default">
  <div class="navbar-header">
    <button type="button" class="navbar-toggle collapsed"
            data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
            aria-expanded="false">
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="/">Home</a>
  </div>
  <c:if test="${not empty user}">
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="/board/notice/list">공지사항</a></li>
        <li><a href="/board/post/list">게시판</a></li>
        <li><a href="#">${user.nickname}님 환영합니다.</a>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
            회원관리<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="/user/userModify?username=${user.username}">회원정보 수정</a></li>
            <li><a href="/api/user/logout">로그아웃</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </c:if>
  <c:if test="${empty user}">
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="/board/notice/list">공지사항</a></li>
        <li><a href="/board/post/list">게시판</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
            접속하기<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="/user/login">로그인</a></li>
            <li><a href="/user/join">회원가입</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </c:if>
</nav>
</body>
</html>