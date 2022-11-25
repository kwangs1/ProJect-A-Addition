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
.active {
	color: rgb(255, 0, 0);
	 font-weight: bold;
	 font-size: 0.8em;
}
ul.tabs {
	list-style: none; 
	margin: 0px; 
	padding: 0px; 
	width: 100%; 
	height: 32px; 
	border-bottom-color: rgb(255, 0, 0); 
	border-bottom-width: 1px; 
	border-bottom-style: 
	solid; float: left;
}
ul.tabs li {
	border-width: 1px; 
	border-style: solid; 
	border-color: rgb(153, 153, 153) rgb(153, 153, 153) rgb(255, 0, 0);
	margin: 0px 1px; padding: 0px; 
	border-image: none; 
	height: 31px; 
	line-height: 31px; 
	overflow: hidden; 
	float: left; 
	border-top-left-radius: 7px; 
	border-top-right-radius: 7px; 
	background-color: rgb(245, 245, 245);
}
ul.tabs li a {
	padding: 0px 20px;
	color: rgb(0, 0, 0); 
	font-size: 12px; 
	font-weight: bold; 
	text-decoration: none; 
	display: block;
}
ul.tabs li a:hover {
	background-color: rgb(202, 228, 255);
}
ul.tabs li.active {
	background: rgb(255, 255, 255); 
	border-color: rgb(255, 0, 0) rgb(255, 0, 0) rgb(255, 255, 255); 
	border-bottom-width: 2px; 
	border-bottom-style: solid;
}
ul.tabs li.active a:hover {
	background: rgb(255, 255, 255); 
	border-color: rgb(255, 0, 0) rgb(255, 0, 0) rgb(255, 255, 255); 
	border-bottom-width: 2px; 
	border-bottom-style: solid;
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
//게시판 탭 기능(게시판 종류 별로 글 보이게)
$(document).ready(function() {
	
	//class 이름이 tab_content 숨김
	$(".tab_content").hide(); 
	//addclass 사용으로 선택한 요소에 클래스 값 추가 /tab 클릭시 .active css효과 나타남 
	$("ul.tabs li:first").addClass("active").show();
	//tab1 번 부터 보이게 함
	$(".tab_content:first").show();

	//On Click Event
	$("ul.tabs li").click(function() {
		
		//tab 클릭시 이전 탭 부분은 기본 css로 돌아오고 클릭한 부분은 .active css로 바뀜
		$("ul.tabs li").removeClass("active"); 
		$(this).addClass("active"); 
		//이전 tab 부분 숨김
		$(".tab_content").hide(); 
		
		//tab태그를 클릭 시 a태그의 href 속성값을 찾기위해 선언
		var activeTab = $(this).find("a").attr("href");
		//tab태그를 클릭한 값을 서서히 나타나게 하는 메서드 .fadeIn()
		$(activeTab).fadeIn();
		return false;
	});

});
</script>
</body>
</html>