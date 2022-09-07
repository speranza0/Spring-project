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
                <th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글보기 양식</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td style="width: 20%;">글 제목</td>
                <td colspan="2">${view.postTitle}</td>
            </tr>
            <tr>
                <td>작성자</td>
                <td colspan="2">${view.nickname}</td>
            </tr>
            <tr>
                <td>작성일자</td>
                <td colspan="2">${view.postDate}</td>
            </tr>
            <tr>
                <td>내용</td>
                <td colspan="2" style="height: 200px; text-align: center;">${view.postContent}</td>
            </tr>
            <tr>
                <td>첨부파일</td>
                <td colspan="2"><a href="/board/attachFile?UUID=${view.UUID}">${view.originFileName}</a></td>
            </tr>
            </tbody>
        </table>
        <a href="/board/list" class="btn btn-primary">목록</a>
        <a href="/board/update?idx=${view.idx}" class="btn btn-primary">수정</a>
        <a onclick="return confirm('정말로 삭제하시겠습니까?')" href="/board/delete?idx=${view.idx}" class="btn btn-primary">삭제</a>
        <input type="submit" class="btn btn-primary pull-right" value="글쓰기">
    </div>
</div>
<%@ include file="/WEB-INF/view/common/script.jsp" %>
</body>
</html>