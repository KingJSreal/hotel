<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="../res/css/common.css">
<style>
/* 섹션 타이틀 */
.location {
	float: right;
	height: 47px;
	padding: 40px 0 0 0;
}

.location a {
	text-decoration: none;
	color: #4C4A4A;
}

.headTit {
	border-bottom: #432c10 solid 2px;
	height: 47px;
	font-style: Sans-Serif;
}
/* 섹션 타이틀 끝 */
.bodymain {
	padding: 0 30px 30px 30px;
}

/*테이블*/
.td5 {
	width: 200px;
	text-align: center;
}
/*테이블 끝*/

/* 페이징 */
.paging {
	text-align: center;
	margin-bottom: 100px;
}
</style>
<script>
var alert = function(msg, type) {
	swal({
		title : "",
		text : msg,
		type : type,
		customClass : "sweet-size",
		confirmButtonText: "확인"
	});
}
var confirm = function(msg, type) {
	   swal(msg, {
	        buttons: ["취소", "확인"],
	      }).then((value) => {
	    	  if(value)
	    		  return;
	    	  else
	    		  return;
	      });
	}

	$(function() {
		//확인 버튼 클릭시 호출
		$("#confirmModalButton").click(function() {
			$("#confirmModal").modal({
				remote : "05.html"
			});
		});

		//답변 버튼 클릭시 호출
		$("#inquiryModalButton").click(function() {
			$("#inquiryModal").modal({
				remote : "06.html"
			});
		});

		//삭제버튼 클릭시 호출
		$("#deleteButton").click(function() {
			confirm("해당 문의를 삭제 하시겠습니까?")
		});
	});
</script>
</head>
<body>
<div class="container">
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
				
					<tr>
						<td>${list.inqNum}</td>
						<td>${list.inqTitle}</td>
						<td>${list.inqDate}</td>
						<td>${list.status}</td>
						<td class="td5"><button type="button" class="btn btn-default"
								id="confirmModalButton">보기</button>
							<button type="button" class="btn btn-default"
								id="inquiryModalButton">답변</button>

							<button type="button" class="btn btn-danger" id="deleteButton">삭제</button></td>
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
					<li class="page-item"><a class="page-link" href="#">6</a></li>
					<li class="page-item"><a class="page-link" href="#">7</a></li>
					<li class="page-item"><a class="page-link" href="#">8</a></li>
					<li class="page-item"><a class="page-link" href="#">9</a></li>
					<li class="page-item"><a class="page-link" href="#">10</a></li>
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
				</div>
			</div>
		</div>
		<!-- 문의 보기 모달 끝 -->

		<!-- 답변 모달 -->
		<div class="modal fade" id="inquiryModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- remote call이 되는영역 -->
				</div>
			</div>
		</div>
		<!-- 답변 모달 끝 -->
<jsp:include page="../common/footer.jsp" />


</body>
</html>