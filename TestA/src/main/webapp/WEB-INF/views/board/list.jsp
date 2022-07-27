<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8" isELIgnored="false"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="Path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>게시판</title>
</head>
<body>
<form method="get" id="listForm">
	<div class="container">
	<header>
		<h1>게시판</h1>
	</header>
		<table class="table table-hover">
			<thead>
			<tr class="w3-red">
				<td>번호</td>
				<td>제목</td>
				<td>내용</td>
			</tr>
			</thead>
			
			<tbody>
				<c:forEach var="list" items="${list}">
				<tr>
					<td>${list.bno}</td>
					<td>
						<a href='<c:url value='/board/detail.do?bno=${list.bno }'/>'>${list.title}
							<c:if test="${list.reply_count != 0 }">
								<span><b>[&nbsp;<c:out value="${list.reply_count}"/>&nbsp;]</b></span>
							</c:if>
						</a>
					</td>	
					<td>${list.content}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</form>
</body>
</html>