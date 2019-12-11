<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쌍용호텔</title>
<jsp:include page="../common/import.jsp"></jsp:include>
<!-- 
	- res/js 추가 시
	<script src="<c:url value="/js/common.js"/>"></script>  
-->
<style>
	/*
	- res/css 추가 시
	@import url("<c:url value="/css/section.css" />");
	*/
</style>
<script>
$(document).ready(function(){
	$("#read").click(function(){
		$("#bx").show();
		$("#bx1").show();
		$("#textbox").attr("readonly",false).attr("disabled".false);
		
		});
	
	$("#bx, #bx1").click(function(){
		$("#bx").hide();
		$("#bx1").hide();
		$("#textbox").attr("readonly",true).attr("disabled".false);
		
		});


});
	


var alert = function(msg, type) {
	swal({
		title : "",
		text : msg,
		icon : type,
		customClass : "sweet-size",
		showCancelButton : true,
	});
}
var confirm = function(msg, type) {
	   swal(msg, {
		   icon: type,
	        buttons: ["취소", "확인"],
	      }).then((value) => {
	    	 if(value){ 
	    		 document.location.href="03.html";
	    	 }else{
	    		 alert("취소하였습니다.", "warning" );
	    		 return;
	    	 }
	         });
	}

$(function(){
	  $("#back").click(function() {
		   window.history.back();
		    	  
		      
		   });
});
</script>
</head>
<body>
	<div>
		<jsp:include page="../common/header.jsp" />
		<jsp:include page="../common/gnb.jsp" />
		<!-- 예약정보 검색 -->
		<div id="contents">
			<section>
			<div class=" container" >

<div class="container center-block" style="width: 80%; "  >
	
	
	<!-- //<button class="btn btn-primary" type="button" value="후기 등록" style="text-align: reight; float: right;" onclick="location.href='01.html' ">후기 등록</button>
	<br><br> -->
		
	<table class="table table-sm"  id="table1">
  <thead>
    <tr  class="info">
      <th scope="col">제목 : ${comment.revTitle }</th>
      <th scope="col">작성자 : ${comment.revNum } 님</th>
      <th scope="col"></th>
      <th scope="col">작성일 : ${comment.rate }</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th class="table-light" scope="row" colspan="4" height="200px;"><font color="black">${comment.revContent }</font></th>
     
    </tr>
 
    <tr><td colspan="4">작성된 댓글</td></tr>
   	<tr><td colspan="4">
   		<textarea rows="5" cols="100%" style="width: 800px;" placeholder="-최대 000자 까지 작성할수있습니다(띄어쓰기 포함)<br>
   		- ※ 욕설, 영업에 방해되는 글은 관리자에 의해 삭제됩니다."></textarea>
   			<input type="button" class="btn btn-default " value="댓글 등록" id="add" style="text-align: reight; float: right;">
   	</td>
   	
   	</tr>
   	<tr>
   		<td colspan="3">id:아이디  &nbsp; | 2018-10-10 <br>
   		<input value="안녕하세요 후기 잘봤어요" readonly="readonly" id="textbox" class="form-control"/>
   		<input type="button" class="btn btn-danger" value="취소" style="display: none;" id="bx">
   		<input type="button" class="btn btn-danger" value="수정하기" style="display: none;" id="bx1"></td>
   		<td>
    			<input type="button" class="btn btn-danger" value="삭제" id="delete1" style="text-align: reight; float: right;">
   			<input type="button" class="btn btn-default" value="수정" id="read"  style="text-align: reight; float: right;">
   			
  		</td>
   	</tr>
   	
   	<tr>
   		<td colspan="3">id:아이디  &nbsp; | 2018-10-10 <br>
   		<input value="안녕하세요 후기 잘봤어요" readonly="readonly" id="textbox" class="form-control"/></td>
   		<td>
   			<input type="button" class="btn btn-danger" value="삭제" id="delete1" style="text-align: reight; float: right;">
   			<input type="button" class="btn btn-default" value="수정" id="read1"  style="text-align: reight; float: right;">
   		</td>
   	</tr>
   	
   	<tr >
   		<td colspan="3">id:아이디  &nbsp; | 2018-10-10 <br>
   		<input value="안녕하세요 후기 잘봤어요" readonly="readonly" id="textbox" class="form-control"/>
   		<input type="button"  class="btn-default" id="txtbtn" style="display: none;" value="수정"/></td>
   		<td>
   			<input type="button" class="btn btn-danger" value="삭제" id="delete1" style="text-align: reight; float: right;">
   			<input type="button" class="btn btn-default" value="수정" id="read2"  style="text-align: reight; float: right;">
   		</td>
   	</tr>
  </tbody>
</table>	
	</div>
	<br>
	<div class="container center-block">
	
	<button class="btn btn-primary" type="button" value="후기 등록" style="text-align: reight; float: right;"  id="back" >목록으로</button>
	<button class="btn btn-default" type="button" value="후기 수정" style="text-align: reight; float: right;"   >수정 하기</button>
		
	</div>
	</div><br><br>
			</section>
		</div>
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>