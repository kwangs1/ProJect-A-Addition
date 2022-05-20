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
/* 비밀번호 확인 일치 유효성검사 */
.pwck_input_re_1{
    color : green;
    display : none;    
}
.pwck_input_re_2{
    color : red;
	display : none;    
}
</style>
<title>회원가입</title>
<link rel="stylesheet" href="${contextPath}/resources/css/join.css">
</head>
<body>
<form method="post" id="join_form">

		<div class="id_wrap">
			<div class="id_name">아이디</div>
			<div class="id_input_box">
				<input class="id_input" name="id">
			</div>
			<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
			<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
			<span class="final_id_ck">아이디를 입력해주세요.</span>
		</div> 
		
		<div class="pw_wrap">
			<div class="pw_name">비밀번호</div>
			<div class="pw_input_box">
				<input class="pw_input" name="pw">			
			</div> 
			<span class="final_pw_ck">비밀번호를 입력해주세요.</span>
		</div>
		
		<div class="pwck_wrap">
			<div class="pwck_name">비밀번호 확인</div>
			<div class="pwck_input_box">
				<input class="pwck_input">			
			</div> 
			<span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span>
			<span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
            <span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
		</div>
		
		<div class="mail_wrap">
			<div class="mail_name">이메일</div>
			<div class="mail_input_box">
				<input type="text" name="email" class="mail_input" /> 	
			</div>
			<span class="final_mail_ck">이메일을 입력해주세요.</span>
			
			<div class="mail_input_box_warn">
				<div class="mail_check_input_box" id="mail_check_input_box_false"><!-- 입력란 색상 변경하기위해 id 추가 -->
					<input class="mail_check_input" disabled="disabled">	
				</div>
				<div class="mail_check_button">
					<span>인증번호 전송</span>
				</div>
				<div class="clearfix"></div>
				<span id="mail_check_input_box_warn"></span> <!-- 인증번호 일치여부 경고글 역활 -->
			</div>
		</div> 
		
		<div class="tel_wrap">
				<div class="tel_name">휴대번호</div>
				<div class="tel_input_box">
					<input class="tel_input" name="tel">		
				</div>
				<span class="final_tel_ck">휴대번호를 입력해주세요.</span>
			</div>
				</br>
		<div class="join_button_wrap">
			<input type="button" class="join_button" value="가입하기">
			<input type="button" value="취소" onclick="history.go(-1)">
		</div>
</form>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
var code = ""; //인증번호 저장하기 위한 코드

//유효성 검사 통과유무 변수
var idCheck = false; //아이디
var idckCheck = false; //중복검사
var pwCheck = false; //비번
var pwckCheck = false;//비번확인
var pwckcorCheck = false; //비번확인 일치 확인
var mailCheck = false; //이메일
var mailnumCheck =false; //이메일 인증번호
var telCheck = false; //휴대번호 


$(document).ready(function(){
	//회원가입 버튼(회원가입 기능 작동)
	$(".join_button").click(function(){
		//입력값 변수
		var id = $('.id_input').val();
		var pw = $('.pw_input').val();
		var pwck = $('.pwck_input').val();
		var mail = $('.mail_input').val();
		var tel = $('.tel_input').val();
		
 		//id 유효성 검사
		if(id = ""){
			$('.final_id_ck').css("display",'block');
			idCheck = false;
		}else{
			$('.final_id_ck').css('display','none');
			idCheck = true;
		}
		
		//비밀번호 유효성 검사
		if(pw == ""){
			$('.final_pw_ck').css('display','block');
			pwCheck = false;
		}else{
			$('.final_pw_ck').css('display', 'none');
			pwCheck = true;
		}
		
		//비밀번호 확인 유효성 검사
		if(pwck == ""){
			$('.final_pwck_ck').css('display','block');
			pwckCheck = false;
		}else{
			$('.final_pwck_ck').css('display', 'none');
			pwckCheck = true;
		}
		
		//휴대폰 유효성 검사
		if(tel == ""){
			$('.final_tel_ck').css('display','block');
			telCheck = false;
		}else{
			$('.final_tel_ck').css('display','none');
			telCheck = true;
		}
		
		//e-mail 유효성 검사
		if(mail == ""){
			$('.final_mail_ck').css('display','block');
			mailCheck = false;
		}else{
			$('.final_mail_ck').css('display', 'none');
			mailCheck = true;
		}
		
        //최종 유효성 검사
		if(idCheck && pwCheck && pwckCheck && mailCheck){
			$("#join_form").attr("action", "${contextPath}/member/joinForm.do");
			$("#join_form").submit();	
		}
        
        return false;

	});
});


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
			mailnumCheck = true;
		}else{
			checkResult.html("인증번호를 다시 확인해주세요.");
			checkResult.attr("class","incorrect");
			mailnumCheck = false;
		}
	});

//id 중복검사
$('.id_input').on("propertychange change keyup paste input" , function(){
	/* console.log("keyup test"); */
	var id = $('.id_input').val(); //.id_input에 입력되는 값
	var data = {id : id} //컨트롤러에 넘길 데이터 이름 : 데이터(.id_input에 입력되는 값)
	
	$.ajax({
		type : "POST",
		url : "${contextPath}/member/IdCheck.do",
		data : data,
		success : function(result){
			//console.log("성공여부:" + result);
			if(result != 'fail'){
				$('.id_input_re_1').css("display","inline-block");
				$('.id_input_re_2').css("display","none");	
				idchCheck=true;
			}else{
				$('.id_input_re_2').css("display","inline-block");
				$('.id_input_re_1').css("display","none");	
				idckCheck = false;
			}
		}//success 끝
	});//ajax 끝
});// function 끝

//pw 확인 일치 유효성 검사
$('.pwck_input').on("propertychange change keyup paste input", function(){
 
    var pw = $('.pw_input').val();
    var pwck = $('.pwck_input').val();
    $('.final_pwck_ck').css('display', 'none');
 
    if(pw == pwck){
        $('.pwck_input_re_1').css('display','block');
        $('.pwck_input_re_2').css('display','none');
        pwckcorCheck = true;
    }else{
        $('.pwck_input_re_1').css('display','none');
        $('.pwck_input_re_2').css('display','block');
        pwckcorCheck = false;
    }        
    
});  
</script>
</body>
</html>