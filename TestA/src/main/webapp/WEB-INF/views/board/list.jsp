<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8" isELIgnored="false"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="Path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
.tab_container {
	background: rgb(255, 255, 255); 
	width: 100%; 
	clear: both; 
	border-top-color: currentColor; 
	border-top-width: medium; 
	border-top-style: none; 
	float: left;
}
.tab_content {
	padding: 10px 10px 20px; 
	line-height: 1.8em; 
	font-size: 0.75em;
	min-height: 400px;
}
.tab_content h4 {
	background-position: left top; 
	margin: 10px 0px; 
	padding: 20px 0px 5px 35px; 
	height: 30px; 
	color: rgb(255, 255, 255); 
	letter-spacing: 4px; 
	font-family: "NanumGothic", Serif; 
	font-size: 16px; 
	font-weight: bold; 
	background-image: url("../imgs/h4_back.png"); 
	background-repeat: no-repeat;
}
#container {
	margin: 40px auto;
	 width: 100%;
}
a {
	color: rgb(102, 102, 102); 
	text-decoration: none;
}
a:hover {
	color: rgb(255, 102, 0); 
	text-decoration: none;
}
.clear {
	clear: both;
}
</style>
<title>게시판</title>
</head>
<body>
<form method="get" id="listForm">
<div class="tab_container" id="container">
		<ul class="tabs">
			<li><a href="#tab1">전체</a></li>
			<li><a href="#tab2">일반</a></li>
			<li><a href="#tab3">질문</a></li>
			<li><a href="#tab4">공지사항</a></li>
		</ul>

	<div class="tab_container">
		<div class="tab_content" id="tab1">
	<header>
		<h1>전체 게시판</h1>
		<a href='<c:url value='/board/register.do'/>'>글 작성</a>
	</header>
		<table class="table">
			<thead>
			<tr class="w3-red">
				<td>말머리</td>
				<td>제목</td>
				<td>내용</td>
				<td>아이디</td>
			</tr>
			</thead>
			
			<tbody>			
				<c:forEach var="list" items="${list}">
				<tr>
					<td>
							<c:choose>
								<c:when test="${list.b_group == 1}"> 일반 </c:when>
								<c:when test="${list.b_group == 2}"> 질문 </c:when>
								<c:when test="${list.b_group == 3}">
									<img src="${Path}/resources/image/notice.png" alt="공지사항" width="40px" height="40px">
								</c:when>
								<c:when test="${list.b_group == 4}"> 전체 </c:when>
							</c:choose>
					</td>
							<td>
						<a href='<c:url value='/board/detail.do?bno=${list.bno }&b_group=${list.b_group }&id=${memberVO.id }'/>'>${list.title}
							<c:if test="${list.reply_count != 0 }">
								<span><b>[&nbsp;<c:out value="${list.reply_count}"/>&nbsp;]</b></span>
							</c:if> 
						</a>
					</td>	
					<td>${list.content}</td>
					<td>${list.id}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
		
		<div class="tab_content" id="tab2">
	<header>
		<h1>일반 게시판</h1>
		<a href='<c:url value='/board/register.do'/>'>글 작성</a>
	</header>
		<table class="table">
			<thead>
			<tr class="w3-red">
				<td>말머리</td>
				<td>제목</td>
				<td>내용</td>
				<td>아이디</td>
			</tr>
			</thead>
			
			<tbody>			
				<c:forEach var="NomalList" items="${NomalList}">
				<tr>
					<td>
							<c:choose>
								<c:when test="${NomalList.b_group == 1}"> 일반 </c:when>
								<c:when test="${NomalList.b_group == 2}"> 질문 </c:when>
								<c:when test="${NomalList.b_group == 3}">
									<img src="${Path}/resources/image/notice.png" alt="공지사항" width="40px" height="40px">
								</c:when>
							</c:choose>
					</td>
							<td>
						<a href='<c:url value='/board/detail.do?bno=${NomalList.bno }&b_group=${NomalList.b_group }&id=${memberVO.id }'/>'>${NomalList.title}
							<c:if test="${NomalList.reply_count != 0 }">
								<span><b>[&nbsp;<c:out value="${NomalList.reply_count}"/>&nbsp;]</b></span>
							</c:if>
						</a>
					</td>	
					<td>${NomalList.content}</td>
					<td>${NomalList.id}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
		
		<div class="tab_content" id="tab3">
	<header>
		<h1>질문 게시판</h1>
		<a href='<c:url value='/board/register.do'/>'>글 작성</a>
	</header>
		<table class="table">
			<thead>
			<tr class="w3-red">
				<td>말머리</td>
				<td>제목</td>
				<td>내용</td>
				<td>아이디</td>
			</tr>
			</thead>
			
			<tbody>			
				<c:forEach var="QnAList" items="${QnAList}">
				<tr>
					<td>
							<c:choose>
								<c:when test="${QnAList.b_group == 1}"> 일반 </c:when>
								<c:when test="${QnAList.b_group == 2}"> 질문 </c:when>
								<c:when test="${QnAList.b_group == 3}">
									<img src="${Path}/resources/image/notice.png" alt="공지사항" width="40px" height="40px">
								</c:when>
							</c:choose>
					</td>
							<td>
						<a href='<c:url value='/board/detail.do?bno=${QnAList.bno }&b_group=${QnAList.b_group }&id=${memberVO.id }'/>'>${QnAList.title}
 							<c:if test="${QnAList.reply_count != 0 }">
								<span><b>[&nbsp;<c:out value="${QnAList.reply_count}"/>&nbsp;]</b></span>
							</c:if>
						</a>
					</td>	
					<td>${QnAList.content}</td>
					<td>${QnAList.id}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
		
		<div class="tab_content" id="tab4">
	<header>
		<h1>공지 사항</h1>
		<a href='<c:url value='/board/register.do'/>'>글 작성</a>
	</header>
		<table class="table">
			<thead>
			<tr class="w3-red">
				<td>말머리</td>
				<td>제목</td>
				<td>내용</td>
				<td>아이디</td>
			</tr>
			</thead>
			
			<tbody>			
				<c:forEach var="NoticeList" items="${NoticeList}">
				<tr>
					<td>
							<c:choose>
								<c:when test="${NoticeList.b_group == 1}"> 일반 </c:when>
								<c:when test="${NoticeList.b_group == 2}"> 질문 </c:when>
								<c:when test="${NoticeList.b_group == 3}">
									<img src="${Path}/resources/image/notice.png" alt="공지사항" width="40px" height="40px">
								</c:when>
							</c:choose>
					</td>
							<td>
						<a href='<c:url value='/board/detail.do?bno=${NoticeList.bno }&b_group=${NoticeList.b_group }&id=${memberVO.id }'/>'>${NoticeList.title}
							<c:if test="${NoticeList.reply_count != 0 }">
								<span><b>[&nbsp;<c:out value="${NoticeList.reply_count}"/>&nbsp;]</b></span>
							</c:if>
						</a>
					</td>	
					<td>${NoticeList.content}</td>
					<td>${NoticeList.id}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
	</div>
	
	<div class="clear"></div>
</div>
</form>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {

	//When page loads...
	$(".tab_content").hide(); //Hide all content
	$("ul.tabs li:first").addClass("active").show(); //Activate first tab
	$(".tab_content:first").show(); //Show first tab content

	//On Click Event
	$("ul.tabs li").click(function() {

		$("ul.tabs li").removeClass("active"); //Remove any "active" class
		$(this).addClass("active"); //Add "active" class to selected tab
		$(".tab_content").hide(); //Hide all tab content

		var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
		$(activeTab).fadeIn(); //Fade in the active ID content
		return false;
	});

});
</script>
</body>
</html>