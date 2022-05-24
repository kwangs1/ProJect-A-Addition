<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix= "c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>상세보기</title>
</head>
<body>
	<table>
		<thead>상세보기</thead>
		
		<tbody>
			<td>제목 : ${detail.title} </td>
			<td>내용 : ${detail.content} </td>
		</tbody>
	</table>
</body>
</html>