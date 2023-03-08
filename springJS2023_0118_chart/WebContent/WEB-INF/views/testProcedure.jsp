<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--2023. 2. 22. / Kosmo --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
<style>
</style>
<script>
	
</script>
</head>
<body>
	<div>
		<table>
			<tbody>
				<c:forEach var="item" items="${list}">
					<tr>
						<td>${item.SANUN}</td>
						<td>${item.SANAME}</td>
						<td>${item.SAPAY}</td>
						<td>${item.DEPTNO}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<button class="btn" type="button" onclick="javascript:history.back()">back</button>
</body>
</html>