<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container">
		<form action="memberIn" method="post">
			<table class="table">
				<tr>
					<td><label class="form-label">아이디</label></td>
					<td><input type="text" class="form-control" name="id" id="id"
						maxlength="10" style="width: 300px; display: inline;"> <input
						type="button" class="btn btn-outline-primary" value="중복확인"
						id="idChkBtn"></td>
				</tr>
				<tr>
					<td><label class="form-label">비밀번호</label></td>
					<td><input type="password" class="form-control" name="pwd">
					</td>
				</tr>
				<tr>
					<td><label class="form-label">이름</label></td>
					<td><input type="text" class="form-control" name="uname">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="submit" class="btn btn-primary">Submit</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>