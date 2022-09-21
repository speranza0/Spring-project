<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/view/common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width", initial-scale="1">
    <title>사용자 게시판</title>
    <jsp:include page="/WEB-INF/view/common/head.jsp" />
</head>
<body>
<%@ include file="/WEB-INF/view/common/header.jsp" %>
<div class="container">
    <div class="row">
        <form method="post" action="/board/post/update?idx=${updateView.idx}" enctype="multipart/form-data">
            <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
                <thead>
                <tr>
                    <th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 수정 양식</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td style="width: 20%;">글 제목</td>
                    <td><input type="text" class="form-control" placeholder="글 제목" name="postTitle" maxlength="50" value="${updateView.postTitle}"></td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td><textarea class="form-control" placeholder="글 내용" name="postContent" maxlength="2048" style="height: 350px;">${updateView.postContent}</textarea></td>
                </tr>
                <c:if test="${not empty updateView.UUID}">
                <tr>
                    <td>첨부파일</td>
                    <td>
                        <a href="/board/post/attachFile?UUID=${updateView.UUID}">${updateView.originFileName}</a>
                        <a href="/board/post/deleteFile?idx=${updateView.idx}" type="button" class="btn btn-warning">삭제</a>
                    </td>
                </tr>
                </c:if>
                <tr>
                    <td>첨부파일</td>
                    <td><input type="file" name="uploadFile"></td>
                </tr>
                </tbody>
            </table>
            <input type="submit" class="btn btn-success" value="수정">
            <a href="/board/post/view?idx=${updateView.idx}" class="btn btn-danger">취소</a>
        </form>
    </div>
</div>
</body>
</html>