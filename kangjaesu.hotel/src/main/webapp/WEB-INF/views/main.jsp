<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쌍용호텔</title>
<jsp:include page="common/import.jsp"></jsp:include>
<style>
	div .searchBar {
		margin-top: 20px;
		margin-bottom: 20px;
	}
	
	div.promotion-title{
		padding-bottom: 5px;
	} 
	h4.promotion-title{
		margin-bottom: 0px;
	} 
	
	#more{
		float: right;
		font-size: 15px;
		text-decoration:none;
	}
	#more:hover{
		color:#A0A0A0;
	}
	/*메인 섹션 끝*/
	
.table-responsive {
	width: 90%;
	margin: 0 auto;
}

.modalbtn {
	margin-left: 50%;
}

.inputGroup {
	text-align: center;
}

.input-group {
	margin: 20px;
}

.previewImg {
	float: left;
}

div .searchBar {
	margin-top: 20px;
	margin-bottom: 20px;
}

.panel-defaul button {
	margin: 10px;
}

.custom-checkbox {
	float: left;
}

input[type="checkbox"] {
	display: none;
}

input[type="checkbox"]+label {
	display: inline-block;
	cursor: pointer;
	position: relative;
	margin-right: 25px;
	font-size: 12px
}

input[type="checkbox"]+label:BEFORE {
	content: "";
	display: inline-block;
	width: 20px;
	height: 20px;
	margin-right: 5px;
	left: 0;
	background-color: #ccc;
}

input[type="checkbox"]:checked+label:BEFORE {
	content: "\2713";
	font-size: 18px;
	color: #fff;
	background: #2187c1;
	text-align: center;
}

.isotope-element {
	width: 100%;
}

.table {
	border: 1px solid #dddddd;
}

/* DivTable */
.divTable {
	display: table;
	width: 100%;
}

.divTableRow {
	margin-left: 230px;
	display: table-row;
}

.divTableCell {
	display: table-cell;
	padding: 3px 10px;
}

.col1 {
	width: 148px;
	text-align: right;
}

.col2 {
	width: 600px;
}

.inputpice {
	letter-spacing: 1px;
}
</style>
</head>
<script>
function confirmModalButton(roomNumber){
	$("input:checkbox[name=rom]").prop("checked",false);
	$("input:checkbox[name=count]").prop("checked",false);
	$("input:checkbox[name=option]").prop("checked",false);
	
	$.ajax({
		url : "room/getData",
		method : "GET",
		data : {
			roomNum : roomNumber
		},
		success : function(room) {
			var options = room.option;
			var optionList = options.split(" ");
			$("input:checkbox[name=option]").each(function(index){
				for(var i=0;i<optionList.length;i++){
				    if(index == optionList[i]){
				    	$(this).prop("checked", true);
					}
				}
  			}); 
		  		
			var roomImages = [room.roomImage1, room.roomImage2, room.roomImage3];	
			$(".previewImg").each(function(idx, img){
				if(roomImages[idx] != null)
					$(this).attr("src", "<c:url value='/img/" + roomImages [idx] + "'/>");
				})
			$("#roomType").val(room.roomName);
			$("#roomContent").val(room.roomContent);
			$("input:checkbox[name=rom][value=" +room.roomType+ "]").prop("checked",true);
			$("input:checkbox[name=count][value=" +room.guests+ "]").prop("checked",true);
			$("#price").text(room.roomPrice);
			
			$("#confirmModa1").modal('show');
		
		},
		error : function(a, b, errMsg) {
			alert("오류" + errMsg);
		}
	});
}

$(function(){
	$("#dateForm").val("");
	$("#adult").val("선택");
	$("#kid").val("0");
	
	$.ajax({
		url:"room/roomList",
		method:"POST",
		success:function(result){
			$('#roomList').empty();
			
			if(result.length > 0 ){
				var roomList = [];
				$(result).each(function(idx, room){
					if(idx > 7) return;
					var roomImage = '<c:url value="/img/' + room.roomImage1 + '"/>';
					roomList.push(
							'<div class="col-sm-3 col-md-3">'+
						 	'<div class="thumbnail">' +
						    '<img src="' + roomImage +'" id="' + room.roomNum + '" class="thumbnail confirmModalButton"' +
						     ' style="height: 200px");"></a>' +
						    	'<div class="caption">' +
						           '<h3>서울호텔</h3>' +
						           '<h4>' + room.roomType + '</h4>' +
						           '<p>' + room.roomName + '</p>' +
						        '</div>' +
								'</div>' +
							'</div>'
					);
				});
				
				$('#roomList').append(roomList.join(''));	
				
				$(".confirmModalButton").click(function () {
					confirmModalButton($(this).attr("id"));
				});
			}
		},
		error:function(a, b, errMsg){
			$('#roomList').empty();
			$('#roomList').append(
					
				'<tr><td colspan="6"><b>포인트 사용 내역을 불러오지 못했습니다.</b></td></tr>'	
				);
		}
	});

	
})
</script>
<body>
	<div>
		<jsp:include page="common/header.jsp" />
		<jsp:include page="common/gnb.jsp" />
		<!-- 예약정보 검색 -->
		<div id="contents">
			<section>
				<div class="container center-block text-center">
					<div class="panel panel-default">
						<form class="form-inline searchBar">
							<div class="form-group">
				            	<p class="form-control-static">예약정보를 선택하세요</p>
				            	<p class="form-control-static">&nbsp; | &nbsp; 체크인</p>
				            <div class="input-group date">
				               	<input type="date" class="form-control" placeholder="체크인"
				                  value="체크인">
			                	<span class="input-group-addon">
				                	<i class="glyphicon glyphicon-calendar"></i>
			                	</span>
				            </div>
				            <p class="form-control-static">&nbsp; | &nbsp; 체크아웃</p>
				            <div class="input-group date">
				            	<input type="date" class="form-control" placeholder="체크아웃">
				            	<span class="input-group-addon">
				            		<i class="glyphicon glyphicon-calendar"></i>
			            		</span>
				            </div>
				            <p class="form-control-static">&nbsp; | &nbsp; 성인</p>
				            <select class="form-control">
				            	<option>1</option>
				               	<option>2</option>
				             	  <option>3</option>
				            </select>
				            <p class="form-control-static">&nbsp; | &nbsp; 유아</p>
				            <select class="form-control">
				               	<option>0</option>
				               	<option>1</option>
				              	<option>2</option>
				              	<option>3</option>
				            </select>
				         </div>
				         <button type="submit" class="btn btn-default">검색</button>
				      </form>
				   	</div>
				</div>
				<!-- 예약정보 끝 -->
			
				<!-- 패키지 프로모션 -->
				<div class="container center-block text-center">
					<div class="panel panel-default">
						<div class="panel-body promotion-title">
				        	<h4 class="text-center promotion-title">PACKAGES PROMOTIONS</h4>
				        	<a id="more" href="/hotel/promotion/boardPro">more <span class="glyphicon glyphicon-plus" aria-hidden="true"></span></a>
				     	</div>
				  	</div>
				  	<div class="row">
				  	
						<c:forEach items="${listPros}" var="pro">
					     	<div class="col-sm-3 col-md-3">
					        	<div class="thumbnail">
				           			<img class="thumbnail" style="height: 200px" src="<c:url value="/img/${pro.promotionDetails[0].prodPic}"/>"></img>
					       			<div class="caption">
					          			<h3>서울호텔</h3>
					          			<h4>${pro.proTitle}</h4>
					          			<p>${pro.proStartDate} ~ ${pro.proEndDate}</p>
					       			</div>
					 			</div>
					 		</div>
						</c:forEach>
					</div>
				</div>
				<!-- 끝 -->
				<!-- 룸 프로모션 -->
				<div class="container center-block text-center">
					<div class="panel panel-default">
						<div class="panel-body promotion-title">
			         		<h4 class="text-center promotion-title">ROOMS</h4>
				         	<a id="more" href="/hotel/room/roomReservation">more <span class="glyphicon glyphicon-plus" aria-hidden="true"></span></a>
				      	</div>
				   	</div>
				   	<div class="row" id="roomList">				  		
					</div>
				</div>
			<!-- 끝 -->
			</section>
		</div>
		<jsp:include page="common/footer.jsp" />
	</div>
	
	<div class="modal fade" id="confirmModa1">
		<div class="modal-dialog"
			style="max-width: 100%; width: auto; display: table;">
			<div class="modal-content">
				<!-- remote call이 되는영역 -->

				<div class="modal-dialog"
					style="max-width: 70%; width: 70%; display: table;">

					<div class="panel panel-default">
						<div class="container">
							<form id="form" class="form-inline">
								<div class="container inputGroup">
									<div class="input-group col-md-3">
										<img width="250" height="200" class="previewImg">
									</div>
									<div class="input-group col-md-3">
										<img width="250" height="200" class="previewImg1">
									</div>

									<div class="input-group col-md-3">
										<img width="250" height="200" class="previewImg2">
									</div>
								</div>
							</form>
							<!-- 테이블 -->
							<div class="table-responsive">
								<table class="table table-hover table-bordered">

									<tbody>
										<tr>
											<th>객실명</th>
											<td><input id="roomType" onfocus="this.blur();"></td>
										</tr>
										<tr>
											<th>방타입</th>
											<td>
												<div class="custom-control custom-checkbox col-md-2">
													<input type="checkbox" class="custom-control-input"
														id="st" name="rom" value="스탠다드" disabled> <label
														class="custom-control-label" for="st">스탠다드</label>
												</div>
												<div class="custom-control custom-checkbox col-md-2">
													<input type="checkbox" class="custom-control-input"
														id="dt" name="rom" value="디럭스" disabled> <label
														class="custom-control-label" for="dt">디럭스</label>
												</div>
												<div class="custom-control custom-checkbox col-md-2">
													<input type="checkbox" class="custom-control-input"
														id="gt" name="rom" value="그랜드" disabled> <label
														class="custom-control-label" for="gt">그랜드</label>
												</div>
											</td>
										</tr>
										<tr>
											<th>옵션</th>
											<td>
												<div class="custom-control custom-checkbox col-md-2">
													<input type="checkbox" class="custom-control-input"
														id="option1" name="option" value="1" disabled>
													<label class="custom-control-label" for="option1">조식</label>
												</div>
												<div class="custom-control custom-checkbox col-md-2">
													<input type="checkbox" class="custom-control-input"
														id="option2" name="option" value="2" disabled>
													<label class="custom-control-label" for="option2">스파</label>
												</div>
												<div class="custom-control custom-checkbox col-md-2">
													<input type="checkbox" class="custom-control-input"
														id="option3" name="option" value="3" disabled>
													<label class="custom-control-label" for="option3">야외수영장</label>
												</div>
												<div class="custom-control custom-checkbox col-md-2">
													<input type="checkbox" class="custom-control-input"
														id="option4" name="option" value="4" disabled>
													<label class="custom-control-label" for="option4">엑스트라베드</label>
												</div>
											</td>
										</tr>
										<tr>

											<th>가능인원수</th>
											<td>
												<div class="custom-control custom-checkbox col-md-2">
													<input type="checkbox" class="custom-control-input"
														id="count1" name="count" value="1" disabled> <label
														class="custom-control-label" for="count1">1명</label>
												</div>
												<div class="custom-control custom-checkbox col-md-2">
													<input type="checkbox" class="custom-control-input"
														id="count2" name="count" value="2" disabled> <label
														class="custom-control-label" for="count2">2명</label>
												</div>
												<div class="custom-control custom-checkbox col-md-2">
													<input type="checkbox" class="custom-control-input"
														id="count3" name="count" value="3" disabled> <label
														class="custom-control-label" for="count3">3명</label>
												</div>
												<div class="custom-control custom-checkbox col-md-2">
													<input type="checkbox" class="custom-control-input"
														id="count4" name="count" value="4" disabled> <label
														class="custom-control-label" for="count4">4명</label>
												</div>
											</td>

										</tr>
										<tr>
											<th>금액</th>
											<td><p id="price"></p></td>
										</tr>
										<tr>
											<th>상세내용</th>
											<td><textarea rows="20" cols="110" id="roomContent"
													onfocus="this.blur();"></textarea></td>
										</tr>

									</tbody>
								</table>
							</div>
						</div>
					</div>

					<button type="button" class="btn btn-default modalbtn"
						data-dismiss="modal">확인</button>

				</div>
			</div>
		</div>
	</div>
</body>
</html>