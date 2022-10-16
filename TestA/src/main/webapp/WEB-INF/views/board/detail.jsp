<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix= "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

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

<style>
/* 작성된 별점 css */
.star {
    position: relative;
    font-size: 2rem;
    color: #ddd;
}
.star span {
    width: 0;
    position: absolute;
    left: 0;
    color: gold;
    overflow: hidden;
    pointer-events: none;
}
/* 별점 작성 css*/
.star-ratings {
    display: flex;
    flex-direction: row-reverse;
    font-size: 2.25rem;
    line-height: 2.5rem;
    justify-content: space-around;
    padding: 0 0.2em;
    text-align: center;
    width: 5em;
  }
   
  .star-ratings input {
    display: none;
  }
   
  .star-ratings label {
    -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
    -webkit-text-stroke-width: 2.3px;
    -webkit-text-stroke-color: #2b2a29;
    cursor: pointer;
  }
   
  .star-ratings :checked ~ label {
    -webkit-text-fill-color: gold;
  }
   
  .star-ratings label:hover,
  .star-ratings label:hover ~ label {
    -webkit-text-fill-color: #fff58c;
  }
  /* 버튼 테두리 제거 */
  .LikeBtn{
    padding: 0;
	border: none;
	background: none;
  }
  .LikeBtn img{
  	width : 20px ;
  	height :20px ;
  }
</style>
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
		<button type="button" class="LikeBtn"  >
			<img src="${Path}/resources/image/like.png"  id="Like" > ${getLike}</button>
		<br>
	<div>
		<span class="star" > ★★★★★ <span
			style="width:calc(18.9%*${ratingAvg })">★★★★★</span>
			</span>
		<fmt:formatNumber value="${ratingAvg }" pattern="0.0" />
	</div>
		<div class="Reply" style="padding-top: 10px">			
		
				<h3 class= "ReplyList">댓글</h3>	
	
				<div id="replyList"></div>		
		
		</div>
	<br>
		<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">				
			
			<form name="form" id="form" method="post">				
				
				<input type="hidden" name="bno" id="bno" />

				<input name="writer" class="form-control" id="writer"
					value="${memberVO.id }" type="hidden" />
				<!-- 평점 -->
			<div class="star-ratings space-x-4 mx-auto">
				<input type="radio"  id="5-star" name="rating" value="5" />	
				<label for="5-star" class="star">★</label>
				
				<input type="radio"  id="4-star" name="rating" value="4" />
				<label for="4-star" class="star">★</label>
				
				<input type="radio"  id="3-star" name="rating" value="3" />
				<label for="3-star" class="star">★</label>
				
				<input  type="radio" id="2-star" name="rating" value="2" />
				<label for="2-star" class="star">★</label>
				
				<input  type="radio" id="1-star" name="rating" value="1" />
				<label for="1-star" class="star">★</label>
			</div>

			<div class="row">					
				<div class="col-sm-10">						
					<textarea name="content" id="content" class="form-control" rows="3" placeholder="댓글을 입력해 주세요" ></textarea>	
				<c:if test="${not empty memberVO}">	
					<button type="button"id="btnReplyAdd">등록</button>		
				</c:if>				
			</div>									
			</div>				
			</form>			
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
	var rating = $('input:radio[name=rating]:checked').val();
	
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
			 let rating = data[i].rating
		
			 if(r_depth == 0){ //댓글
				htmls +=  '<div class="media text-muted pt-3" id="rno' + rno + '">';
				htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';	                     
				htmls += '<span class="d-block">';	         
				htmls += '<strong class="text-gray-dark">' + writer + '</strong>';
				htmls += '<br>'
				htmls += '<span class="star"> ★★★★★ <span style="width:calc(18.9%*' +rating + ')">★★★★★</span></span>'
				htmls += '<br>'
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
	var Rating = $('input:radio[name=rating]:checked').val();

	if(Content == ""){
		alert("내용을 입력해주세요.");
		return ;
	}
	
	var paramData = JSON.stringify(
			{"content": Content
			,"writer" : Writer
			,"bno" : '${board.bno}'
			,"rating" : Rating
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
			window.location.reload();
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
var likeval = ${like};


	let bno = ${board.bno};
	let id = '${memberVO.id}';
	let like_type = 1;

	if(likeval > 0){
		console.log(likeval + "......좋아요 누름");

		//$('.LikeBtn').html("좋아요 취소");
		$('img').attr('src','${Path}/resources/image/like2.png')
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
					location.reload();
				}
			})//end ajax
		})	
}
</script>
</body>
</html>