<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../common/import.jsp"></jsp:include>
<script src="<c:url value="/js/common.js"/>"></script>  
<style>
/*  진행상황 네비게이션  */
.breadcrumb {
	text-align: center;
}

.breadcrumb>li+li:before {
	color: #ccc;
	content: ">";
	margin-right: 10px;
}

.breadcrumb>li>a {
	color: #ccc;
	font-size: 20px;
}

.breadcrumb>li>a:hover {
	text-decoration: none;
}

.breadcrumb>.active {
	color: black;
	font-size: 20px;
	font-weight: bold;
}
/* 진행상황 네비게이션 끝*/

/* 입력 폼 */
.table-responsive {
	width: 80%;
	margin: 0 auto;
}

.table.form {
	width: 50%;
	display: inline;
	float: left;
}

.form-control.cardnum {
	width: 60px;
}

.form-control.jumin {
	width: 100px;
}

.form-inline.accountPayment {
	display: none;
}
/* 입력 폼 끝 */

/* 패널 해드  */
.panel-heading>h4 {
	font-weight: bold;
}

/* 포인트 패널 */
.mypoint {
	font-weight: bold;
	font-size: 15px;
	margin-left: 80px;
}

.form-control.point {
	width: 100px;
}

.infoform, .agreeform, .well.inform, .well.pointpanel {
	padding-left: 130px;
}

/* 버튼 */
.buttongroup {
	margin-left: 40%;
	margin-top: 30px;
	margin-bottom: 100px;
}

.buttongroup>a {
	margin-right: 50px;
}
</style>
<script>
	$(document).ready(function() {
		$("#kname").val("${user.userName}");
		$("#firstName").val("${user.userEngFirstName}");
		$("#lastName").val("${user.userEngLastName}");
		$("#birth").val();
		$("#email").val("${user.userEmail}");
		$("#phoneNum").val("${user.userPhone}");
	});

	$(document).ready(
			function() {
				//라디오버튼 선택시 입력폼 변환
				$("input:radio[name=radio]").click(function() {
					var check = $("input[name=radio]:checked");
					var checkid = "#" + check.attr("id") + "Payment";
					var uncheck = $("input[name=radio]:not(:checked)");
					var uncheckid = "#" + uncheck.attr("id") + "Payment";

					//	$(checkid).css("display", "inline");
					//	$(uncheckid).css("display", "none");
					//	$(uncheckid)[0].empty();

					$(checkid).show();
					$(uncheckid).hide();

					$(uncheckid).find(".form-control").each(function(i) {
						$type = $(this).attr("type");
						if ($type == "text") {
							$(this).val('');
						}
						$("select option").prop("selected", false);
						$(this).attr("required", false);
					});

					$(checkid).find(".form-control").each(function(i) {
						$(this).attr("required", true);
					});
				});

				//한글이름
				$("#kname").keyup(function() {
					$(this).val($(this).val().replace(/[^가-힣ㄱ-ㅎ]/gi, '')); //한글만 가능
				});

				//영어이름
				$("#ename").keyup(function() {
					$(this).val($(this).val().replace(/[^a-z]/gi, '')); //영어만 가능
				});

				//생년월일, 연락처, 계좌비밀번호, 주민등록번호
				$("#birth, #phoneNum, #password, .jumin").keyup(function() {
					$(this).val($(this).val().replace(/[^0-9]/gi, '')); //숫자만 가능
				});

				//카드번호
				$(".cardnum").keyup(function() {
					if ($("#cardselect option:selected").val() == "")
						alert("카드사를 선택해 주세요", "warning");
					$(this).val($(this).val().replace(/[^0-9]/gi, '')); //숫자만 가능
				});

				//계좌번호
				$("#accountnum").keyup(function() {
					if ($("#accountselect option:selected").val() == "")
						alert("은행을 선택해 주세요", "warning");
					$(this).val($(this).val().replace(/[^1-9]/gi, '')); //숫자만 가능
				});

				$("#point").click(function() {
					$(this).val("");
				});

				$("#point").keyup(
						function() {
							$(this).val($(this).val().replace(/(^0+)/gi, '')); //숫자만 가능
							$(this).val($(this).val().replace(/[^0-9]/gi, '')); //숫자만 가능
							var inputpoint = $("#point").val();
							var mypoint = $("#mypoint").text();
							if (parseInt(mypoint) < parseInt(inputpoint)) {
								alert("보유한 포인트를 초과할 수 없습니다.\n사용 가능한 포인트 : "
										+ parseInt(mypoint), "warning");
								$(this).val("");
							}
						});

				//예약신청 버튼 클릭시 호출
				$("#submitBtn").click(
						function(e) {
							var valid = this.form.checkValidity();
							var inputpoint = $("#point").val();
							var mypoint = $("#mypoint").text();

							if (parseInt(mypoint) < parseInt(inputpoint)) {
								alert("보유한 포인트를 초과할 수 없습니다.\n사용 가능한 포인트 : "
										+ parseInt(mypoint));
								return false;
							}
							if (inputpoint == "")
								$("#point").val("0");

							var radios = $(":radio[value='y']");
							for (var i = 0; i < radios.length; i++) {
								var $this = $(radios[i]);
								if (!$this.is(":checked")) { //동의함에 선택되어있지 않다면
									alert('개인정보 수집이용에 동의를 해야합니다');
									$this.focus();
									return false;
								}
							}

							if (valid) {
								event.preventDefault();

								$.ajax({
									type : "POST",
									url : "/",
									dataType : "text",
									data : $("#data").serialize(),
									success : function(data) {

										//	alert("success");
										$("div.modal").modal({
											remote : "02.html"
										});
									},
									error : function(data) {
										//	alert("fail");
										$("div.modal").modal({
											remote : "02.html"
										});
									}
								});
							}
						});

				//약관내용 로드
				$("#agreement1").load("agreement1.txt");
				$("#agreement2").load("agreement2.txt");
			});
</script>
</head>
<body>
	<div>
		<jsp:include page="../common/header.jsp" />
		<jsp:include page="../common/gnb.jsp" />
		<div id="contents">
			<section class="container">
				<!-- 진행상황 네비게이션 -->
				<nav class="navbar navbar-default">
					<ol class="breadcrumb">
						<li><a href="/hotel/room/roomReservation">STEP1 날짜/인원/객실 선택</a></li>
						<li class="active">STEP2 고객 정보 입력</li>
						<li><a>STEP3 예약완료</a></li>
					</ol>
				</nav>
				<!-- 진행상황 네비게이션 끝 -->

				<form id="data" action="03.html" method="post">
					<!-- 테이블 패널 -->
					<div class="panel panel-default">
						<!-- 패널헤드 -->
						<div class="panel-heading infoform">
							<h4>
								정보 입력 <small>&nbsp;&nbsp;&nbsp;*표시 필수 입력</small>
							</h4>
						</div>
						<!-- 패널헤드 끝 -->

						<!-- 테이블 -->
						<div class="table-responsive">
							<!-- 투숙인 정보 -->
							<div class="form-inline">
								<table class="table form">
									<tbody>
										<tr>
											<td colspan="2">투숙인 정보 입력</td>
										</tr>
										<tr>
											<td>*성명(국문)</td>
											<td><input type="text" class="form-control" id="kname"
												placeholder="성명(국문)" maxlength="10" required="required"></td>
										</tr>
										<tr>
											<td>*성명(영문)</td>
											<td>
												<input type="text" class="form-control" id="firstName"
												placeholder="영문성명(성)" maxlength="15" required="required">
												
												</td>
										</tr>
										<tr><td></td><td>
										<input type="text" class="form-control" id="lastName"
												placeholder="영문성명(이름)" maxlength="15" required="required">
												</td></tr>
										<tr>
											<td>*생년월일(6자)</td>
											<td><input type="text" class="form-control" id="birth"
												placeholder="주민등록번호 앞 6자리" maxlength="6" pattern=".{6,6}"
												required="required"></td>
										</tr>
										<tr>
											<td>*이메일</td>
											<td><input type="email" class="form-control" id="email"
												placeholder="이메일" maxlength="25" required="required"></td>
										</tr>
										<tr>
											<td>*연락처</td>
											<td><input type="text" class="form-control"
												id="phoneNum" placeholder="하이픈(-) 생략" maxlength="11"
												required="required"></td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- 투숙인 정보 끝-->

							<!-- 결제방법 선택 -->
							<table class="table form" id="select">
								<tbody>
									<tr>
										<td colspan="2">결제 정보 입력</td>
									</tr>
									<tr>
										<td>*결제수단</td>
										<td><input type="radio" name="radio" id="card"
											checked="checked" /><span>카드&nbsp;&nbsp;</span> <input
											type="radio" name="radio" id="account" /> <span>계좌이체</span></td>
									</tr>
								</tbody>
							</table>
							<!-- 결제방법 선택 끝-->

							<!-- 카드결제 폼-->
							<div class="form-inline cardPayment" id="cardPayment">
								<table class="table form">
									<tbody>
										<tr>
											<td>*카드사 선택</td>
											<td><select class="form-control" id="cardselect"
												required>
													<option value="" hidden>선택</option>
													<option>신한</option>
													<option>국민</option>
													<option>농협</option>
													<option>우리</option>
													<option>기업</option>
													<option>삼성</option>
													<option>카카오</option>
													<option>토스</option>
													<option>네이버</option>
											</select></td>
										</tr>
										<tr>
											<td>*카드 번호</td>
											<td>
												<div class="form-inline">
													<div class="form-group" id="formgroup">
														<input type="text" class="form-control cardnum"
															pattern=".{4,4}" maxlength="4" required> <span
															class="glyphicon glyphicon-minus"></span> <input
															type="text" class="form-control cardnum" pattern=".{4,4}"
															maxlength="4" required> <span
															class="glyphicon glyphicon-minus"></span> <input
															type="text" class="form-control cardnum" pattern=".{4,4}"
															maxlength="4" required> <span
															class="glyphicon glyphicon-minus"></span> <input
															type="text" class="form-control cardnum" pattern=".{4,4}"
															maxlength="4" required>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td>*유효기간</td>
											<td>
												<div class="form-inline">
													<div class="form-group">
														<select class="form-control" id="month" required>
															<option value="" hidden>월</option>
															<option>1</option>
															<option>2</option>
															<option>3</option>
															<option>4</option>
															<option>5</option>
															<option>6</option>
															<option>7</option>
															<option>8</option>
															<option>9</option>
															<option>10</option>
															<option>11</option>
															<option>12</option>
														</select> <select class="form-control" id="year" required>
															<option value="" hidden>년</option>
															<option>2019</option>
															<option>2020</option>
															<option>2021</option>
															<option>2022</option>
															<option>2023</option>
															<option>2024</option>
														</select>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td>*할부 방식</td>
											<td><select class="form-control" id="installment"
												required>
													<option value="" hidden>선택</option>
													<option>일시불</option>
													<option>3개월 할부</option>
											</select></td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- 카드결제 폼 끝-->

							<!-- 계좌이체 폼 -->
							<div class="form-inline accountPayment" id="accountPayment">
								<table class="table form">
									<tbody>
										<tr>
											<td>*출금은행</td>
											<td><select class="form-control" id="accountselect">
													<option value="" hidden>선택</option>
													<option>신한</option>
													<option>국민</option>
													<option>농협</option>
													<option>우리</option>
													<option>기업</option>
											</select></td>
										</tr>
										<tr>
											<td>*계좌번호(-)생략</td>
											<td><input type="text" class="form-control"
												id="accountnum" placeholder="하이픈(-) 생략" maxlength="15"
												pattern=".{10,15}"></td>
										</tr>
										<tr>
											<td>*비밀번호(4자리)</td>
											<td><input type="text" class="form-control"
												id="password" placeholder="4자리" maxlength="4"
												pattern=".{4,4}"></td>
										</tr>
										<tr>
											<td>*주민등록번호</td>
											<td>
												<div class="form-inline">
													<div class="form-group">
														<input type="text" class="form-control jumin"
															maxlength="6" pattern=".{6,6}"> <span
															class="glyphicon glyphicon-minus"></span> <input
															type="text" class="form-control jumin" maxlength="7"
															pattern=".{7,7}">
													</div>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- 계좌이체 폼 끝-->
						</div>
					</div>
					<!-- 테이블 끝-->

					<!-- 포인트사용 폼 -->
					<div class="well pointpanel">
						<div class="form-inline">
							<span class="usepoint">포인트 사용:</span> <input type="text"
								class="form-control point" id="point" value="0"> <span
								class="mypoint">보유 포인트: <span id="mypoint">${user.}</span></span>
						</div>
					</div>
					<!-- 포인트사용 폼 끝 -->

					<!-- 패널 -->
					<div class="well inform">
						<p>※ 숙박예정일 1일전 18시까지는 위약금 없이 취소 가능합니다.</p>
						<p>※ 위 기간 이후 취소 또는 변경 시 최초 1박요금의 80%가 부과됩니다.</p>
						※ 자세한 안내는 02-0000-0000로 문의 바랍니다.
					</div>
					<!-- 패널 끝-->

					<!-- 테이블 패널 -->
					<div class="panel panel-default">
						<!-- 패널헤드 -->
						<div class="panel-heading agreeform">
							<h4>개인정보 수집이용에 대한 동의</h4>
						</div>
						<!-- 패널헤드 끝 -->

						<!-- 테이블 -->
						<div class="table-responsive">
							<!-- 약관 동의 -->
							<table class="table form">
								<tbody>
									<tr>
										<td><textarea class="form-control" id="agreement1"
												rows="8" cols="60"></textarea></td>
									</tr>
									<tr>
										<td><input type="radio" name="agree1" value="y" /> <label>동의함</label>
											<input type="radio" name="agree1" value="n" checked="checked" />
											<label>동의하지않음</label></td>
									</tr>
								</tbody>
							</table>

							<table class="table form">
								<tbody>
									<tr>
										<td><textarea class="form-control" id="agreement2"
												rows="8" cols="60"></textarea></td>
									</tr>
									<tr>
										<td><input type="radio" name="agree2" value="y" /> <label>동의함</label>
											<input type="radio" name="agree2" value="n" checked="checked" />
											<label>동의하지않음</label></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>

					<!-- 버튼 -->
					<div class="buttongroup">
						<a class="btn btn-default" href="../room/05.html" role="button">
							<span class="glyphicon glyphicon-menu-left"></span>객실 선택
						</a>
						<button class="btn btn-default" id="submitBtn">예약신청</button>
					</div>
					<!-- 버튼 끝 -->

					<!-- 예약신청시 모달창 -->
					<div class="modal fade">
						<div class="modal-dialog">
							<div class="modal-content">
								<!-- remote ajax call이 되는영역 -->
							</div>
						</div>
					</div>
					<!-- 예약신청시 모달창 끝 -->
				</form>
			</section>
		</div>
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>