<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>
<c:if test="${today != null }">오늘의 날짜: ${today }, 당신의 아이피 : ${reip }</c:if>
</h1>
<h3>${profile }</h3>

</body>
</html>