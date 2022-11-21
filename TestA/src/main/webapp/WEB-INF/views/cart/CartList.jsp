<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix= "c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="Path" value="${pageContext.request.contextPath }"/>
<c:set var="CartList"  value="${cartMap.CartList}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<form method='get'>
	<table>
		<tr>
			<td>번호</td>
		</tr>
		
		<c:choose>
			<c:when test="${empty CartList }">
				<tr>
					<td>
						<strong>장바구니에 상품이 없습니다.</strong>
					</td>
				</tr>
			</c:when>
		  <c:otherwise>
		  	 	<c:forEach var="cart" items="${CartList}">
		  	 <tr>
		  	 		<td>${cart.bno}</td>
		  	 </tr>
		  	 <tr>
		  	 		<td>
		  	 			<input type=button value="삭제" style='cursor: pointer; border:none;'
								onClick="Delete_Cart(${cart.cno})">
					</td>
		  	 </tr>
		  	 	</c:forEach>
		  </c:otherwise>
		</c:choose>
	</table>	
</form>	
<script type="text/javascript">

	function Delete_Cart(cno) {
		var DelConfirm = confirm('삭제 하시겠습니까?');
		
		
		var paramData = {"cno" : cno};

		if(DelConfirm){	
			alert("삭제 되었습니다.");
		}else{
			alert("삭제가 취소 되었습니다.");
			return;
		}

		var form = document.createElement("form");
		form.setAttribute("method", "post");
		form.setAttribute("action", '${Path}/cart/DeleteCart.do');
		
		var cnoInput = document.createElement("input");
		cnoInput.setAttribute("type", "hidden");
		cnoInput.setAttribute("name", "cno");
		cnoInput.setAttribute("value", cno);

		form.appendChild(cnoInput);
		document.body.appendChild(form);
		form.submit();

	}
</script>
</body>
</html>