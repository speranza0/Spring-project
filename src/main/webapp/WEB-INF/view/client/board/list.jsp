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
    <div class="row">
        <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
            <thead>
            <tr>
                <th style="background-color: #eeeeee; text-align: center;">번호</th>
                <th style="background-color: #eeeeee; text-align: center;">제목</th>
                <th style="background-color: #eeeeee; text-align: center;">작성자</th>
                <th style="background-color: #eeeeee; text-align: center;">작성일</th>
            </tr>
            </thead>
<%--            <tbody>--%>
<%--            <%--%>
<%--                BbsDAO bbsDAO = new BbsDAO();--%>
<%--                ArrayList<Bbs> list = bbsDAO.getList(pageNumber);--%>
<%--                for(int i = 0; i < list.size(); i++){--%>
<%--            %>--%>
<%--            <tr>--%>
<%--                <td><%= list.get(i).getBbsID() %></td>--%>
<%--                <td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID()%>"><%= list.get(i).getBbsTitle() %></a></td>--%>
<%--                <td><%= list.get(i).getBbsUserID() %></td>--%>
<%--                <td><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시 " + list.get(i).getBbsDate().substring(14, 16) + "분" %></td>--%>
<%--            </tr>--%>
<%--            <%--%>
<%--                }--%>
<%--            %>--%>
<%--            </tbody>--%>
        </table>
<%--        <%--%>
<%--            if(pageNumber != 1) {--%>
<%--        %>--%>
<%--        <a href="bbs.jsp?pageNumber=<%= pageNumber - 1%>" class="btn btn-success btn-arrow-left">이전</a>--%>
<%--        <%--%>
<%--            } if(bbsDAO.nextPage(pageNumber + 1)){--%>
<%--        %>--%>
<%--        <a href="bbs.jsp?pageNumber=<%= pageNumber + 1%>" class="btn btn-success btn-arrow-left">다음</a>--%>
<%--        <%--%>
<%--            }--%>
<%--        %>--%>
        <a href="/board/write" class="btn btn-primary pull-right">글쓰기</a>
    </div>
</div>
<%@ include file="/WEB-INF/view/common/script.jsp" %>
</body>
</html>