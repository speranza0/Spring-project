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

    $(document).ready(function() {
        var thisIndex = "${searchVO.pageIndex}";
        $(".pagination li a").each(function() {
            var idx = $(this).parent().index();
            var thistitle = $(this).attr("title");
            if(thistitle == thisIndex) {
                $(".pagination").find("li").eq(idx).addClass("active");
            }
        });
    });
</script>