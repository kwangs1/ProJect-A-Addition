<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix= "c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="Path" value="${pageContext.request.contextPath }"/>
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
						
			<div class="Reply" style="padding-top: 10px">				
				<h6 class= "ReplyList">Reply list</h6>				
				<div id="replyList"></div>			
			</div> 			

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		getReplyList();
	});
	
	function getReplyList(){
		var url = "${Path}/reply/getReplyList.do";
		var paramData = {"bno": "${board.bno}"};
		
		$.ajax({
			type:'POST',
			url:url,
			data:paramData,
			dataType:'json',
			success: function(result){
			  var htmls= "";
				if(result.length <1){
					htmls.push("등록된 댓글이 없습니다.");
				}else{
					$(result).each(function(){
						htmls += '<div class="media text-muted pt-3" id="rno' + this.rno + '">';
						htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';	                     
						htmls += '<title>Placeholder</title>';	                     
						htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';	                     
						htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';	                     
						htmls += '</svg>';	                     
						htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';	                     
						htmls += '<span class="d-block">';	                     
						htmls += '<strong class="text-gray-dark">' + this.writer + '</strong>';	                     
						htmls += '<span style="padding-left: 7px; font-size: 9pt">';	                     
						htmls += '<a href="javascript:void(0)" onclick="fn_editReply(' + this.rno + ', \'' + this.rno + '\', \'' + this.content + '\' )" style="padding-right:5px">수정</a>';	                     
						htmls += '<a href="javascript:void(0)" onclick="fn_deleteReply(' + this.rno + ')" >삭제</a>';	                     
						htmls += '</span>';	                    
						htmls += '</span>';	                     
						htmls += this.content;	                     
						htmls += '</p>';	                    
						htmls += '</div>';

					});//end each
				}
				$("#replyList").html(htmls);
			}
		});//end ajax
	}
</script>
</body>
</html>