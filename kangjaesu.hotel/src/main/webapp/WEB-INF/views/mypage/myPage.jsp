<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쌍용호텔:마이페이지</title>
<jsp:include page="../common/import.jsp"></jsp:include>
<!-- 
	- res/js 추가 시
	<script src="<c:url value="/js/common.js"/>"></script>  
-->
<style>
</style>
<script>
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
										<tbody>
											<tr>
												<th scope="row" width="10%">예약번호</th>
												<th scope="row" width="10%">호텔</th>
												<th scope="row" width="10%">객실</th>
												<th scope="row" width="15%">체크인</th>
												<th scope="row" width="15%">체크아웃</th>
												<th scope="row" width="8%">숙박일수</th>
												<th scope="row" width="8%">투숙인원</th>
												<th scope="row" width="10%">예약상태</th>
											</tr>
											<tr>
												<td>64887</td>
												<td>서울호텔</td>
												<td>Deluxe</td>
												<td>2019-10-10 09:00</td>
												<td>2019-10-11 14:00</td>
												<td>1일</td>
												<td>2명</td>
												<td>예약완료</td>							
											</tr>
											<tr>
												<td>64887</td>
												<td>서울호텔</td>
												<td>Deluxe</td>
												<td>2019-10-10 09:00</td>
												<td>2019-10-11 14:00</td>
												<td>1일</td>
												<td>2명</td>
												<td>예약완료</td>							
											</tr>
											<tr>
												<td>64887</td>
												<td>서울호텔</td>
												<td>Deluxe</td>
												<td>2019-10-10 09:00</td>
												<td>2019-10-11 14:00</td>
												<td>1일</td>
												<td>2명</td>
												<td>예약완료</td>							
											</tr>
											<tr>
												<td>64887</td>
												<td>서울호텔</td>
												<td>Deluxe</td>
												<td>2019-10-10 09:00</td>
												<td>2019-10-11 14:00</td>
												<td>1일</td>
												<td>2명</td>
												<td>예약완료</td>							
											</tr>
											<tr>
												<td>64887</td>
												<td>서울호텔</td>
												<td>Deluxe</td>
												<td>2019-10-10 09:00</td>
												<td>2019-10-11 14:00</td>
												<td>1일</td>
												<td>2명</td>
												<td>예약완료</td>							
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