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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


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
		<button type="button" class="btn btn-primary CancleBtn LikeBtn">좋아요(${getLike})</button>

		<div class="Reply" style="padding-top: 10px">			
		
				<h3 class= "ReplyList">댓글</h3>	
	
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
					<button type="button"id="btnReplyAdd">등록</button>		
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
		success: function(data){
			//console.log("댓글 리스트 받아졌나?");
			
			var htmls = "";		
		 
			for(const i in data){//list를 받기위해 for문 사용
			 let rno = data[i].rno;
			 let bno = data[i].bno;
			 let content = data[i].content;
			 let writer = data[i].writer;
			 let reg_date = data[i].reg_date;
			 let r_depth = data[i].r_depth;
			 let r_group = data[i].r_group;
		
			 if(r_depth == 0){ //댓글
				htmls +=  '<div class="media text-muted pt-3" id="rno' + rno + '">';
				htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';	                     
				htmls += '<span class="d-block">';	               
				htmls += '<strong class="text-gray-dark">' + writer + '</strong>';
				htmls += '&nbsp;&nbsp;'+ reg_date;
				htmls += '<br>'                    
				htmls += content;	 
				htmls += '</span>';	  
				
				if(id != ""){ //로그인시 답글 버튼 나오게하기
					htmls += '<span style="padding-left: 7px; font-size: 9pt">';	                     
					htmls += " <a href='#' class='write_reply_start' data-bs-toggle='collapse' data-bs-target='#re_reply"+ rno +"' aria-expanded='false' aria-controls='collapseExample'>답글</a>";                   
					htmls += '</span>';	
				}
			}else{ //답글
				htmls += "<div class='rereply-content" + rno + " col-7'>";
				htmls += "<div>";	                     
				htmls += '<span>';	               
				htmls += '<b> ⤷ ' + writer + '</b>';
				htmls += '&nbsp;&nbsp;'+ reg_date;
				htmls += '</span>';
				htmls += '<br>';
				htmls += '<span>';             
				htmls += '&nbsp;&nbsp;&nbsp;&nbsp;'+content;	 
				htmls += '</span>';	 
			}
		//---------------
		if(id != ''){//로그인 및 작성자와 id가 동일시 수정 및 삭제버튼 나오게
			if(id == writer){
				htmls += '<span style="padding-left: 7px; font-size: 9pt">';       				
				htmls += " <a href='#' class='update_reply_start' data-bs-toggle='collapse' data-bs-target='#rno"+ rno +"' aria-expanded='false' aria-controls='collapseExample'>수정</a>";	
				htmls += '&nbsp;&nbsp;';
				htmls += '<a href="javascript:void(0)" onclick="fn_deleteReply(' + rno + ',\'' + writer + '\')" >삭제</a>';	                     
				htmls += '</span>';
			}	
		}			
		//---------------
	
			//답글 입력란
			htmls += "<div class='collapse rereply_write' id='re_reply"+ rno +"'>";
			htmls += "<div class='col-1'>"
			htmls += "</div>";
			htmls += "<div class='col-1'>"
			htmls +="<input class ='w-100 input_writer_div form-control' id='input_writer"+ rno +"'  value='${memberVO.id}' type='hidden'>";
			htmls += "</div>";
			htmls += "<div class='col-7'>"
			htmls +="<input class ='w-100 input_rereply_div form-control' id='input_rereply"+ rno +"' type='text' placeholder = '댓글을 입력하세요.'>";
			htmls += "</div>";
			htmls += "<div class='col-3'>"
			//동적으로 넣은 html 태그에서 발생하는 이벤트는 동적으로 처리해줘야 함
			//동적으로 넣은 html 태그에서 발생하는 click 이벤트는 html 태그 안에서 onclick 처리하면 안되고 , jquery에서 클래스명 이나 id값을 받아서 처리하도록 해야함
			htmls += "<button type='button' class='btn btn-success mb-1 write_rereply' rno='" + rno +"' bno= '" + bno +"'>답글 달기</button>";
			htmls += "</div>";
			htmls += "</div>";
			
			//-------------------------------------------------
			//수정 html
			htmls += "<div class='collapse reply_update' id='rno"+ rno +"'>";
			htmls += "<div class='col-1'>"
			htmls += "</div>";
			htmls += "<div class='col-1'>"
			htmls +="<input class ='w-100 input_writer_div form-control' id='input_writer"+ rno +"'  value='${memberVO.id}' type='hidden'>";
			htmls += "</div>";
			htmls += "<div class='col-7'>"
			htmls +="<input class ='w-100 input_content_div form-control' id='input_content"+ rno +"' type='text'>";
			htmls += "</div>";
			htmls += "<div class='col-3'>"
			htmls += "<button type='button' class='btn btn-success mb-1 update_reply' rno='" + rno +"' bno= '" + bno +"'>수정 하기</button>";
			htmls += "<button type='button' class='btn' name='list' >취소</button>"
			htmls += "</div>";
			htmls += "</div>";
	
		 }//end for
	
			$("#replyList").html(htmls);
		 
			//답글 작성 후 답글 달기버튼 를 click event를 아래처럼 jquery로 처리
			$('button.btn.btn-success.mb-1.write_rereply').on('click',function(){				
				WriteReReply($(this).attr('bno'), $(this).attr('rno'));
			});
			//--------------답글 저장 end
			
			$('button.btn.btn-success.mb-1.update_reply').on('click',function(){				
				if($(this).attr('r_depth') == 0){
					UpdateReply($(this).attr('rno'), $(this).attr('bno'));				
				}else{
					UpdateReReply($(this).attr('rno'), $(this).attr('bno'), $(this).attr('r_depth'));	
				}
			});
			
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
			window.location.reload();
			getReplyList();
		}
		,error:function(error){
			console.log("에러:" + error);
		}
	});//end ajax
});//end on

//댓글 수정
UpdateReply = function(rno, bno) {
	var writer = $('#input_writer' + rno).val();
	var content = $('#input_content' + rno).val();
	
	var paramData = JSON.stringify({
		"bno" : bno,
		"rno" : rno,
		"content" : content,
		"writer" : writer
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

//-----------------------------------------------
//답글 달기 버튼 클릭시 실행 
WriteReReply = function(bno, rno){
	
	var writer = $('#input_writer' + rno).val();
	var content = $('#input_rereply' + rno).val();
	content = content.trim();
	
	var paramData = JSON.stringify({
		"bno" : bno,
		"rno" : rno,
		"content" : content,
		"writer" : writer
	});

	var headers = {
		"Content-Type" : "application/json",
		"X-HTTP-Method-Override" : "POST"
	};
	
	if(content == ""){
		alert("답글을 입력해주세요.");
	}else{
		$('#input_rereply' + rno).val("");//입력란 비우기
		
		$.ajax({
			url : "${Path}/reply/write_rereply.do"
			,headers : headers
			,data : paramData
			,type : 'POST'
			,dataType : 'text'
			,success:function(result){
				getReplyList();
			},
			error:function(error){
				console.log("에러:"+ error);
			}
		});//end ajax
		
	};
};

//답글 수정
UpdateReReply = function fn_updateReply(rno, bno, r_depth) {
	var writer = $('#input_writer' + rno).val();
	var content = $('#input_content' + rno).val();
	
	var paramData = JSON.stringify({
		"bno" : bno,
		"rno" : rno,
		"r_depth" : r_depth,
		"content" : content,
		"writer" : writer
	});

	var headers = {
		"Content-Type" : "application/json",
		"X-HTTP-Method-Override" : "POST"
	};
	
	$.ajax({
		url : "${Path}/reply/update_rereply.do",
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

//동적 html에서는 onclick을 사용을 못하기에 jquery로 click버튼을 만듬
$(document).ready(function(){
	$(document).on("click", "button[name='list']", function(){
		getReplyList();
	});
});

//좋아요
var likeval = ${findLike}


	let bno = ${board.bno};
	let id = '${memberVO.id}';
	let like_type = ${likeVO.like_type};

	if(likeval > 0){
		console.log(likeval + "......좋아요 누름");

		$('.LikeBtn').html("좋아요 취소");
		$('.LikeBtn').click(function(){
			$.ajax({
				type : 'post'
			   ,url : '${Path}/like/likeDown.do'
			   ,contentType: 'application/json'
			   ,data : JSON.stringify({
				   "bno" : bno,
				   "id" :id,
				   "like_type" : like_type
			   }),
			 success : function(data){
				 alert('취소 성공');
				 location.reload();
			 	}
			});//end ajax
		})
	}else{
		console.log(likeval + ".....좋아요 안누름")
		console.log(id);
		$('.LikeBtn').click(function() {
			$.ajax({
				type :'post',
				url : '${Path}/like/likeUp.do',
				contentType: 'application/json',
				data : JSON.stringify(
						{
							   "bno" : bno,
							   "id" :id,
							   "like_type" : like_type
						}		
					),
				success : function(data) {
					alert('성공염');
					location.reload();
				}
			})//end ajax
		})	
}

</script>
</body>
</html>