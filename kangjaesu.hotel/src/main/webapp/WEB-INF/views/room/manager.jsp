<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script type="text/javascript">

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
	    		 document.location.href="01.html";
	    	 }else{
	    		 alert("취소하였습니다.", "warning" );
	    		 return;	
	    	 }
	         });
	}

	
	$(function() {
	   //취소버튼 클릭시 호출
	   $(".delbtn").click(function () {
		   var roomNumber = $(this).attr('id').substr(1);
		  
		   swal("삭제하시겠습니까?", {
			   icon: "warning",
		        buttons: ["취소", "확인"],
		      }).then((value) =>{
		      if(value)
		   $.ajax({
				url:"delete",
				method:"GET",
				data: {					
					roomNum:roomNumber
				 	
				},
				success:function(){
	       			location.href = "/hotel/room/roomManager";
	       		
				},
				error:function(a, b, errMsg){
					alert("에러"+ errMsg);
				}
				
			})
			else
				return;
		      });
	});
	   
	   $(".databtn").click(function () {
		  
		   var roomNumber = $(this).attr('id').substr(1);
			
		   swal("이동 하시겠습니까?", {
			   icon: "warning",
		        buttons: ["취소", "확인"],
		      }).then((value) =>{
		      if(value){
		   $.ajax({
				url:"roomData",
				method:"GET",
				data: {					
					roomNum:roomNumber
				 	
				},
				success:function(){
					
	       			location.href = "roomde";
	       		
				},
				error:function(a, b, errMsg){
					alert("에러"+ errMsg);
				}
				
			})}
			else
				return;
		      }); 
	});
		   
	});	



</script>

<style>
/*등록버튼*/
.registButton {
	width: 100%;
}

/*검색패널*/
.searchBar {
	margin-top: 20px;
	margin-bottom: 20px;
}

.form-control-static {
	margin-left: 20px;
}

/*테이블*/
.th1, .th3 {
	width: 100px;
}

.th2 {
	width: 300px;
}

.th4, .th5 {
	width: 200px;
}

.table {
	width: 90%;
	margin: 0 auto;
	text-align: center;
	vertical-align: middle;
}

th {
	text-align: center;
}
/* 테이블 끝 */
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<!-- 헤더 -->
		<jsp:include page="../common/header.jsp" />
		<jsp:include page="../common/gnb.jsp" />
	</div>

	<!-- 예약정보 검색 -->

	<div class="container text-center">
		<!-- 객실등록 버튼 -->
		<a class="btn btn-primary btn-lg registButton " href="/hotel/room/roomAdd"
			role="button">객실등록</a> <br> <br>
		<!-- 객실등록 버튼 끝 -->
		<!-- 검색 패널 -->
		<div class="container center-block text-center">
			<div class="panel panel-default">
				<form class="form-inline searchBar">
					<div class="form-group">
						<p class="form-control-static">최대인원</p>
						<select class="form-control">
							<option>4</option>
							<option>3</option>
							<option>2</option>
							<option>1</option>
						</select>
						<p class="form-control-static">등록일자</p>
						<div class="input-group date">
							<input type="date" class="form-control"> <span
								class="input-group-addon"> <i
								class="glyphicon glyphicon-calendar"></i>
							</span>
						</div>
						~
						<div class="input-group date">
							<input type="date" class="form-control"> <span
								class="input-group-addon"> <i
								class="glyphicon glyphicon-calendar"></i>
							</span>
						</div>
						<p class="form-control-static">객실 명</p>
						<input type="text" id="keyword" name="keyword" class="form-control">
					</div>

					<button type="button" id="btnSearch" name="btnSearch" class="btn btn-default">검색</button>
				</form>
			</div>
		</div>
		<!-- 검색패널 끝 -->
		<br>

		<div class="container center-block">
			<table class="table table-hover table-bordered">
				<thead class="thead">
					<tr class="info">
						<th class="th1">번호</th>
						<th class="th2">객실명</th>
						<th class="th3">최대인원</th>
						<th class="th4">등록일자</th>
						<th class="th5"></th>
					</tr>
				</thead>
				<tbody>
				
					<c:forEach var="list" items="${roomList}">
					<tr>
						<th>${list.roomNum }</th>
						<td>${list.roomName }</td>
						<td>${list.guests }</td>
						<td>${list.roomRegDate }</td>
						<td><a class="btn btn-default databtn" id="a${list.roomNum }" role="button">보기</a>
							<a class="btn btn-default" href="04.html" role="button">수정</a>
							<button class="btn btn-danger delbtn" id="c${list.roomNum }" >삭제</button></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- paging -->
			<div class="paging" style="text-align: center">
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a>
					</li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">4</a></li>
					<li class="page-item"><a class="page-link" href="#">5</a></li>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
				</ul>
			</div>
			<!-- paging 끝 -->
		</div>
	</div>
	<!-- 푸터 -->
	<jsp:include page="../common/footer.jsp" />
	<!-- 푸터 끝 -->
</body>
</html>