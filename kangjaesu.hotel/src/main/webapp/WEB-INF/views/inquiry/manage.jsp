<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../common/import.jsp"></jsp:include>
<style>

/*테이블*/
.table, th {
	text-align: center;
}

.td1 {
	width: 80px;
}

.td2 {
	width: 450px;
	text-align: left;
}

.td3, .td4 {
	width: 150px;
}

.td5 {
	width: 200px;
}

/* 페이징 */
.paging {
	text-align: center;
	margin-bottom: 100px;
}

/* 버튼 */
.modalbtn{
	margin-left: 90%;
}
.modalbtngroup {
	margin-left: 80%;
}
</style>
<script>
var alert = function(msg, type) {
	swal({
		text: msg,
		icon: type,
		buttons: true,
		buttons: "확인",
	});
}

$(function() {		
	//보기 버튼 클릭시 호출
	$(".confirmModalButton").click(function() {
		var inqNumber = $(this).attr('id').substr(1);
			 $.ajax({
			url:"getInquiry",
			method:"GET",
			data: {					
				inqNum:inqNumber
			},
			success:function(inq){
				$("#inqTitle").val(inq.inqTitle);
				$("#inqContent").val(inq.inqContent);
				$("#inqWriter").val(inq.inqWriter);
				$("#inqEmail").val(inq.inqEmail);
				$("#inqPhone").val(inq.inqPhone);
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

	//답변 버튼 클릭시 호출
	$(".inquiryModalButton").click(function() {
		var inqNumber = $(this).attr('id').substr(1);
		$.ajax({
			url:"getInquiry",
			method:"GET",
			data: {					
				inqNum:inqNumber
			},
			success:function(inq){
				$("#inquiryModal").modal('show');
				$('#inquiryModal').modal({backdrop: 'static'});
			},
			error:function(a, b, errMsg){
				alert("오류" + errMsg);
			}
		});  
	/* 	$("#inquiryModal").modal({
			remote : "inquiryAnswer"
		});  
	*/
	});

	//삭제버튼 클릭시 호출
	$(".deleteButton").click(function() {
		var inqNumber = $(this).attr('id').substr(1);
		
		swal(inqNumber+"번 문의를 삭제 하시겠습니까?", {
			icon: "warning",
	        buttons: ["취소", "확인"],
	      }).then((value) => {
				if(value)
	    		  $.ajax({
	    				url:"deleteInquiry",
	    				method:"GET",
	    				data: {					
	    					inqNum:inqNumber
	    				},
	    				success:function(){
	    					swal("삭제되었습니다.", {
	    						icon: "success",
	    						buttons: "확인",
	    					}).then((willDelete) => {
	    						location.href = "/hotel/inquiry/inquiryManage";
	    					});
	    				},
	    				error:function(a, b, errMsg){
	    					alert("삭제  오류" + errMsg);
	    				}
					}); 
				else
					return;
	      });
	});
});

function submitConfirm(){
	
	swal({
		text: "작성한 내용으로 답변을 등록 하시겠습니까?",
			icon: "warning",
			buttons: true,
			buttons: ["취소", "확인"],
		})
		.then((willDelete) => {
			if (willDelete) {
				submit();
			}else{
				return;
			}
		});
}

function submit(){	
	var status = 1;
	var inqNumber = inq.inqNum;

	 $.ajax({
		url:"writeComment",
		method:"GET",
		data: {			
			inqNum:inqNumber,
			inqCmtContent:$("#inqCmtContent").val()
		},
		success:function(){
			swal( {
				text: "답변완료",
		    	icon: "success",
		    	buttons: "확인",
		    }).then((willDelete) => {
		    	location.href = "/hotel/inquiry/inquiryManage";
		  });
		},
		error:function(a, b, errMsg){
			alert("작성  오류" + errMsg);
		}
	 }); 
}
</script>
</head>
<body>
	<div>
		<jsp:include page="../common/header.jsp" />
		<jsp:include page="../common/gnb.jsp" />
		<!-- 섹션 타이틀 -->
		
		<div class="container center-block">
			<div class="location">
				<p>
					<a><span class="glyphicon glyphicon-home">&nbsp;></span></a> <a>문의관리</a>
				</p>
			</div>
			<div class="headTit">
				<h3>&nbsp;문의관리</h3>
			</div>
			<br> <br>
		</div>
		<!-- 섹션 타이틀 끝-->
		<!-- inquirymain 시작 -->
		<div class="container bodymain">
			<p class="pull-right">미처리 문의: 1건</p>

			<table class="table table-hover table-bordered table-condensed">
				<tr class="success">
					<th>번호</th>
					<th>문의제목</th>
					<th>등록일자</th>
					<th>처리상태</th>
					<th></th>
				</tr>
				<c:forEach var="list" items="${inquiryList}">

					<tr class="inqTable">
						<td class="td1">${list.inqNum}</td>
						<td class="td2">&emsp;${list.inqTitle}</td>
						<td class="td3">${list.inqDate}</td>
						<td class="td4">${list.status}</td>
						<td class="td5"><button type="button"
								class="btn btn-default confirmModalButton" id="v${list.inqNum}">보기</button>
							<button type="button" class="btn btn-default inquiryModalButton"
								id="a${list.inqNum}">답변</button>

							<button type="button" class="btn btn-danger deleteButton"
								id="d${list.inqNum}">삭제</button></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<!-- inquirymain 끝 -->
		<!-- paging -->
		<div class="paging">
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
					aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
			</ul>
		</div>
		<!-- paging 끝 -->
	</div>

	<!-- 문의 보기 모달 -->
	<div class="modal fade" id="confirmModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- remote call이 되는영역 -->
				<div class="modal-body">
					<div class="panel panel-default">
						<!-- 테이블 -->
						<div class="table-responsive">
							<table class="table">
								<tbody>
									<tr>
										<td>제목</td>
										<td><input type="text" id="inqTitle" class="form-control"
											onfocus="this.blur();"></td>
									</tr>
									<tr>
										<td>내용</td>
										<td><textarea id="inqContent" class="form-control"
												rows="12" cols="60" onfocus="this.blur();"></textarea></td>
									</tr>
									<tr>
										<td>이름</td>
										<td><input id="inqWriter" type="text"
											class="form-control" onfocus="this.blur();"></td>
									</tr>
									<tr>
										<td>이메일</td>
										<td><input id="inqEmail" type="text" class="form-control"
											onfocus="this.blur();"></td>
									</tr>
									<tr>
										<td>연락처</td>
										<td><input id="inqPhone" type="text" class="form-control"
											onfocus="this.blur();"></td>
									</tr>

								</tbody>
							</table>
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
	<!-- 문의 보기 모달 끝 -->

	<!-- 답변 모달 -->
	<div class="modal fade" id="inquiryModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- remote call이 되는영역 -->
				<form method="post" action="inquiryMail">
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
										<td><textarea id="inqCmtContent" class="form-control"
												rows="12" cols="60"></textarea></td>
									</tr>
								</tbody>
							</table>

						</div>
						<div class="modalbtngroup">
							<button class="btn btn-default"
								type="button" onclick="submitConfirm();">제출</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">취소</button>
						</div>
					</div>
				</form>
				<!-- remote call끝 -->
			</div>
		</div>
	</div>
	<!-- 답변 모달 끝 -->
	<jsp:include page="../common/footer.jsp" />


</body>
</html>