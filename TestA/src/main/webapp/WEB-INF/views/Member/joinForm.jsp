<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<% request.setCharacterEncoding("utf-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
table{
	width:40%;
	margin:auto;
}
table td{
	border-bottom: 1px solid #ccc;
}
</style>
<title>회원가입</title>
</head>
<body>
<form action="${contextPath }/member/joinForm.do" method="post">
	<table>
		<tbady>
			<tr>
				<td>아이디 
					<input type="text" name="id" id="id" size="20" />
				</td>
			</tr>
			<tr>
				<td>비밀번호 
					<input type="text" name="pw" id="pw" size="20" />
				</td>
			</tr>
			<tr>
				<td>이메일
					<input type="text" name="email" id="email" size="20" class="mail_input"/>
					<input type="button" value="인증번호 전송" class="mail_check_button" />
				</td>
			</tr>
				<td>
					인증번호:<input class="mail_check_input">
				</td>
			<tr>
				<td>휴대번호 
					<input type="text" name="tel" id="tel" size="20" />
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="회원가입" >
					<input type="button" value="취소" onclick="history.go(-1)">
				</td>
			</tr>
		</tbady>
	</table>
</form>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(".mail_check_button").click(function(){
		var email = $(".mail_input").val();
		
		$.ajax({
			type:"POST",
			url:"mailCheck.do?email=" +email,
			success:function(data){
				//console.log("data :" + data);
			}
				
		})
		
	});
</script>
</body>
</html>