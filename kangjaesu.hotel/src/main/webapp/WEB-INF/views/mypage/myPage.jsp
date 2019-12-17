<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쌍용호텔:마이페이지</title>
<jsp:include page="../common/import.jsp"></jsp:include>
<style>
</style>
<script>
var loadMyBooking = function(userNum) {
	$.ajax({
		
		url:"/hotel/mypage/myBookingList?page=" + getParameterByName("page"),
		method:"POST",
		data:{
			userNum: userNum
		},
		success:function(result){
			$('#bookingList').empty();
			if(result.bookingList.length > 0 ){
				if(idx > 10) return;
				var bookingList = [];
				$(result.bookingList).each(function(idx, booking){					
					bookingList.push(
							'<tr id="' + booking.bookingNum + '" class="getBooking">' +
							'<td>' + booking.bookingNum				+ '</td>' +
							'<td>' + "서울호텔"				+ '</td>' +
							'<td>' + booking.roomType		+ '</td>' +
							'<td>' + booking.checkIn		+ '</td>' +
							'<td>' + booking.checkOut		+ '</td>' +
							'<td>' + (new Date(booking.checkOut) - new Date(booking.checkIn))/(1000*3600*24) + "일"	+ '</td>' +
							'<td>' + (Number(booking.adult) + Number(booking.kid)) + "명" + '</td>' +
							'</tr>'				
					);
				});

				$('#bookingList').append(bookingList.join(''));		

				$(".getBooking").click(function () {
				   location.href = "/hotel/booking/bookingInformation?bookingNum=" + $(this).attr('id');
				});
			}else{
				$('#bookingList').append(
					'<tr><td colspan="6"><b>예약 내역이 없습니다.</b></td></tr>'	);
			}
		},
		error:function(a, b, errMsg){
			$('#bookingList').empty();
			$('#bookingList').append(
				'<tr><td colspan="6"><b>예약 내역을 불러오지 못했습니다.</b></td></tr>'	);
		}
	});
}

$(document).ready(loadMyBooking("${sessionScope.user.userNum}"));

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
							<a>마이페이지</a>
						</p>
					</div>
					<div class="headTit">
						<h3>&nbsp;마이페이지</h3>
					</div>
					<jsp:include page="aside.jsp" />
					<div class="main-section">
						<div>
							<div>
								<div class="reserve_form">
									<h4 style="text-align:left; width:90%; float:left">| 예약내역</h4>
									<table class="table table-bordered">
										<thead>
											<tr>
												<th scope="row" width="14%">예약번호</th>
												<th scope="row" width="14%">호텔</th>
												<th scope="row" width="14%">객실</th>
												<th scope="row" width="19%">체크인</th>
												<th scope="row" width="19%">체크아웃</th>
												<th scope="row" width="10%">숙박일수</th>
												<th scope="row" width="10%">투숙인원</th>
											</tr>
										</thead>
										<tbody id="bookingList">
											
										</tbody>
									</table>
									<!-- paging -->
									<div class="text-center">
										<ul class="pagination" id="pages_bookings">
										</ul>
									</div>
									<!-- paging 끝 -->
					            </div>
					            <!-- paging 끝 -->

								<div class="question_form">
									<h4 style="text-align:left; width:90%; float:left">| 문의내역</h4>
									<table class="table table-bordered">
										<tbody>
											<tr>
												<th scope="row" width="10%">문의번호</th>
												<th scope="row" width="40%">문의제목</th>
												<th scope="row" width="15%">작성일</th>
												<th scope="row" width="15%">답변상태</th>
												<th scope="row" width="10%">답변확인</th>
											</tr>
											<tr>
												<td>87745</td>
												<td>체크인 시간 문의</td>
												<td>2019-10-10 09:00</td>
												<td>답변대기</td>
												<td><a>답변대기</a></td>							
											</tr>
											<tr>
												<td>87745</td>
												<td>체크인 시간 문의</td>
												<td>2019-10-10 09:00</td>
												<td>답변완료</td>
												<td><a>답변보기</a></td>							
											</tr>
											<tr>
												<td>87745</td>
												<td>체크인 시간 문의</td>
												<td>2019-10-10 09:00</td>
												<td>답변완료</td>
												<td><a>답변보기</a></td>							
											</tr>
											<tr>
												<td>87745</td>
												<td>체크인 시간 문의</td>
												<td>2019-10-10 09:00</td>
												<td>답변완료</td>
												<td><a>답변보기</a></td>							
											</tr>
											<tr>
												<td>87745</td>
												<td>체크인 시간 문의</td>
												<td>2019-10-10 09:00</td>
												<td>답변완료</td>
												<td><a>답변보기</a></td>							
											</tr>
										</tbody>
									</table>
								</div>
								<!-- paging -->
					            <div class="paging" style="margin-left:27%;">
					               <ul class="pagination">
					                    <li class="page-item">
					                       <a class="page-link" href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a>
					                    </li>
					                     <li class="page-item"><a class="page-link" href="#">1</a></li>
					                     <li class="page-item"><a class="page-link" href="#">2</a></li>
					                     <li class="page-item"><a class="page-link" href="#">3</a></li>
					                     <li class="page-item"><a class="page-link" href="#">4</a></li>
					                     <li class="page-item"><a class="page-link" href="#">5</a></li>
					                     <li class="page-item"><a class="page-link" href="#" aria-label="Next">
					                        <span aria-hidden="true">&raquo;</span></a>
					                     </li>
					                  </ul>       
					            </div>
					            <!-- paging 끝 -->
								<div class="inform_form">
									<h4 style="text-align:left; width:90%; float:left">| 개인정보</h4>
									<table class="table table-bordered">
										<colgroup>
											<col class="col1" width="15%">
											<col class="col2" width="85%">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">가입일</th>
												<td>2019.11.09</td>
											</tr>
											<tr>
												<th scope="row">이메일</th>
												<td>childo@naver.com</td>
											</tr>
											<tr>
												<th scope="row">비밀번호</th>
												<td>wlstjd123</td>
											</tr>
											<tr>
												<th scope="row">포인트</th>
												<td>79,000p</td>
											</tr>
											<tr>
												<th scope="row">성명(국문)</th>
												<td>김칠두</td>
											</tr>
											<tr>
												<th scope="row">성명(영문)</th>
												<td>Kim Childo</td>
											</tr>
											<tr>
												<th scope="row">생년월일</th>
												<td>1983.08.01</td>
											</tr>
											<tr>
												<th scope="row">휴대전화</th>
												<td>010-1234-5678</td>
											</tr>
											<tr>
												<th scope="row">자택전화</th>
												<td>02-1234-5678</td>
											</tr>
											<tr>
												<th scope="row">자택주소</th>
												<td>
													123-123<br>
													경기도 고양시 김수로 123-12<br>
													칠두아파트 101동 101호
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>