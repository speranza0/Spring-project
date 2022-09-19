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

    <title>회원가입</title>

    <!-- Custom fonts for this template-->
    <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/css/sb-admin-2.min.css" rel="stylesheet">
    <jsp:include page="/WEB-INF/view/common/head.jsp" />
    <%@ include file="/WEB-INF/view/common/script.jsp" %>

</head>
<form commandName="searchVO" id="createForm" action="/user/join" method="post">
    <input type="hidden" id="idyn" name="idyn" value="N">

    <body class="bg-gradient-primary">
<%--    <%@ include file="/WEB-INF/view/common/header.jsp" %>--%>
    <div class="container">
        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">회원가입</h1>
                            </div>
                            <form class="user">
                                <div class="form-group row">
                                    <div class="col-sm-12 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user" id="realname" name="realname" style="text-align:center;" placeholder="이름" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-8 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user" id="username" name="username" style="text-align:center;" placeholder="아이디"/>

                                    </div>
                                    <div class="col-sm-4 mb-3 mb-sm-0">
                                        <a href="#" class="btn btn-success btn-icon-split" style="text-align:center;" onclick="duplicate(); return false;">
                                            <span class="icon text-white-50">
                                                <i class="fas fa-check"></i>
                                            </span>
                                            <span class="text">중복체크</span>
                                        </a>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-12 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user" id="nickname" name="nickname" style="text-align:center;" placeholder="닉네임"/>

                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-12 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user" id="telephone" name="telephone" style="text-align:center;" placeholder="전화번호" />

                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-12 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user" id="email" name="email" style="text-align:center;" placeholder="이메일 주소" />

                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-12 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user" id="password" name="password" style="text-align:center;" placeholder="비밀번호" />

                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-12 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user" id="checkPw" style="text-align:center;" placeholder="비밀번호 확인" />

                                    </div>
                                </div>
                                <a href="#" class="btn btn-primary btn-user btn-block" onclick="fnSubmit()">회원가입</a>
                                <input type="reset" class="btn btn-primary btn-user btn-block" value="취소" />
                                <hr>
                                <a href="#" class="btn btn-google btn-user btn-block">
                                    아이디/비밀번호 찾기
                                </a>
                                <a href="/user/login" class="btn btn-facebook btn-user btn-block">
                                    로그인
                                </a>
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

    <!-- Bootstrap core JavaScript-->
    <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/script/sb-admin-2.min.js"></script>
    </body>
</form>
</html>
