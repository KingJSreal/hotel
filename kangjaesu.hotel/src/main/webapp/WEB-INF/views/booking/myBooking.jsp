<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../common/import.jsp"></jsp:include>
<style>
/* 패널 해드 */
.panel-heading {
	padding-left: 100px;
	padding-right: 120px;
}
/* 패널 해드 끝 */
/* 패널 */
.mainPanel {
	width: 80%;
	margin: 0 auto;
}
.pointpanel, .payment {
	margin-left: 80%;
}
.panel-body {
	padding: 30px;
}
/* 패널 끝 */

/* 테이블  */
colgroup col.info {
	background-color: #dff0d8;
	width: 150px;
	height: 500px;
}
colgroup col.col {
	width: 250px;
}
.confirm {
	width: 90%;
	margin: 0 auto;
}
/* 테이블  끝 */

/* 버튼 */
.buttongroup {
	width: 100%;
	margin-top: 30px;
	margin-bottom: 100px;
	margin-right: -90%;
}
.btn{
	margin-left: 10px;
}
/* 버튼 끝 */
</style>
<script>
var confirm = function(msg, type) {
	   swal(msg, {
		  	icon: type,
	        buttons: ["취소", "확인"],
	      }).then((value) => {
	    	  if(value){
				swal({
	    			title: "예약이 취소되었습니다.", 
					text: "환불처리는 1~3일정도 소요됩니다.",
					icon: "success",
					buttons: "확인",
				}).then((willDelete) => {
					location.href="/hotel/";
				});
	    	  }
	    	  else
	    		  return;
	      });
	}
	$(function() {
		//취소버튼 클릭시 호출
		$("#cancel").click(function() {
			confirm("예약을 취소 하시겠습니까?", "warning");
		});
		$("#backmypage_book").click(function(){
			location.href="/hotel/";
		})
	});
</script>
</head>
<body>
	<div>
		<jsp:include page="../common/header.jsp" />
		<jsp:include page="../common/gnb.jsp" />
		<div id="contents">
			<section class="container">
				<!-- 섹션 타이틀 -->
				<div class="container center-block">
					<div class="location">
						<p>
							<a><span class="glyphicon glyphicon-home">&nbsp;></span></a> <a>예약조회</a>
						</p>
					</div>
					<div class="headTit">
						<h3>&nbsp;예약조회</h3>
					</div>
					<br> <br>
				</div>
				<!-- 섹션 타이틀 끝-->
				<!-- 예약정보 패널 -->
				<div class="mainPanel">
					<div class="panel panel-default">

						<!-- 패널 헤드 -->
						<div class="panel-heading">
							<h3>예약정보</h3>
						</div>
						<!-- 패널 헤드 끝 -->

						<!-- 예약일, 예약번호 -->
						<div class="panel panel-default">
							<div class="panel-heading">
								<span>예약일: <label id="bookingDate"></label></span>
								<span class="pull-right regnum">예약번호:
									<label id="bookingNum"></label></span>
							</div>
						</div>
						<!-- 예약일, 예약번호 끝-->

						<!-- 테이블 -->
						<div class="panel-body">
							<table class="table table-bordered confirm">
								<colgroup>
									<col class="info">
									<col class="col">
									<col class="info">
									<col class="col">
								</colgroup>
								<tr>
									<td>호텔</td>
									<td>서울호텔</td>
									<td>성명</td>
									<td><label id="name"></label></td>
								</tr>
								<tr>
									<td>체크인</td>
									<td><label id="checkIn"></label></td>
									<td>체크아웃</td>
									<td><label id="checkOut"></label></td>
								</tr>
								<tr>
									<td>숙박일수</td>
									<td><label id="days"></label>박</td>
									<td>투숙인원</td>
									<td>성인: <label id="adult"></label> / 어린이: <label id="kid"></label></td>
								</tr>
								<tr>
									<td>객실</td>
									<td><label id="roomType"></label></td>
									<td>옵션</td>
									<td><label id="option"></label></td>
								</tr>
							</table>
						</div>
						<!-- 테이블 끝-->

						<!-- 포인트,요금 -->
						<div class="panel panel-default">
							<div class="panel-footer">
								<span class="pointpanel">사용 포인트: <label id="point"></label></span>
							</div>
							<div class="panel-footer">
								<span class="pointpanel">요금 합계: <label id="charge"></label></span>
							</div>
						</div>
						<!-- 포인트,요금 끝-->

						<!-- 결제수단 -->
						<div class="panel-footer">
							<span class="payment">결제 수단: <label id="payType"></label></span>
						</div>
					</div>
					<!-- 예약정보 패널 끝-->
					<div class="buttongroup">
						<button type="button" class="btn btn-warning pull-right"
							id="cancel">예약취소</button>
				<!-- 		<button type="button" class="btn btn-default pull-right"
							id="backmypage_book">목록으로</button> -->
					</div>
				</div>
			</section>
		</div>
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>