<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="Path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 정보 페이지</title>
</head>
<body>
	<h2>회원 정보 상세 페이지</h2>
<form id="MemberInfo" method="get">
		<table border="1" width="400px">
			<tr>
				<td>아이디</td>
				<td><input name ="id" value="${memberVO.id}" readonly="readonly"/></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input name ="email" value="${memberVO.email}" /></td>
			</tr>
			<tr>
				<td>휴대번호</td>
				<td><input name ="tel" value="${memberVO.tel}" /></td>
			</tr>
		</table>
			<a href="${Path}/member/MemberModify_pw.do">☞비밀번호 변경</a>
			<a href="${Path}/member/MemberModify_info.do">☞회원 정보 변경</a>
</form>
</body>
</html>