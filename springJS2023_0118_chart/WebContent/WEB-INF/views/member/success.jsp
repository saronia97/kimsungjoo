<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<p>회원가입축가</p>
	<hr>
	<h2>회원가입정보</h2>
	<ul>
		<li>아이디 : ${vo.id}</li>
		<li>비밀번호 : ${vo.pwd}</li>
		<li>이름 : ${vo.uname}</li>
		<li>날짜 : ${vo.rdate}</li>
	</ul>
</body>
</html>