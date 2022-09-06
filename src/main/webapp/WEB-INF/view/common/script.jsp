<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/script/common.js"></script>
<script src="/script/bootstrap.js"></script>
<script>
    function fn_go_page(pageNo) {
        $("#pageIndex").val(pageNo);
        $("#listForm").submit();
        return false;
    }

    function fn_search(){
        $("#pageIndex").val("1");
        $("#listForm").submit();
        return false;
    }
</script>