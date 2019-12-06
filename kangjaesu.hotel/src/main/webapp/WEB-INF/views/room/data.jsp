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
/*메인 섹션*/
section {
	margin: 0px 0 50px 0;
}

div .searchBar {
	margin-top: 20px;
	margin-bottom: 20px;
}

div.promotion-title {
	padding-bottom: 5px;
}

h4.promotion-title {
	margin-bottom: 0px;
}

#more {
	float: right;
	font-size: 15px;
	text-decoration: none;
}

#more:hover {
	color: #A0A0A0;
}
/*메인 섹션 끝*/


input[type="checkbox"] {
	display: none;
	float: left;
}

input[type="checkbox"]+label {
	display: inline-block;
	cursor: pointer;
	position: relative;
	padding-left: 25px;
	padding-right: 15px;
	font-size: 13px
}

input[type="checkbox"]+label:BEFORE {
	content: "";
	display: inline-block;
	width: 20px;
	height: 20px;
	margin-right: 10px;
	position: absolute;
	left: 0;
	bottom: 1px;
	background-color: #ccc;
}

input[type="checkbox"]:checked+label:BEFORE {
	content: "\2713";
	text-shadow: 1px 1px 1px raba(0, 0, 0 .2);
	font-size: 18px;
	font-weight: 800;
	color: #fff;
	background: #2187c1;
	text-align: center;
	line-height: 18px;
}

/* 섹션 타이틀 */
.headTit {
	border-bottom: #432c10 solid 2px;
	height: 47px;
	font-style: Sans-Serif;
}
/* 섹션 타이틀 끝 */

/*폼*/
.tableContainer {
	width: 90%;
}

.inputGroup {
	margin-left: 5%;
}

.input-group {
	margin: 20px;
}

.priceInput {
	text-align: right;
	width: 120px;
}
/*폼 끝*/
</style>
<script>
var confirm = function(msg, type) {
	   swal(msg, {
		    icon: type,
	        buttons: ["취소", "확인"],
	      }).then((value) => {
	    	 if(value){ 
	    		 document.location.href="04.html";
	    	 }else{
	    		 alert("취소하였습니다", "warning");
	    		 return;
	    	 }
	         });
	}

	
	$(function() {
	   //취소버튼 클릭시 호출
	   $("#uppage").click(function() {
	      confirm("등록하시겠습니까","warning")
	    	  
	      
	   });
	});



	$(document).ready(function() {
		$("#header").load("main01.html");
		$("#nav").load("main04.html");
		$("#footer").load("main09.html");
	});
	var alert = function(msg, type) {
		swal({
			title : "",
			text : msg,
			icon : type,
			timer : 1000,
			customClass : "sweet-size",
			showConfirmButton : false
		});
	}

	
</script>
</head>
<body>

	<div>
		<jsp:include page="../common/header.jsp" />
		<jsp:include page="../common/gnb.jsp" />
		<!-- 예약정보 검색 -->
		<div id="contents">
			<section>
			<div class="container center-block">
		<div class="headTit">
			<h3>&nbsp;객실정보</h3>
		</div>
		<br> <br>
	</div>
	<!-- 섹션 타이틀 끝-->
	<div class="container">
		<form id="form" class="form-inline">
			<div class="container inputGroup">
				<div class="input-group col-md-3">
					<img width="300" height="200" class="previewImg"> 
				</div>
				<div class="input-group col-md-3">
					<img width="300" height="200" class="previewImg1"> 
				</div>

				<div class="input-group col-md-3">
					<img width="300" height="200" class="previewImg2">
				</div>
			</div>
			<br>
			<div class="container tableContainer">
				<table class="table table-hover table-bordered">

					<tbody>
						<tr>
							<th>객실명</th>
							<td>${room.roomNum} ${room.roomName}</td>
						</tr>
						<tr>
							<th>방타입</th>
							<td>
								<div class="custom-control custom-checkbox col-md-2">
									<input type="checkbox" class="custom-control-input" id="st"
										name="rom"  disabled> <label
										class="custom-control-label" for="st">스탠다드</label>
								</div>
								<div class="custom-control custom-checkbox col-md-2">
									<input type="checkbox" class="custom-control-input" id="dt"
										name="rom" disabled> <label class="custom-control-label"
										for="dt">디럭스</label>
								</div>
								<div class="custom-control custom-checkbox col-md-2">
									<input type="checkbox" class="custom-control-input" id="gt"
										name="rom" disabled> <label class="custom-control-label"
										for="gt">그랜드</label>
								</div>
							</td>
						</tr>
						<tr>
							<th>옵션</th>
							<td>
								<div class="custom-control custom-checkbox col-md-2">
									<input type="checkbox" class="custom-control-input"
										id="option1" name="option" disabled> <label
										class="custom-control-label" for="option1">조식</label>
								</div>
								<div class="custom-control custom-checkbox col-md-2">
									<input type="checkbox" class="custom-control-input"
										id="option2" name="option" disabled> <label
										class="custom-control-label" for="option2">스파</label>
								</div>
								<div class="custom-control custom-checkbox col-md-2">
									<input type="checkbox" class="custom-control-input"
										id="option3" name="option" disabled> <label
										class="custom-control-label" for="option3">야외수영장</label>
								</div>
								<div class="custom-control custom-checkbox col-md-2">
									<input type="checkbox" class="custom-control-input"
										id="option4" name="option" checked="checked" disabled> <label
										class="custom-control-label" for="option4">엑스트라베드</label>
								</div>
							</td>
						</tr>
						<tr>

							<th>가능인원수</th>
							<td>
								<div class="custom-control custom-checkbox col-md-2">
									<input type="checkbox" class="custom-control-input" id="count1"
										name="count"  disabled> <label
										class="custom-control-label" for="count1">1명</label>
								</div>
								<div class="custom-control custom-checkbox col-md-2">
									<input type="checkbox" class="custom-control-input" id="count2"
										name="count"  disabled> <label
										class="custom-control-label" for="count2">2명</label>
								</div>
								<div class="custom-control custom-checkbox col-md-2">
									<input type="checkbox" class="custom-control-input" id="count3"
										name="count"  disabled> <label
										class="custom-control-label" for="count3">3명</label>
								</div>
								<div class="custom-control custom-checkbox col-md-2">
									<input type="checkbox" class="custom-control-input" id="count4"
										name="count" disabled> <label class="custom-control-label"
										for="count4">4명</label>
								</div>
							</td>

						</tr>
						<tr>
							<th>금액</th>
							<td>420000</td>
						</tr>
						<tr>
							<th>상세내용</th>
							<td><textarea rows="20" cols="100" onfocus="this.blur();">
- 본 상품은 성인 2인 1실 기준이며, 요금에는 10% 부가가치세 및 10% 봉사료 (합계 21%)가 부과됩니다.

- 본 상품은 Shilla S 멤버십 또는 카드사 할인 등의 중복 할인 혜택이 적용되지 않습니다.

- 본 상품은 체크인 일자 기준 1일 전까지만 예약 가능하며(당일 예약 불가), 홈페이지 및 모바일 앱을 통한 온라인 예약만 가능합니다.

- 기준 인원을 초과하여 투숙 시 추가 인원에 대해서는 별도의 요금이 부과됩니다.

- 객실 1실 당 성인은 최대 3인까지만 투숙 가능하며, 소인(37개월 이상~만 12세 이하)은 최대 2인까지만 동반 투숙 가능합니다.

- 객실 1실 당 성인과 소인 동반 시 최대 4인까지만 투숙 가능합니다.

- Check-in은 오후 3시, Check-out은 정오까지입니다.
						</textarea></td>
						</tr>

					</tbody>
				</table>
			</div>

			<div class="container center-block" style="text-align: center;">
				<a class="btn btn-default" href="01.html" role="button">객실목록</a>
				<a class="btn btn-default" id="uppage" role="button">수정하기</a>
			</div>
		</form>
	</div>
	<br>
	<br>
			</section>
		</div>
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>