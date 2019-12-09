<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쌍용호텔</title>
<jsp:include page="../common/import.jsp"></jsp:include>
<script src="https://unpkg.com/isotope-layout@3/dist/isotope.pkgd.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" /><style>

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

.isotope-element{
	width: 100%;
}

.table{
border: 1px solid #dddddd;
}

/* DivTable.com */
.divTable{
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
.col1{
	width: 150px;
	text-align: right;
}
.col2{
	width: 600px;
}
.inputpice{
	letter-spacing:1px;
}
</style>
<script>


$(document).ready(function() {
	var checkIn;
	var checkOut;
	var minprice;
	var maxprice;
	var selector;
	var check = new Array();
	var selectbox;
	var $optionSet = $('#isotope-options'), 
  		$optionSets = $('#isotope-filters'), 
  		$optionLinks = $optionSets.find('a'); 
	
	// 필터링
	var $container = $('#isotope-items').isotope({
		layoutMode: 'fitRows',
		filter: function() {
			var $this = $(this); 
		   
		    //수정할것///////
		    var optionResult = $(check).each(function() {
		    	var pop = check.pop();
		    	check ? $this.find('.txt1').text().match(pop): true;
			}) 
			///////////
			
			var minResult = minprice ? parseInt($this.find('.txt3').text()) >= parseInt(minprice): true;
		    var maxResult = maxprice ? parseInt($this.find('.txt3').text()) <= parseInt(maxprice): true;
		    var countResult = selectbox ? $this.find('.txt4').text().match( selectbox ) : true;
		    
		    var buttonResult = selector ? $this.is( selector ) : true;
		    return minResult && maxResult && optionResult && countResult;
	  }
	});

	//최소금액
	var $min = $('#min').keyup( debounce( function() {
		minprice = parseInt($min.val());
		if($(this).val() == "")
			minprice = 0;
		if($('#max').val() == "")
			maxprice = minprice+10000000;
		if(minprice > maxprice){
			alert("최대금액을 넘을 수 없습니다");
			$(this).val(maxprice);
			minprice = maxprice;
		}
		$container.isotope();
	}) );

	//최대금액
	var $max = $('#max').keyup( debounce( function() {
		maxprice = parseInt($max.val());
		if($('#min').val() == "")
			minprice = 0;
		if(maxprice < minprice || $(this).val() == "")
			maxprice = minprice+10000000;
		$container.isotope();
	}) );

	//옵션
	var $optionboxes = $('.custom-checkbox');
	$optionboxes.change(function () {
		check = [];
		$('input:checkbox[name="option"]').each(function() {
			if(this.checked){
				var checkId = $(this).attr("id");
				check.push($("label[for='"+checkId+"']").text());
			}
		}); 
		alert(check);
		
		$container.isotope();
	});

	//인원수
	var $selectboxes = $('#adult, #kid');
	$selectboxes.change(function() {
		adult = $("#adult option:selected").val();
		kid = $("#kid option:selected").val();
		selectbox = parseInt(adult) + parseInt(kid);
		$container.isotope();
	});
	
	// 검색시간조절
	function debounce( fn, threshold ) {
		var timeout;
		threshold = threshold || 300;
		return function debounced() {
			clearTimeout( timeout );
		    var args = arguments;
		    var _this = this;
		    function delayed() {
		      fn.apply( _this, args );
		    }
		    timeout = setTimeout( delayed, threshold );
		};
	}
});

function Today(){
    var dt = new Date();
    var year = dt.getFullYear();
    var month = dt.getMonth() + 1;
    var day = dt.getDate();
 
    if(month < 10) month = "0" + month;
    if(day < 10) day = "0" + day;
 
    return year + "/" + month + "/" + day;
}
</script>
</head>
<body>
	<div>
		<jsp:include page="../common/header.jsp" />
		<jsp:include page="../common/gnb.jsp" />
		<div id="contents">
			<!-- 예약정보 검색 -->
			<section>
				<div class="container">
					<div class="panel panel-default">
						<form class="form-inline searchBar">
							<div class="container text-center form-group">
								<p class="form-control-static">예약정보를 선택하세요</p>
								<p class="form-control-static">&nbsp; | &nbsp;체크인/체크아웃</p>
								<div class="input-group date" id="date">
									<input type="text" class="form-control" id="dateForm"/>
									<span class="input-group-addon">
									<i class="glyphicon glyphicon-calendar"></i></span>
								</div>
								<p class="form-control-static">&nbsp; | &nbsp; 성인</p>
								<select class="form-control" id="adult">
									<option>선택</option>
									<option>1</option>
									<option>2</option>
									<option>3</option>
								</select>
								<p class="form-control-static">&nbsp; | &nbsp; 유아</p>
								<select class="form-control" id="kid">
									<option>0</option>
									<option>1</option>
									<option>2</option>
									<option>3</option>
								</select>
							</div>
							<hr>
							<div class="divTable">
							<div class="form-group divTableRow optionForm">
							<div class="divTableCell col1">
								<div class="custom-control custom-checkbox">
									<p class="form-control-static optionInfo">옵션을 선택하세요&nbsp;&nbsp;|</p>
									</div>
								</div>
								<div class="divTableCell col2">
								<div class="custom-control custom-checkbox">
									<input type="checkbox" class="custom-control-input"
										id="option1" name="option"> <label
										class="custom-control-label" for="option1">조식</label>
								</div>
								<div class="custom-control custom-checkbox">
									<input type="checkbox" class="custom-control-input"
										id="option2" name="option"> <label
										class="custom-control-label" for="option2">스파</label>
								</div>
								<div class="custom-control custom-checkbox">
									<input type="checkbox" class="custom-control-input"
										id="option3" name="option"> <label
										class="custom-control-label" for="option3">야외수영장</label>
								</div>
								<div class="custom-control custom-checkbox">
									<input type="checkbox" class="custom-control-input"
										id="option4" name="option"> <label
										class="custom-control-label" for="option4">엑스트라베드</label>
								</div>
								<button class="btn btn-default pull-right">선택해제</button>
								
								</div>
							</div>
							
							<div class="form-group divTableRow priceForm">
								<div class="divTableCell col1">
									<p class="form-control-static priceInfo">금액범위&nbsp;&nbsp;|</p>
								</div>
								<div class="divTableCell col2">
									<input class="form-control inputpice" id="min" placeholder="최소금액">
									<label>&nbsp;원 ~&nbsp;</label>
									<input class="form-control inputpice" type="text" id="max" placeholder="최대금액">
									<label>&nbsp;원
									</label>
								</div>
							</div>
							</div>
						</form>
					</div>
				</div>
				<!-- 예약검색 폼 끝 -->
				
				<!-- 객실목록 -->
				<div class="container center-block" id="isotope-items">
					<c:forEach var="list" items="${roomList}">
						<div class="isotope-element" id="isotope-filter0">
							<div class="thumb-isotope">
								<table class="table table-hover">
									<tr id="confirmModalButton">
										<td><img width="300" height="200"></td>

										<td style="vertical-align: middle;">
											<p>- <span class="txt0">${list.roomType }</span></p>
											<p>- <span class="txt1">조식</span></p>
											<p>- <span class="txt1">야외수영장</span></p>
										</td>
										<td style="vertical-align: middle;">
											<span class="txt3">${list.roomPrice }</span>원<br>기준
											<span class="txt4">${list.guests }</span> 명
										</td>

										<td style="vertical-align: middle;"><button
												class="btn btn-default" type="button"
												style="width: 150px; height: 150px;"
												onclick="location.href='../booking/01.html'">예약</button></td>
									</tr>
								</table>
							</div>
						</div>
					</c:forEach>
				</div>
				<!-- 객실목록 끝 -->

				<div class="modal fade" id="confirmModal">
					<div class="modal-dialog"
						style="max-width: 100%; width: auto; display: table;">
						<div class="modal-content">
							<!-- remote call이 되는영역 -->
						</div>
					</div>
				</div>

				<div class="modal fade" id="confirmModa2">
					<div class="modal-dialog"
						style="max-width: 100%; width: auto; display: table;">
						<div class="modal-content">
							<!-- remote call이 되는영역 -->
						</div>
					</div>
				</div>
				<br> <br>
			</section>
		</div>
		<script>
$(function(){
	$('#date').daterangepicker({
		 autoUpdateInput: false,
	    "locale": {
	    	"format": "YYYY/MM/DD",
	    	"separator": " ~ ",
	        "applyLabel": "확인",
	        "cancelLabel": "취소",
	        "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
	        "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월",
	            		   "7월", "8월", "9월", "10월", "11월", "12월"],
	        "firstDay": 1,
	        "toLabel": "To"
	    }, 	
	    "minDate": Today(),	//오늘 날짜
	   
	},function(start, end) {
		var checkInDate = start.format('YYYY-MM-DD');
		var checkOutDate = end.format('YYYY-MM-DD');
		var arr1 = checkInDate.split('-');
		var arr2 = checkInDate.split('-');
		checkIn = new Date(arr1[0], arr1[1], arr1[2]);
		checkOut = new Date(arr2[0], arr2[1], arr2[2]);
		//년:checkIn.getFullYear()
		//월:checkIn.getMonth()
		//일:checkIn.getDate()

		alert('체크인: ' + checkInDate + '\n' + '체크아웃: ' + checkOutDate);
	});
	
	$('#date').on('apply.daterangepicker', function(ev, picker) {
		$('#dateForm').val(picker.startDate.format('YYYY/MM/DD') + ' ~ ' + picker.endDate.format('YYYY-MM-DD'));
	});

	$('#date').on('cancel.daterangepicker', function(ev, picker) {
		$('#dateForm').val('');
	});
	  
});
</script>
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>