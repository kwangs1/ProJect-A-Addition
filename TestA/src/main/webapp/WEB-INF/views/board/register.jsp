<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="Path" value="${pageContext.request.contextPath }"/>
<body>

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">글 작성</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

        <form role="form" action="${Path}/board/register.do" method="post">
          <div class="form-group">
            <label>제목 :</label> <input class="form-control" name='title'>
          </div>

          <div class="form-group">
            <label>내용 :</label>
            <textarea class="form-control" rows="3" name='content'></textarea>
          </div>

		   <div class="form-group">
            <input class="form-control" type="hidden" name='id' value="${memberVO.id }" />
          </div>
          
		   <div class="form-group">
			<select class="check" name="b_group" >
				<option value="" selected>말머리 선택해주세요</option>
				<option value="1">일반</option>
				<option value="2">Q&A</option>
			<c:if test="${memberVO.m_class == '우수회원' }">
				<option value="3">공지사항</option>
			</c:if>
			</select>
		   </div>

		
		<button type="submit" class="btn btn-default">작성</button>
          <button type="reset" onClick="goBack()">돌아가기</button>
        </form>

      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->

<script type="text/javascript">

function goBack(){
	window.history.back();
}

</script>

</body>
