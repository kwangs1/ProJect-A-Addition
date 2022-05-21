<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
.login_warn{
    margin-top: 30px;
    text-align: center;
    color : red;
    font-size : 10pt;
}
</style>
<link rel="stylesheet" href="${contextPath}/resources/css/login.css">
</head>
<body>
<div class="loginbox">
		
		<h1>Login</h1>
	<form id="login_form" method="post">
		<label for="loginid" class="labelid">아이디</label>
      	<input type="text" name="id" class="id_input"><br>
      		
      	<label for="loginpw" class="labelpw">비밀번호</label>
      	<input type="password" name="pw" class="pw_input" >
      		
		<div class="search">
			<span class="text">아이디 또는 비밀번호를 잊으셨나요?</span>
			<a href="${contextPath }/member/memberSearchForm.do" style='cursor:pointer;'>ID/PW 찾기</a>
		</div> 
		
		<c:if test="${result == 0 }">
			<div class = "login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
		</c:if>
		</br>
		<div class="btnwrap">
			<a href="${contextPath}/member/joinForm.do">회원가입</a>
			<input type="button" class="login_button" value="로그인"  id="loginbtn" style='cursor:pointer;'/>
			<label for="loginbtn">로그인 버튼</label>
		</div>
	</form>
</div>
	
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(".login_button").click(function(){
	$("#login_form").attr("action", "${contextPath }/member/login.do");
	$("#login_form").submit();
});
</script>

</body>
</html>