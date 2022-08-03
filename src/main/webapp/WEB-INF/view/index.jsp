<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<jsp:include page="/WEB-INF/view/common/head.jsp" />
</head>
<body>
	<h1>Hello JSP</h1>
	${UserVO}
	<form action="/api/user/logout" method="post">
		<input type="submit" value="로그아웃">
	</form>
	<jsp:include page="/WEB-INF/view/common/script.jsp" />
</body>
</html>