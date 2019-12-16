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
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script src="<c:url value="/js/common.js"/>"></script>
<style>
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
   width: 148px;
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
   var selectbox;
   var checkList;
   var $optionSet = $('#isotope-options'), 
        $optionSets = $('#isotope-filters'), 
        $optionLinks = $optionSets.find('a'); 
   

   // 필터링
	var $container = $('#isotope-items').isotope({
		layoutMode: 'fitRows',
		filter: function() {
		var $this = $(this); 
		var optionResult;
         
		var optionResult = checkList ? $this.find('.txt1').text().match( checkList ) : true;
		var minResult = minprice ? parseInt($this.find('.txt3').text()) >= parseInt(minprice) : true;
		var maxResult = maxprice ? parseInt($this.find('.txt3').text()) <= parseInt(maxprice) : true;
		var countResult = selectbox ? $this.find('.txt4').text().match( selectbox ) : true;

		return minResult && maxResult && countResult && optionResult;
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
   var $optionboxes = $('.searchCheckBox');
   $optionboxes.change(function () {
      check = [];
      checkList="";
      $('input:checkbox[name="searchOption"]').each(function() {
         if(this.checked){
            var checkId = $(this).attr("id");
            checkList = checkList + ($("label[for='"+checkId+"']").text());
         }
      }); 
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
$(function() {
	//답변보기 버튼
	$(".confirmModalButton").click(function() {
		var roomNumber = $(this).attr('id').substr(1);
		$("input:checkbox[name=rom]").prop("checked",false);
		$("input:checkbox[name=count]").prop("checked",false);
		
		$.ajax({
			url : "getData",
			method : "GET",
			data : {
				roomNum : roomNumber
			},
			success : function(room) {
				$("#roomType").val(room.roomName);
				$("#roomContent").val(room.roomContent);
				$("input:checkbox[name=rom][value=" +room.roomType+ "]").prop("checked",true);
				$("input:checkbox[name=count][value=" +room.guests+ "]").prop("checked",true);
			
				//$("input:checkbox[name=option][value=" +room.options.optNo+ "]").prop("checked",true);
				$("#confirmModa1").modal('show');

/* 					 $("#answerModal").modal({
					remote : "myInqAns"
				});  */
			},
			error : function(a, b, errMsg) {
				alert("오류" + errMsg);
			}
		});
	});
})
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
                       	<p class="form-control-static">&nbsp; | &nbsp; 체크인</p>
						<div class="input-group date">
							<input type="date" class="form-control" placeholder="체크인"
								value="체크인"> <span class="input-group-addon"> <i
								class="glyphicon glyphicon-calendar"></i>
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
                        <div class="custom-control custom-checkbox searchCheckBox">
                           <input type="checkbox" class="custom-control-input"
                              id="searchOption1" name="searchOption"> <label
                              class="custom-control-label" for="searchOption1">조식</label>
                        </div>
                        <div class="custom-control custom-checkbox searchCheckBox">
                           <input type="checkbox" class="custom-control-input"
                              id="searchOption2" name="searchOption"> <label
                              class="custom-control-label" for="searchOption2">스파</label>
                        </div>
                        <div class="custom-control custom-checkbox searchCheckBox">
                           <input type="checkbox" class="custom-control-input"
                              id="searchOption3" name="searchOption"> <label
                              class="custom-control-label" for="searchOption3">야외수영장</label>
                        </div>
                        <div class="custom-control custom-checkbox searchCheckBox">
                           <input type="checkbox" class="custom-control-input"
                              id="searchOption4" name="searchOption"> <label
                              class="custom-control-label" for="searchOption4">엑스트라베드</label>
                        </div>
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
                           <button class="btn btn-default pull-right">선택초기화</button>
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
                           <tr id="a${list.roomNum }" class="confirmModalButton" >
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
                                    onclick="location.href='/hotel/booking/bookingForm'">예약</button></td>
                           </tr>
                        </table>
                     </div>
                  </div>
               </c:forEach>
            </div>
            <!-- 객실목록 끝 -->

        

            <div class="modal fade" id="confirmModa1">
               <div class="modal-dialog"
                  style="max-width: 100%; width: auto; display: table;">
                  <div class="modal-content">
                     <!-- remote call이 되는영역 -->
<script type="text/javascript">
$(document).ready(function(){
	var options  =("${room.options}").split(", option");

	$("input:checkbox[name=option]").each(function(){
		for(var i = 0; i < options.length; i++){
			if(this.value == options[i].match(/optNo=[0-9]/)[0].slice(6,7)){
				this.checked =true;
			}
		}
	});
});
</script>
                       <div  class="modal-dialog" style="max-width: 70%; width: 70%; display: table;">
		
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
			</div></form>
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
										id="option4" name="option" value="4" disabled> <label
										class="custom-control-label" for="option4">엑스트라베드</label>
								</div>
							</td>
						</tr>
						<tr>

							<th>가능인원수</th>
							<td>
								<div class="custom-control custom-checkbox col-md-2">
									<input type="checkbox" class="custom-control-input" id="count1"
										name="count" value="1" disabled> <label
										class="custom-control-label" for="count1">1명</label>
								</div>
								<div class="custom-control custom-checkbox col-md-2">
									<input type="checkbox" class="custom-control-input" id="count2"
										name="count" value="2" disabled> <label
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
							<th>금액 ${room.roomType }</th>
							<td>420000</td>
						</tr>
						<tr>
							<th>상세내용</th>
							<td><textarea rows="20" cols="135" id="roomContent" onfocus="this.blur();"></textarea></td>
						</tr>

					</tbody>
				</table>
						</div>
		</div></div>

		<button type="button" class="btn btn-default modalbtn" data-dismiss="modal">확인</button>

	</div>
                  </div>
               </div>
            </div>
            <br> <br>
         </section>
      </div>
     <script>
$(function(){
   var checkInDate;
   var checkOutDate;
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
       "minDate": Today(),   //오늘 날짜
      
   },function(start, end) {
      checkInDate = start.format('YYYY-MM-DD');
      checkOutDate = end.format('YYYY-MM-DD');
      //년:checkIn.getFullYear()
      //월:checkIn.getMonth()
      //일:checkIn.getDate()
   });
   
   $('#date').on('apply.daterangepicker', function(ev, picker) {
      var arr1 = checkInDate.split('-');
      var arr2 = checkInDate.split('-');
      checkIn = new Date(arr1[0], arr1[1], arr1[2]);
      checkOut = new Date(arr2[0], arr2[1], arr2[2]);
      alert('체크인:   ' + checkInDate + '\n' + '체크아웃: ' + checkOutDate, "info");
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
