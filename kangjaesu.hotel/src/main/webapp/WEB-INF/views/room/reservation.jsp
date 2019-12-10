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
	font-size: 18px;
}

table table-bordered {
	text-align: cneter;
	padding-top: 200px;
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
	padding-left: 20px;
	padding-right: 10px;
	font-size: 12px
}

input[type="checkbox"]+label:BEFORE {
	content: "";
	display: inline-block;
	width: 20px;
	height: 20px;
	margin-right: 5px;
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

.optionForm, .priceForm {
	margin-right: 100px;
}

table, tr, td {
	border: 0;
}
.modalbtn{
	margin-left: 50%;
}
.inputGroup {
	margin-left: 5%;
}

.input-group {
	margin: 20px;
}
.previewImg{
float: left;}
</style>
<script>
$(window).load(function() {
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
		    return minResult && maxResult && buttonResult && optionResult && countResult;
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
		//var checkId = $("input:checkbox[name=option]:checked").attr("id");
		//check.push($("label[for='"+radioId+"']").text());
		
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

	//버튼
	$optionLinks.click(function(){ 
   		var $this = $(this); 
		
   		$optionSet.find('.selected').removeClass('selected'); 
   		$this.addClass('selected');

        selector = $(this).attr('data-filter'); 
        $container.isotope();
    });  
	
	// debounce so filtering doesn't happen every millisecond
	function debounce( fn, threshold ) {
		var timeout;
		threshold = threshold || 100;
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

$(function(){

	$(".confirmModalButton").click(function() {
	
		  var roomNum = $(this).attr('id').substr(1);
		
			
		$.ajax({
			url:"getData",
			method:"GET",
			data: {					
				roomNum:roomNum
			},
			success:function(room){
				$("#roomTitle").val(room.roomName);
				$("#roomPrice").val(room.roomPrice).attr("원");
				$("#roomContent").val(room.roomContent);
				$("input:checkbox[name=rom]").each(function ch1(){
					if(this.value == room.roomType){
						this.checked =true;
					}
				});
				$("input:checkbox[name=count]").each(function ch1(){
					if(this.value == room.guests){
						this.checked =true;
					}
				});
				$("#confirmModal").modal('show');
			/* 	$("#confirmModal").modal({
					remote : "viewInquiry"
				});    
			*/
			},
			error:function(a, b, errMsg){
				alert("오류" + errMsg);
			}
		 });   
	});
});
</script>
</head>
<body>
	<div>
		<jsp:include page="../common/header.jsp" />
		<jsp:include page="../common/gnb.jsp" />
		<!-- 예약정보 검색 -->
		<div id="contents" class="container">
			<section>
				<!-- 예약정보 검색 -->
				<section>
					<div class="container center-block text-center">
						<div class="panel panel-default">
							<form class="form-inline searchBar">
								<div class="form-group">
									<p class="form-control-static">예약정보를 선택하세요</p>
									<p class="form-control-static">&nbsp; | &nbsp; 체크인</p>
									<div class="input-group date">
										<input type="date" class="form-control" placeholder="체크인"
											value="체크인"> <span class="input-group-addon">
											<i class="glyphicon glyphicon-calendar"></i>
										</span>
									</div>
									<p class="form-control-static">&nbsp; | &nbsp; 체크아웃</p>
									<div class="input-group date">
										<input type="date" class="form-control" placeholder="체크아웃">
										<span class="input-group-addon"> <i
											class="glyphicon glyphicon-calendar"></i>
										</span>
									</div>
									<p class="form-control-static">&nbsp; | &nbsp; 성인</p>
									<select class="form-control" id="adult">
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
								<button type="submit" class="btn btn-default">검색</button>

								<hr>
								<div class="form-group pull-right optionForm">
									<div class="custom-control custom-checkbox">
										<p class="form-control-static">옵션을 선택하세요</p>
									</div>
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
									<button class="btn btn-default">선택해제</button>
								</div>
								<br> <br>
								<div class="form-group pull-right priceForm">
									<p class="form-control-static">&nbsp;금액범위&nbsp;</p>

									<input type="text" class="form-control" id="min"><label>&nbsp;원
										~&nbsp;</label> <input class="form-control" type="text" id="max"><label>&nbsp;원
									</label>
								</div>
								<br> <br>
							</form>
						</div>
					</div>
				</section>

				<div class="container center-block " id="isotope-items">
					<c:forEach var="list" items="${roomList}">
					
								<table class="table table-hover" style="vertical-align: middle;">
									<tr id="c${list.roomNum }" class="confirmModalButton">
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
						
						
					</c:forEach>




				</div>


		<div class="modal fade" id="confirmModal">
	<div class="modal-dialog" style="max-width: 70%; width: 70%; display: table;">
		<div class="modal-content">
			<!-- remote call이 되는영역 -->
			<div class="modal-body">
				<div class="panel panel-default">
					<!-- 테이블 -->
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
			</div></form>
			<!-- 테이블 -->
			<div class="table-responsive">
				<table class="table table-hover table-bordered">

					<tbody>
						<tr>
							<th>객실명</th>
							<td><input type="text" id="roomTitle" class="form-control"
										onfocus="this.blur();"></td>
						</tr>
						<tr>
							<th>방타입</th>
							<td>
								<div class="custom-control custom-checkbox col-md-2">
									<input type="checkbox" class="custom-control-input" id="st"
										name="rom" value="스탠다드" disabled> <label
										class="custom-control-label" for="st">스탠다드</label>
								</div>
								<div class="custom-control custom-checkbox col-md-2">
									<input type="checkbox" class="custom-control-input" id="dt"
										name="rom" value="디럭스" disabled> <label class="custom-control-label"
										for="dt">디럭스</label>
								</div>
								<div class="custom-control custom-checkbox col-md-2">
									<input type="checkbox" class="custom-control-input" id="gt"
										name="rom" value="그랜드" disabled> <label class="custom-control-label"
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
										name="count" value="1"  disabled> <label
										class="custom-control-label" for="count1">1명</label>
								</div>
								<div class="custom-control custom-checkbox col-md-2">
									<input type="checkbox" class="custom-control-input" id="count2"
										name="count" value="2" disabled> <label
										class="custom-control-label" for="count2">2명</label>
								</div>
								<div class="custom-control custom-checkbox col-md-2">
									<input type="checkbox" class="custom-control-input" id="count3"
										name="count" value="3"  disabled> <label
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
							<td><input id="roomPrice" onfocus="this.blur();">원</td>
						</tr>
						<tr>
							<th>상세내용</th>
							<td><textarea rows="20" cols="135" onfocus="this.blur();"id="roomContent"></textarea></td>
						</tr>

					</tbody>
				</table>
				<!-- 테이블 끝 -->
						<!-- 테이블 끝 -->
					</div>
				</div>

				<button type="button" class="btn btn-default modalbtn"
					data-dismiss="modal">확인</button>
			</div>
			<!-- remote call끝 -->
		</div>
	</div>
</div>




				<br> <br>
			</section>
		</div>
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>