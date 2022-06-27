<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="Path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.final_pw_ck {
	display: none;
}
.final_pwck_ck {
	display: none;
}
.pwck_input_re_1{
    color : green;
    display : none;    
}
.pwck_input_re_2{
    color : red;
	display : none;    
}
</style>
<title>비번 변경</title>
</head>
<body>
	<h2>회원 정보 상세 페이지</h2>
	<form name="form" method="post">
	 	<input  type="password" value="${memberVO.pw}" placeholder="현재 비밀번호" />
		<div class="pw_wrap">
			<div class="pw_name"></div>
			<div class="pw_input_box">
				<input class="pw_input" name="pw" type="password" placeholder="새 비밀번호">			
			</div> 
			<span class="final_pw_ck">비밀번호를 입력해주세요.</span>
		</div>

		<div class="pwck_wrap">
			<div class="pwck_name"></div>
			<div class="pwck_input_box">
				<input class="pwck_input" type="password" placeholder="새 비밀번호 확인">			
			</div> 
			<span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span>
			<span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
            <span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
		</div>

			<input type="button" value="수정" id="btnUpdate">

	</form>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
var pwCheck = false; //비번
var pwckCheck = false;//비번확인
var pwckcorCheck = false; //비번확인 일치 확인

	$(document).ready(function(){
		$('#btnUpdate').click(function(){
			var pw = $('.pw_input').val();
			var pwck = $('.pwck_input').val();
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
			
			if(pwCheck && pwckCheck){
				document.form.action = "${Path}/member/MemberModify_info_pw.do";
				document.form.submit();
				alert("비밀번호 수정이 완료되었습니다. 재로그인 해주세요");	
			}
			
			return false;
		});
	});
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