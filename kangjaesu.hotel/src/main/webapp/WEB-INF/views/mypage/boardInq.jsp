<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../common/import.jsp"></jsp:include>
<style>
/* aside 섹션 */
.aside-section {
	height: 100%;
}

.aside-section .aside_logo {
	text-decoration: none;
	font-size: 25px;
	font-weight: bold;
	color: #AAAAAA;
	font-family: Sans-Serif;
}

.aside_logo:hover {
	color: white;
}

.aside-section {
	margin-top: 30px;
	background-color: #3C3C3C;
	width: 23%;
	height: 800px;
	float: left;
}

.aside-section div {
	width: 90%;
	margin-left: 10%;
	margin-top: 7%;
}

.aside-section .aside_a {
	text-decoration: none;
	font-size: 16px;
	color: #AAAAAA;
	font-family: Sans-Serif;
	font-weight: bold;
}

.aside-section .aside_a:hover {
	color: white;
}

/* aside 섹션 끝*/

/* main 섹션*/
.main-section {
	margin-top: 30px;
	margin-left: 25%;
}

.main-section table {
	width: 75%;
}

.main-section table a {
	text-decoration: none;
	text-align: center;
	color: #8c8c8c;
}

.main-section table a:hover {
	color: black;
}

.inform_form table th {
	background-color: #3C3C3C;
	color: white;
}
/* main 섹션 끝*/

/* 모달 버튼 */
.modalbtn{
	margin-left:90%;
}

/*문의 제목*/
.inqTitle{
	font-size: 15px;
	cursor:pointer;
}
</style>
<script>
	$(function() {
		//보기 버튼
		$(".myInquiryButton, .inqTitle").click(function() {
			var tr = $(this).parent().parent();
			var inqNumber = tr.children().children().val();
 			$("#inqNumParam").val(inqNumber);
			document.form.setAttribute("action", "myInquiry");
			document.form.submit();
		});

		//수정 버튼
		$(".modifyButton").click(function() {
			var tr = $(this).parent().parent();
			var inqNumber = tr.children().children().val();
			$("#inqNumParam").val(inqNumber);
			document.form.setAttribute("action", "modifyInquiry");
			document.form.submit();
		});

		//답변보기 버튼
		$(".answerModalButton").click(function() {
			var tr = $(this).parent().parent();
			var inqNumber = tr.children().children().val();
			$.ajax({
				url : "getAnswer",
				method : "GET",
				data : {
					inqNum : inqNumber
				},
				success : function(inq) {
					$("#Anscontent").val(inq.inqCmtContent);
					$("#answerModal").modal('show');

/* 					 $("#answerModal").modal({
						remote : "myInqAns"
					});  */
				},
				error : function(a, b, errMsg) {
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
		
		<div id="contents">
			<section>
				<div class="container center-block">
					<div class="location">
						<p>
							<a>홈 > </a> <a>마이페이지 > </a> <a>문의 내역</a>
						</p>
					</div>
					<div class="headTit">
						<h3>&nbsp;마이페이지</h3>
					</div>
					<div class="container">
						<div class="aside-section">
							<div>
								<a href="01.html" class="aside_logo">Seoul Hotel</a>
							</div>
							<hr style="background-color: white; height: 1px">
							<div>
								<a href="05.html" class="aside_a">예약 확인/취소</a>
							</div>
							<br>
							<div>
								<a href="06.html" class="aside_a">포인트 사용 내역</a>
							</div>
							<br>
							<div>
								<a href="07.html" class="aside_a">후기 작성 내역</a>
							</div>
							<br>
							<div>
								<a class="aside_logo" style="font-size: 16px" href="02.html">개인정보</a>
							</div>
							<br>
							<hr style="margin-top: -10px">
							<div>
								<a href="03.html" class="aside_a" style="font-size: 14px;">&nbsp;&nbsp;&nbsp;개인정보
									수정</a>
							</div>
							<div>
								<a href="04.html" class="aside_a" style="font-size: 14px;">&nbsp;&nbsp;&nbsp;탈퇴
									신청</a>
							</div>
							<hr>
							<div>
								<a href="08.html" class="aside_a">문의 내역</a>
							</div>
						</div>
						<!-- 문의 내역 -->
						<div class="main-section">
							<div>
								<div class="container">
									<div class="question_form">
										<h4 style="text-align: left; width: 90%; float: left">|
											문의내역</h4>
										<table class="table table-bordered">
											<tbody>
												<tr>
													<th scope="row" width="10%">문의번호</th>
													<th scope="row" width="30%">문의제목</th>
													<th scope="row" width="15%">작성일</th>
													<th scope="row" width="15%">답변상태</th>
													<th scope="row" width="20%">확인</th>
												</tr>
												<c:forEach var="list" items="${inqList}" varStatus="count">
													<tr>
														<c:set var= "num" value="${inqCount.count + 1 - count.count}"/>
														<td><input type="hidden" value="${list.inqNum}"><c:out value="${num}"/></td>
														<td><a class="inqTitle">${list.inqTitle}</a></td>
														<td>${list.inqDate}</td>
														<td>${list.status}</td>
														<td>
															<button class="btn btn-default myInquiryButton" type="button">보기</button>
															<c:if test="${list.status eq '답변 대기'}">
																<button class="btn btn-default modifyButton" type="button">수정</button>
															</c:if>
															<c:if test="${list.status eq '답변완료'}">
																<button class="btn btn-default answerModalButton" type="button">답변 보기</button>
															</c:if>
														</td>

													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<!-- paging -->
									<div class="paging" style="margin-left: 27%;">
										<ul class="pagination">
											<li class="page-item"><a class="page-link" href="#"
												aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a>
											</li>
											<li class="page-item"><a class="page-link" href="#">1</a></li>
											<li class="page-item"><a class="page-link" href="#">2</a></li>
											<li class="page-item"><a class="page-link" href="#">3</a></li>
											<li class="page-item"><a class="page-link" href="#">4</a></li>
											<li class="page-item"><a class="page-link" href="#">5</a></li>
											<li class="page-item"><a class="page-link" href="#"
												aria-label="Next"> <span aria-hidden="true">&raquo;</span></a>
											</li>
										</ul>
									</div>
									<!-- paging 끝 -->
								</div>
							</div>
						</div>
						<!-- 문의 내역 끝-->
					</div>
				</div>
			</section>
		</div>
<form name="form" method="post">
	<input id=inqNumParam name="inqNumber" type="hidden" value="">
</form>
		<!-- 답변 모달 -->
		<div class="modal fade" id="answerModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- remote call이 되는영역 -->

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">답변</h4>
					</div>
					<div class="modal-body">
						<div class="panel panel-default">
							<table class="table">
								<tbody>
									<tr>
										<td><textarea id="Anscontent" class="form-control" rows="12" cols="60"
												onfocus="this.blur();">
						</textarea></td>
									</tr>
								</tbody>
							</table>

						</div>

							<button type="button" class="btn btn-default modalbtn"
								data-dismiss="modal">확인</button>

					</div>

					<!-- remote call끝 -->
				</div>
			</div>
		</div>
		<!-- 답변 모달 끝 -->
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>