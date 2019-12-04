<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
.modalbtngroup {
	margin-left: 80%;
}
</style>
</head>
<body>
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
						<td><textarea class="form-control" rows="12" cols="60"></textarea></td>
					</tr>
				</tbody>
			</table>

		</div>
		<div class="modalbtngroup">
			<button class="btn btn-default" data-dismiss="modal" type="submit">제출</button>
			<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		</div>
	</div>
</body>
</html>