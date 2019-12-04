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
	   $("#delete1").click(function() {
		      confirm("삭제하시겠습니까","warning") 
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
		<header>
			<!-- 타이틀 -->
			<div class="container">
				<div class="center-block title">
				   <a class="logo" href="../main/08.html" style="margin-left:37.5%">Seoul HOTEL Admin</a>
				   <!-- 관리자 로그인 -->
				   <ul class="nav navbar-nav navbar-right">
					  	<li><a href="../main.html" class="header_a">로그아웃</a></li>
					  	<li><a href="../main.html" class="header_a">이용자 화면 보기</a></li>			
				   </ul>
				   <!--관리자 로그인 끝 -->
				</div>
			</div>
			<!--타이틀 끝 -->			
		</header>
		<br>
		<!-- 메인메뉴 -->
		<nav>
			<div class="container">
				<div class="navi-admin">
					<ul class="mainMenu">
						<li><a href="../user/07.html">회원관리</a></li>
						<li><a href="../room/01.html">객실관리</a></li>
						<li><a href="../booking/06.html">예약관리</a></li>
						<li><a href="../inquiry/04.html">문의관리</a></li>
						<li><a href="../promotion/03.html">프로모션 관리</a></li>
					</ul>
				</div>
			</div>
			<hr style="background-color: #B4B4B4; height: 1px solid;">
		</nav>
		<!--메인메뉴 끝 -->
		<!-- 헤더 끝 -->
	</div>

	<!-- 예약정보 검색 -->

	<div class="container text-center">
		<!-- 객실등록 버튼 -->
		<a class="btn btn-primary btn-lg registButton " href="02.html"
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
						<input type="text" class="form-control">
					</div>

					<button type="submit" class="btn btn-default">검색</button>
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
						<td><a class="btn btn-default" href="03.html" role="button">보기</a>
							<a class="btn btn-default" href="04.html" role="button">수정</a>
							<button class="btn btn-danger" id="delete1" >삭제</button></td>
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
	<footer>
		<div class="container center-block">
			<dl>
				<dd>
					<span class="logo" style="color: white;">Seoul HOTEL</span>
				</dd>
				<dd>
					<table class="table-footer">
						<tr>
							<td>| 상호명: Seoul HOTEL</td>
							<td>| 대표명: 김철수</td>
						</tr>
						<tr>
							<td colspan="2">| 사업자등록번호: 000-00-0000</td>
						</tr>
						<tr>
							<td colspan="2">| (000-00) 서울시 마포구 OOOO</td>
						</tr>
						<tr>
							<td>| TEL: 070-0000-0000</td>
							<td>| Email: hotel@hotel.co.kr</td>
						</tr>
						<tr>
							<td colspan="2">Copyright 2020 HOTEL Corp. All Rights
								Reserved</td>
						</tr>
					</table>
				</dd>
			</dl>
		</div>
	</footer>
	<!-- 푸터 끝 -->
</body>
</html>