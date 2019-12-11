<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쌍용호텔</title>
<jsp:include page="../common/import.jsp"></jsp:include>
<style>
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
$(document).ready(function() {
	var roomtype = ("${room.roomType}");
	
	$("input:checkbox[name=rom]").each(function(){
		if(this.value == roomtype){
			this.checked =true;
		}
	});
	
	var guest   =("${room.guests }");
	$("input:checkbox[name=count]").each(function(){
		if(this.value == guest){
			this.checked =true;
		}
	});
	
	var option  =("${room.option.optNo}");
	$("input:checkbox[name=option]").each(function(){
		if(this.value == option){
			this.checked =true;
		}
	});
	

		
});
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
	   $(".back").click(function() {
		   window.history.back();
		    	  
		      
		   });
	   
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
					<div class="location">
						<p>
							<a><span class="glyphicon glyphicon-home">&nbsp;></span></a>
							<a>객실관리 ></a>
						 	<a>객실정보</a>	
						</p>
					</div>
					<div class="headTit">
						<h3>&nbsp;객실 정보</h3>
					</div>
					<br><br>
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
										<th>객실명${room.option.optNo}</th>
										<td> ${room.roomName}</td>
									</tr>
									<tr>
										<th>방타입</th>
										<td>
											<div class="custom-control custom-checkbox col-md-2">
												<input type="checkbox" class="custom-control-input" id="st" 
													name="rom" value="스탠다드" 
												
													disabled> <label
													class="custom-control-label" for="st">스탠다드</label>
											</div>
											<div class="custom-control custom-checkbox col-md-2">
												<input type="checkbox" class="custom-control-input" id="dt"
													name="rom" value="디럭스" disabled> <label class="custom-control-label"
													for="dt">디럭스</label>
											</div>
											<div class="custom-control custom-checkbox col-md-2">
												<input type="checkbox" class="custom-control-input" id="gt"
													name="rom" value="스탠다드" disabled> <label class="custom-control-label"
													for="gt">그랜드</label>
											</div> 
										</td>
									</tr>
									<tr>
										<th>옵션  </th>
										<td>
											<div class="custom-control custom-checkbox col-md-2">
												<input type="checkbox" class="custom-control-input"
													id="option1" name="option" value="1" disabled> <label
													class="custom-control-label" for="option1">조식</label>
											</div>
											<div class="custom-control custom-checkbox col-md-2">
												<input type="checkbox" class="custom-control-input"
													id="option2" name="option" value="2" disabled> <label
													class="custom-control-label" for="option2">스파</label>
											</div>
											<div class="custom-control custom-checkbox col-md-2">
												<input type="checkbox" class="custom-control-input"
													id="option3" name="option" value="3" disabled> <label
													class="custom-control-label" for="option3">야외수영장</label>
											</div>
											<div class="custom-control custom-checkbox col-md-2">
												<input type="checkbox" class="custom-control-input"
													id="option4" name="option" value="4"  disabled> <label
													class="custom-control-label" for="option4">엑스트라베드</label>
											</div>
										</td>
									</tr>
									<tr>
			
										<th>가능인원수</th>
										<td>
											<div class="custom-control custom-checkbox col-md-2">
												<input type="checkbox" class="custom-control-input" id="count1" 
													name="count" value="1"  disabled> <label
													class="custom-control-label" for="count1">1명</label>
											</div>
									 		<div class="custom-control custom-checkbox col-md-2">
												<input type="checkbox" class="custom-control-input" id="count2"
													name="count" value="2"  disabled> <label
													class="custom-control-label" for="count2">2명</label>
											</div>
											<div class="custom-control custom-checkbox col-md-2">
												<input type="checkbox" class="custom-control-input" id="count3"
													name="count" value="3" disabled> <label
													class="custom-control-label" for="count3">3명</label>
											</div>
											<div class="custom-control custom-checkbox col-md-2">
												<input type="checkbox" class="custom-control-input" id="count4"
													name="count" value="4" disabled> <label class="custom-control-label"
													for="count4">4명</label>
											</div> 
										</td>
			
									</tr>
									<tr>
										<th>금액</th>
										<td>${room.roomPrice }</td>
									</tr>
									<tr>
										<th>상세내용</th>
										<td><textarea rows="20" cols="100" onfocus="this.blur();">${room.roomContent }</textarea></td>
									</tr>
			
								</tbody>
							</table>
						</div>
			
						<div class="container center-block" style="text-align: center;">
							<a class="btn btn-default back" role="button">객실목록</a>
							<a class="btn btn-default" id="uppage" role="button">수정하기</a>
						</div>
					</form>
				</div>
			</section>
		</div>
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>