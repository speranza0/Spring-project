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

    var path = "${pageContext.request.contextPath }";

    $(document).ready(function() {
    });

    function duplicate() {

        var Id = $("#username").val();

        var submitObj = new Object();
        submitObj.username = Id;

        $.ajax({
            url : path + "/user/getIdCnt",
            type : "POST",
            contentType : "application/json;charset=UTF-8",
            data : JSON.stringify(submitObj),
            dataType : "json",
            async : false
        }).done(function(resMap) {
            if (resMap.res == "ok") {
                if (resMap.idCnt == 0) {
                    alert("사용할 수 있는 아이디입니다.");
                    $("#idyn").val("Y");
                } else {
                    alert("사용할 수 없는 아이디입니다. 아이디를 다시 선택해주세요.");
                    $("#idyn").val("N");
                }
            }
        }).fail(function(e) {
            alert("등록 시도에 실패하였습니다." + e);
        }).always(function() {
            pass = false;
        });
    }

    function fnSubmit() {

        var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
        var tel_rule = /^\d{2,3}-\d{3,4}-\d{4}$/;

        if ($("#realname").val() == null || $("#realname").val() == "") {
            alert("이름을 입력해주세요.");
            $("#realname").focus();

            return false;
        }

        if ($("#username").val() == null || $("#username").val() == "") {
            alert("아이디를 입력해주세요.");
            $("#username").focus();

            return false;
        }

        if ($("#idyn").val() != 'Y') {
            alert("아이디 중복체크를 눌러주세요.");
            $("#idyn").focus();

            return false;
        }

        if ($("#nickname").val() == null || $("#nickname").val() == "") {
            alert("닉네임을 입력해주세요.");
            $("#nickname").focus();

            return false;
        }

        if ($("#telephone").val() == null || $("#telephone").val() == "") {
            alert("전화번호를 입력해주세요.");
            $("#telephone").focus();

            return false;
        }

        if(!tel_rule.test($("#telephone").val())){
            alert("전화번호 형식에 맞게 입력해주세요.");
            return false;
        }

        if ($("#email").val() == null || $("#email").val() == "") {
            alert("이메일을 입력해주세요.");
            $("#email").focus();

            return false;
        }

        if(!email_rule.test($("#email").val())){
            alert("이메일을 형식에 맞게 입력해주세요.");
            return false;
        }

        if ($("#password").val() == null || $("#password").val() == "") {
            alert("비밀번호를 입력해주세요.");
            $("#password").focus();

            return false;
        }

        if ($("#checkPw").val() == null || $("#checkPw").val() == "") {
            alert("비밀번호 확인을 입력해주세요.");
            $("#checkPw").focus();

            return false;
        }

        if ($("#password").val() != $("#checkPw").val()) {
            alert("비밀번호가 일치하지 않습니다.");
            $("#checkPw").focus();

            return false;
        }

        if (confirm("회원가입하시겠습니까?")) {

            $("#createForm").submit();

            return false;
        }
    }
</script>