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
    <title>Login</title>
    <jsp:include page="/WEB-INF/view/common/head.jsp" />
</head>
<body class="bg-gradient-primary">
<div class="container">
    <!-- Outer Row -->
    <div class="row justify-content-center">
        <div class="col-xl-10 col-lg-12 col-md-9">
            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                        <div class="col-lg-6">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">방문을 환영합니다!</h1>
                                </div>
                                <form id="loginform" action ="/api/user/login" method="post">
                                    <div class="form-group">
                                        <input type="text" class="form-control form-control-user" id="username" name="username" aria-describedby="emailHelp" placeholder="아이디를 입력하세요." value="${rememberCookie.getValue() }"/>
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control form-control-user" id="password" name="password" placeholder="비밀번호를 입력하세요." />
                                    </div>
                                    <c:if test="${not empty error}">
                                        로그인 오류 : ${error}
                                    </c:if>
                                    <input type="submit" class="btn btn-primary btn-user btn-block" value="로그인" />
                                    <hr>
                                    <a href="/user/join" class="btn btn-google btn-user btn-block">회원가입</a>
                                    <a href="/user/search_id" class="btn btn-facebook btn-user btn-block">아이디 찾기</a>
                                    <a href="/user/search_pw" class="btn btn-facebook btn-user btn-block">비밀번호 찾기</a>
                                    <a href="/" class="btn btn-warning btn-user btn-block">홈페이지</a>
                                </form>
                                <hr>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>