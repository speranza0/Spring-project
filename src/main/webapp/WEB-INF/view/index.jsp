<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/default.css" />
</head>
<body>
	<h1>Hello JSP</h1>
	<form action="/api/user/logout" method="post">
		<input type="submit" value="로그아웃">
	</form>
</body>
</html>