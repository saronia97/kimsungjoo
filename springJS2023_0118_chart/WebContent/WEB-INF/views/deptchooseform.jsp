<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>deptchooseform</title>
<style>
#container {
	width: 450px;
	margin: auto;
}

table {
	border-collapse: collapse;
	width: 100%
}

th {
	background-color: #ff9933
}

tbody img {
	width: 100px;
}

th, td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

tr:hover {
	background: #ff9933
}
</style>
</head>
<body>
	<div id="container">
		<form method="post" action="deptlist">
			<table>
				<thead>
					<tr>
						<th colspan="2">ResultMap 예제 2</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>부서번호</th>
						<td><select name="deptno">
								<option value="0">--선택--</option>
								<option>10</option>
								<option>20</option>
								<option>30</option>
								<option>40</option>
								<option>50</option>
								<option>60</option>
						</select></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<th colspan="2">
						<input type="submit" value="검색"></th>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>