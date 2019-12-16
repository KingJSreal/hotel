<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<jsp:include page="../common/import.jsp"></jsp:include>
<style>
/* 패널 해드 */
.panel-heading {
	padding-left: 100px;
}
/* 패널 해드 끝 */

/* 패널 */
.mainPanel {
	width: 80%;
	margin: 0 auto;
}

.pointpanel, .payment {
	margin-left: 70%;
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
	margin-top: 30px;
	margin-bottom: 100px;
}

.btn {
	margin-left: 10px;
}
/* 버튼 끝 */
</style>
<script>
var confirm = function(msg, type) {
	   swal(msg, {
	        buttons: ["취소", "확인"],
	      }).then((value) => {
	    	  if(value)
	    		  window.history.back();
	    	  else
	    		  return;
	      });
	}

	$(function() {
		$("#adult").val("${booking.adult}");
		$("#kid").val("${booking.kid}");
		//취소버튼 클릭시 호출
		$("#cancel").click(function() {
			confirm("수정을 취소 하시겠습니까?", "warning");
		});
		
		//수정버튼 클릭시 호출
		$("#submit").click(function() {
			location.href = "bookingInformation";
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
								 <span class="regnum">예약번호: <label id="bookingNum">${booking.bookingNum}</label></span>
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
									<td><label id="name">${name}</label></td>
								</tr>
								<tr>
									<td>체크인</td>
									<td>
										<div class="form-group">
											<div class="input-group date" id="checkIn">
					                           <input type="text" class="form-control" id="indateForm"
					                           			onfocus="this.blur();" value="${booking.checkIn}"/>
					                           <span class="input-group-addon">
					                           <i class="glyphicon glyphicon-calendar"></i></span>
					                        </div>
										</div>
									</td>
									<td>체크아웃</td>
									<td>
										<div class="form-group">
											<div class="input-group date" id="checkOut">
					                           <input type="text" class="form-control" id="outdateForm"
					                           			onfocus="this.blur();" value="${booking.checkOut}"/>
					                           <span class="input-group-addon">
					                           <i class="glyphicon glyphicon-calendar"></i></span>
					                        </div>
										</div>
									</td>
								</tr>
								<tr>
									<td>숙박일수</td>
									<td><label id="days"></label>${days}박</td>
									<td>투숙인원</td>
									<td>
										<div class="form-group form-inline">
											<span>성인: </span>
											<select class="form-control" id="adult">
												<option>1</option>
												<option>2</option>
												<option>3</option>
												<option>4</option>
											</select>
											<span>&nbsp;/&nbsp;어린이: </span>
											<select class="form-control" id="kid">
												<option>0</option>
												<option>1</option>
												<option>2</option>
												<option>3</option>
											</select>
										</div>
									</td>
								</tr>
								<tr>
									<td>객실</td>
									<td><label id="roomType">${roomType}</label></td>
									<td>옵션</td>
									<td><label id="option">${optionList}</label></td>
								</tr>
							</table>
						</div>
						<!-- 테이블 끝-->

						<!-- 포인트,요금 -->
						<div class="panel panel-default">
							<div class="panel-footer">
								<span class="pointpanel">사용 포인트: ${point}<label id="point"></label></span>
							</div>
							<div class="panel-footer">
								<span class="pointpanel">요금 합계: ${booking.payment}<label id="charge"></label>
								&nbsp;/&nbsp;
						요금 변동: <label>0</label></span>
							</div>
						</div>
						<!-- 포인트,요금 끝-->

						<!-- 결제수단 -->
						<div class="panel-footer">
							<span class="payment">결제 수단: ${booking.paytype}<label id="payType"></label></span>
						</div>

					</div>
					<!-- 예약정보 패널 끝-->
					<div class="buttongroup">
						<button type="button" class="btn btn-default pull-right" id="cancel">취소</button>
						<button type="button" class="btn btn-default pull-right" id="submit">수정 완료</button>
					</div>
				</div>
			</section>
		</div>
		<script>
$(function(){
   var checkInDate;
   var checkOutDate;
   $('#checkIn').daterangepicker({
       autoUpdateInput: false,
       "locale": {
    	   "singleDatePicker": true,
          "format": "YYYY/MM/DD",
           "applyLabel": "확인",
           "cancelLabel": "취소",
           "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
           "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월",
                        "7월", "8월", "9월", "10월", "11월", "12월"],
           "firstDay": 1,
           "toLabel": "To"
       },    
       "minDate": Today(),   //오늘 날짜
      
   },function(start) {
      checkInDate = start.format('YYYY-MM-DD');
   });
   
   $('#checkIn').on('apply.daterangepicker', function(ev, picker) {
      var arr1 = checkInDate.split('-');
      checkIn = new Date(arr1[0], arr1[1], arr1[2]);
      alert('체크인: ' + checkInDate, "info");
      $('#indateForm').val(picker.startDate.format('YYYY-MM-DD'));
   });

   $('#checkIn').on('cancel.daterangepicker', function(ev, picker) {
      $('#indateForm').val('');
   });
     
});
</script>
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>