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
    <div class="jumbotron">
        <div class="container">
            <h1>${user.username}님 회원가입이 완료되었습니다!</h1>
            <p><a class="btn btn-primary btn-pull" href="/user/login" role="button">로그인</a></p>
        </div>
    </div>
</div>
</body>
</html>