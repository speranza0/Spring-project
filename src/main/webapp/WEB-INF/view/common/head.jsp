<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<sec:authentication property="principal" var="user" scope="request"/>
<sec:authorize access="isAnonymous()">
    <c:set var="user" value="" scope="request"/>
</sec:authorize>
<sec:authorize access="hasRole('ADMIN')">
    <%-- 관리자 권한 --%>
    <c:set var="isAdmin" value="true" scope="request"/>
</sec:authorize>
<sec:authorize access="hasRole('USER')">
    <%-- 사용자 권한 --%>
    <c:set var="isUser" value="true" scope="request"/>
</sec:authorize>
<link rel="stylesheet" href="/css/bootstrap.css" />
<link rel="stylesheet" href="/css/custom.css" />
<!-- Custom fonts for this template-->
<link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
<!-- Custom styles for this template-->
<link href="/css/sb-admin-2.min.css" rel="stylesheet">
