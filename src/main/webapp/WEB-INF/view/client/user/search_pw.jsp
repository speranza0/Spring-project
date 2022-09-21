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
<form commandName="searchVO" id="createForm" action="/user/search_result_pw" method="post">
    <input type="hidden" id="idyn" name="idyn" value="N"/>
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
                                        <h1 class="h4 text-gray-900 mb-2">비밀번호를 잊으셨나요?</h1>
                                        <p class="mb-4">가입하신 아이디와 이름, 전화번호를 입력하시면 임시 비밀번호로 설정해드립니다.</p>
                                    </div>
                                    <form class="user">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                   id="username" name="username"
                                                   placeholder="아이디를 입력하세요.">
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                   id="realname" name="realname"
                                                   placeholder="이름을 입력하세요.">
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                   id="telephone" name="telephone"
                                                   placeholder="전화번호를 입력하세요.">
                                        </div>
                                        <c:if test="${not empty msg}">
                                            <p class="mb-4">${msg}</p>
                                        </c:if>
                                        <a href="javascript:void(0)" onclick="searchPwSumbit(); return false;" class="btn btn-primary btn-user btn-block">
                                            임시 비밀번호 설정하기
                                        </a>
                                    </form>
                                    <hr>
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
    <script>
        function searchPwSumbit() {
            var tel_rule = /^\d{2,3}-\d{3,4}-\d{4}$/;

            if ($("#username").val() == null || $("#username").val() == "") {
                alert("아이디를 입력해주세요.");
                $("#username").focus();

                return false;
            }

            if ($("#realname").val() == null || $("#realname").val() == "") {
                alert("이름을 입력해주세요.");
                $("#realname").focus();

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

            if (confirm("비밀번호를 찾으시겠습니까?")) {

                $("#createForm").submit();

                return false;
            }
        }
    </script>
    </body>
</form>
</html>