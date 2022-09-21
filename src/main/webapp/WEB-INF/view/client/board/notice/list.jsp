<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/view/common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width", initial-scale="1">
    <title>공지사항</title>
    <jsp:include page="/WEB-INF/view/common/head.jsp" />
</head>
<body>
<%@ include file="/WEB-INF/view/common/header.jsp" %>
<form method="get" id="listForm" action="/board/notice/list">
<div class="container">
    <div class="row">
        <div>
            <div class="col-md-8 card-header py-3">
                <input type="text" id="searchKeyword" name="searchKeyword" value="${searchVO.searchKeyword}" style="width:300px; height:40px;" placeholder="검색어를 입력하세요." />
                <input type="hidden" id="pageIndex" name="pageIndex" value="${searchVO.pageIndex}" />
                <button type="submit" class="btn btn-primary">검색</button>
            </div>
            <span class="col-md-4" style="text-align: right">총 게시물 ${totCnt} / 페이지 (${searchVO.pageIndex} / ${totalPageCnt})</span>
        </div>
        <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
            <thead>
            <tr>
                <th style="background-color: #eeeeee; text-align: center;">번호</th>
                <th style="background-color: #eeeeee; text-align: center;">제목</th>
                <th style="background-color: #eeeeee; text-align: center;">작성자</th>
                <th style="background-color: #eeeeee; text-align: center;">작성일</th>
            </tr>
            </thead>
            <tbody>
            <c:set var="i" value="${totCnt - ((searchVO.pageIndex -1) * 10)}" />
            <c:forEach items="${list}" var="listup">
                <tr>
                    <td>${i}</td>
                    <td><a href="/board/notice/view?idx=${listup.idx}">${listup.postTitle}</a></td>
                    <td>${listup.nickname}</td>
                    <td>${listup.postDate}</td>
                </tr>
                <c:set var="i" value="${i-1}"></c:set>
            </c:forEach>
            </tbody>
        </table>
        <div class="col-sm-12 col-md-7">
            <div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
                <ul class="pagination">

                    <c:if test="${searchVO.prev}">
                        <li class="paginate_button page-item previous" id="dataTable_previous">
                            <a href="javascript:void(0);" onclick="fn_go_page(${searchVO.startData - 1}); return false;" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
                        </li>
                    </c:if>

                    <c:forEach var="num" begin="${searchVO.startData}" end="${searchVO.endData}">
                        <li class="paginate_button page-item">
                            <a href="javascript:void(0);" onclick="fn_go_page(${num}); return false;" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link" title="${num}">${num}</a>
                        </li>
                    </c:forEach>

                    <c:if test="${searchVO.next}">
                        <li class="paginate_button page-item next" id="dataTable_next">
                            <a href="javascript:void(0);" onclick="fn_go_page(${searchVO.endData + 1}); return false;" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Next</a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
        <a href="/board/notice/write" class="btn btn-primary pull-right">글쓰기</a>
    </div>
</div>
</form>
<%@ include file="/WEB-INF/view/common/pagingscript.jsp" %>
</body>
</html>