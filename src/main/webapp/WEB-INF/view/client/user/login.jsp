<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <jsp:include page="/WEB-INF/view/common/head.jsp" />
</head>
<body>
    <form id="form" action="/api/user/login" method="post">
        <input type="text" name="username" />
        <input type="password" name="password" />
        <button type="submit">로그인</button>
    </form>
    ${message}
    <%@ include file="/WEB-INF/view/common/script.jsp" %>
</body>
</html>