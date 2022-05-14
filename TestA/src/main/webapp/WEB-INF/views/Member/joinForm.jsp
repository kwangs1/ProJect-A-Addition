<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<% request.setCharacterEncoding("utf-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style> 
#mail_check_input_box_false{
    background-color:#ebebe4;
}
 
#mail_check_input_box_true{
    background-color:white;
}

 
.correct{
    color : green;
}
.incorrect{
    color : red;
}
</style>
<title>회원가입</title>
</head>
<body>
<form action="${contextPath }/member/joinForm.do" method="post">
		<div>아이디
			<input type="text" name="id" id="id" size="20" />
		</div> 
		<div>비밀번호 
			<input type="text" name="pw" id="pw" size="20" />
		</div>

		<div class="mail_wrap">
			<div class="mail_name">이메일</div>
			<div class="mail_input_box">
				<input type="text" name="email" id="email" class="mail_input" /> 	
			</div>
			<div class="mail_input_box_warn">
				<div class="mail_check_input_box" id="mail_check_input_box_false">
					<input class="mail_check_input" disabled="disabled">	
				</div>
				<div class="mail_check_button">
					<span style="cursor:pointer;">인증번호 전송</span>
				</div>
				<div class="clearfix"></div>
				<span id="mail_check_input_box_warn"></span> <!-- 인증번호 일치여부 경고글 역활 -->
			</div>
		</div> 
		</br></br>
			<div>휴대번호</div>
				<input type="text" name="tel" id="tel" size="20" />		
				</br></br>
			<input type="submit" value="회원가입"> 
			<input type="button" value="취소" onclick="history.go(-1)">
	</form>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
var code = ""; //인증번호 저장하기 위한 코드

//이메일 보내기
	$(".mail_check_button").click(function(){
		var email = $(".mail_input").val();//입력한 이메일
		var checkBox = $(".mail_check_input");//인증번호 입력란
		var boxWrap = $(".mail_check_input_box"); //인증번호 입력란 박스
		
		$.ajax({
			type:"POST",
			url:"mailCheck.do?email=" +email,
			success:function(data){
				//console.log("data :" + data);
				checkBox.attr("disabled",false);
				boxWrap.attr("id" , "mail_check_input_box_true");
				code = data;
			}
				
		})
		
	});
	
//인증번호 비교
	$(".mail_check_input").blur(function(){
		var inputCode = $(".mail_check_input").val(); //입력코드
		var checkResult = $("#mail_check_input_box_warn") //비교 결과
		
		if(inputCode == code){ //일치할경우
			checkResult.html("인증번호가 일치합니다.");
			checkResult.attr("class", "correct");
		}else{
			checkResult.html("인증번호를 다시 확인해주세요.");
			checkResult.attr("class","incorrect");
		}
	});
</script>
</body>
</html>