<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix= "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="Path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>상세보기</title>
</head>

<body>
<h1>게시글 상세보기</h1>
	<table>		
		<tbody>
		<tr>
			<td>제목 : ${detail.title} </td>
		</tr>
		<tr>
			<td>내용 : ${detail.content} </td>
		</tr>
		</tbody>
	</table>
		<div class="Reply" style="padding-top: 10px">			
		
				<h6 class= "ReplyList">Reply list</h6>	
	
				<div id="replyList"></div>		
		
		</div> 	
	<br>
		<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">				
				<form:form name="form" id="form" role="form" modelAttribute="replyVO" method="post">				
				<form:hidden path="bno" id="bno"/>				
			
			<div class="col-sm-2">						
				<form:input path="writer" class="form-control" id="writer" value="${memberVO.id }" type="hidden" />				
			</div>				

			<div class="row">					
				<div class="col-sm-10">						
					<form:textarea path="content" id="content" class="form-control" rows="3" placeholder="댓글을 입력해 주세요" />		
				<c:if test="${not empty memberVO}">	
					<button type="button"id="btnReplyAdd" onClick="window.location.reload()">등록</button>		
				</c:if>				
			</div>									
			</div>				
				</form:form>			
			</div>	
												

	<br>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

//댓글 리스트
	$(document).ready(function(){
		getReplyList();
	});
	
	function getReplyList(){
		var url = "${Path}/reply/getReplyList.do";
		var paramData = {"bno": "${board.bno}"};

		var writer = $('#writer').val();
		var id = '${memberVO.id}';

		$.ajax({
			type:'POST',
			url:url,
			data:paramData,
			dataType:'json',
			success: function(result){
			  var htmls = "";		
			
			  if(result.length < 1){				
				  htmls ="등록된 댓글이 없습니다.";
			  }else{
					$(result).each(function(){
						htmls += '<div class="media text-muted pt-3" id="rno' + this.rno + '">';					              
						htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';	                     
						htmls += '<span class="d-block">';	               
						htmls += '<strong class="text-gray-dark">' + this.writer + '</strong>';
						htmls += this.reg_date;
						htmls += '<br>'                     
						htmls += this.content;	 
						htmls += '</span>';	                     
				if(id != ''){
					if(id == writer){
						htmls += '<span style="padding-left: 7px; font-size: 9pt">';	                     
						htmls += '<a href="javascript:void(0)" onclick="fn_editReply(' + this.rno + ', \'' + this.writer + '\', \'' + this.content + '\' )" style="padding-right:5px">수정</a>';	                     
						htmls += '<a href="javascript:void(0)" onclick="fn_deleteReply(' + this.rno + ',\'' + this.writer + '\')" >삭제</a>';	                     
						htmls += '</span>';	
						}
					}
						htmls += '</p>';	  
						htmls += '</div>';		
						
					});//end each
				}
				$("#replyList").html(htmls);
			}//ajax success end
		});//end ajax
	}
		
//댓글 저장
$(document).on('click','#btnReplyAdd', function(){	
	var Content = $('#content').val();
	var Writer = $('#writer').val();

	if(Content == ""){
		alert("내용을 입력해주세요.");
		return ;
	}
	
	var paramData = JSON.stringify(
			{"content": Content
			,"writer" : Writer
			,"bno" : '${board.bno}'
	});
	var headers = {"Content-Type":"application/json"
		,"X-HTTP-Method-Override":"POST"};
	$.ajax({
		url:"${Path}/reply/addReply.do"
		,headers : headers
		,data : paramData
		,type : 'POST'
		,dataType : 'text'
		,success:function(result){
			getReplyList();
			
			$('#content').val();
			$('#writer').val();
		}
		,error:function(error){
			console.log("에러:" + error);
		}
	});//end ajax
});//end on

//댓글 수정
function fn_editReply(rno, writer, content){	

	var htmls = "";		
			htmls += '<div class="media text-muted pt-3" id="rno' + rno + '">';
			htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
			htmls += '<span class="d-block">';
			htmls += '<strong class="text-gray-dark">' + writer + '</strong>';
			htmls += '<span style="padding-left: 7px; font-size: 9pt">';
			htmls += '<a href="javascript:void(0)" onclick="fn_updateReply('
					+ rno + ', \'' + writer
					+ '\')" style="padding-right:5px">등록</a>';
			htmls += '<a href="javascript:void(0)" onClick="getReplyList()">취소<a>';
			htmls += '</span>';
			htmls += '</span>';
			htmls += '<textarea name="editContent" id="editContent" class="form-control" rows="3">';
			htmls += content;
			htmls += '</textarea>';
			htmls += '</p>';
			htmls += '</div>';
			$('#rno' + rno).replaceWith(htmls);
			$('#rno' + rno + ' #editContent').focus();
			
}

//댓글 수정
function fn_updateReply(rno, writer) {
	var replyEditContent = $('#editContent').val();

	var paramData = JSON.stringify({
		"content" : replyEditContent,
		"rno" : rno
	});

	var headers = {
		"Content-Type" : "application/json",
		"X-HTTP-Method-Override" : "POST"
	};

	$.ajax({
		url : "${Path}/reply/updateReply.do",
		headers : headers,
		data : paramData,
		type : 'POST',
		dataType : 'text',
		success : function(result) {
			console.log(result);
			getReplyList();
		},
		error : function(error) {
			console.log("에러:" + error);
		}
	});//end ajax
}

//댓글 삭제
function fn_deleteReply(rno){
	var DelConfirm = confirm('댓글을 삭제 하시겠습니까?');
	
	var paramData = {"rno" : rno};

	if(DelConfirm){	
		alert("댓글이 삭제 되었습니다.");
	}else{
		alert("댓글 삭제가 취소 되었습니다.");
		return;
	}
	
	$.ajax({
		url:"${Path}/reply/deleteReply.do"
		,data : paramData
		,type : 'POST'
		,dataType : 'text'
		,success:function(result){
			getReplyList();
		}
		,error: function(error){
			console.log("에러:" + error);
		}
	});
}
</script>
</body>
</html>