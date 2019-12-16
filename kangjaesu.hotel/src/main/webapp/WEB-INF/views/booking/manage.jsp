<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../common/import.jsp"></jsp:include>
<style>
/*바디*/
.bodymain {
	padding: 0 30px 30px 30px;
}

/* 테이블*/
.table {
	text-align: center;
}

.th06 {
	width: 100px;
}

th {
	text-align: center;
}
</style>
<script>
var alert = function(msg, type) {
	swal({
		text: msg,
		icon: type,
		buttons: true,
		buttons: "확인",
	});
}

$(function() {		
	//보기 버튼, 제목 클릭시 호출
	$(".infoButton").click(function() {
		var tr = $(this).parent().parent();
		var bookingNum = tr.children().eq(0).text();
		var roomType = tr.children().eq(1).text();
		var name = tr.children().eq(3).text();
		$("#bookingNum").val(bookingNum);
		$("#roomType").val(roomType);
		$("#name").val(name);
		document.form.submit();
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
			<section class="container">
				<!-- 섹션 타이틀 -->
				<div class="location">
						<p>
							<a><span class="glyphicon glyphicon-home">&nbsp;></span></a> <a>예약관리</a>
						</p>
					</div>
				<div class="headTit">
					<h3>&nbsp;예약관리</h3>
				</div>
				<br> <br>
				<!-- 섹션 타이틀 끝-->
				<div class="container bodymain">
					<div class="panel panel-default">
						<div class="panel-body">
							<form class="form-inline text-center">
								<div class="form-group">
									<span> <select class="form-control">
											<option>예약번호</option>
											<option>예약인</option>
									</select>
									</span> <input type="text" class="form-control">
									<button class="btn btn-default" type="button">검색</button>
								</div>
							</form>
						</div>
					</div>

					<table class="table table-hover table-bordered table-condensed">
						<tr class="success">
							<th>예약번호</th>
							<th>객실</th>
							<th>숙박일</th>
							<th>예약인</th>
							<th class="th06"></th>
						</tr>
						<c:forEach var="list" items="${bookingList}">
						<tr>
							<td>${list.bookingNum}</td>
							<td>${list.roomType}</td>
							<td>${list.checkIn} ~ ${list.checkOut}</td>
							<td>${list.userName}</td>
							<td><button type="button" class="btn btn-success infoButton" id="${list.bookingNum}">예약정보</button></td>
						</tr>
						</c:forEach>
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
				</div>
				<!-- paging 끝 -->
		</section>
	</div>
	<form name="form" method="post" action="bookingInformation">
		<input id=bookingNum name="bookingNum" type="hidden" value="">
		<input id=roomType name="roomType" type="hidden" value="">
		<input id=name name="name" type="hidden" value="">
	</form>
	<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>