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
	<form name="form" method="post">
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
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="수정" id="btnUpdate">
				</td>
			</tr>
		</table>
	</form>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#btnUpdate').click(function(){
		if(confirm("수정 하시겠습니까?")){
			document.form.action = "${Path}/member/MemberModify_info.do";
			document.form.submit();				
		}
	});
});
</script>
</body>
</html>