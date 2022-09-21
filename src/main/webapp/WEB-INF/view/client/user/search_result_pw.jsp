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
    <title>비밀번호 찾기</title>
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
                        <div class="col-lg-6 d-none d-lg-block bg-password-image"></div>
                        <div class="col-lg-6">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-2">새로운 비밀번호 확인하기</h1><br><br>
                                    <p class="mb-4">${newPw}</p>
                                    <p class="mb-4">임시 비밀번호를 사용하여 로그인 후에 꼭 비밀번호를 변경해주세요.</p>
                                </div>
                                <hr>
                                <div class="text-center">
                                    <a class="small" href="/user/search_pw">비밀번호 찾기</a>
                                </div>
                                <div class="text-center">
                                    <a class="small" href="/user/join">회원가입</a>
                                </div>
                                <div class="text-center">
                                    <a class="small" href="/user/login">로그인</a>
                                </div>
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