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
<form id="form" action="/user/login" method="post">
    <input type="text" name="username" />
    <input type="password" name="password" />
    <button type="submit">로그인</button>
</form>
${message}
<script>
    // document.getElementById("form").addEventListener("submit", function(event) {
    //     event.preventDefault();
    //
    // });
</script>
</body>
</html>