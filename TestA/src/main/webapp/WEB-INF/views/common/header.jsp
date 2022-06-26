<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>header</title>
<style>
div#title{
    float: left; /*box영역의 왼쪽으로 정렬, 다음에 오는 요소에 영향을 끼침, [title][logindisplay] */
    text-align:left;
    display:block;
 
}
 
#logindisplay {
   
    text-align:right;
    margin:10px;
    font-size:0.9em;
    display:block;
    color:white;
 
}
 
/*logindisplay영역의 링크 스타일 지정*/
#logindisplay a:link{
    color:black;
    text-decoration:none;
 
}
#logindisplay a:visited{
    color:black;
    text-decoration:none;
 
}
 
#logindisplay a:hover{
    background-color:white;
    color:black;
 
}
#logindisplay a:active{ /*링크를 클릭하는 순간 */
    color:silver;
    text-decoration:none;
 
}
 
#menucontainer{
    /*clear:both;*/
    margin-top:40px;
  
}
 
/*메뉴 모양 정의 */
 
ul#menu{
    text-align:center;
    list-style-type: none;
  	margin: 0;
  	padding: 0;
  	overflow: hidden;
}
 
ul#menu li{
    display:inline;
    list-style:none; /*리스트의 블릿기호 none */
}
ul#menu li a{
    padding:10px 20px;
    font-weight: bold;
    text-decoration:none;
    line-height:2.8em;
    color:#000;
}
ul#menu li a:hover{
   
    background-color:#fff;
    text-decoration:none;
}
ul#menu li a:active{
    text-decoration:none;
}
 
/* 제목 관련 스타일 */
h1, h2, h3, h4, h5, h6
{
    font-size: 1.5em;
}
</style>
</head>
<body>
	
	<!--header 영역 -->
	<div id="header">

		<!-- 로그인 영역 -->
		<div id="logindisplay">
			<c:if test="${memberVO != null }">
				<a href="${contextPath}/member/logout.do">로그아웃 |</a>
				<a href="${contextPath}/member/MemberInfo.do">마이페이지 &#124;</a>
			</c:if>
			<c:if test = "${memberVO == null }">
			<a href="${contextPath }/member/login.do">로그인 &#124;</a> 
			<a href="${contextPath }/member/joinForm.do">회원가입</a> 
			</c:if>
		<br>
		</div>

		<!-- 메뉴 영역-->
	<div id="menucontainer">
			<ul id="menu">
				<li><a href="${contextPath}/main/main.do">main</a></li>
				<li><a href="${contextPath}/board/list.do">게시판</a></li>
			</ul>
		</div>

	</div>
</body>
</html>