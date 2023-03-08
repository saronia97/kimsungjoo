<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
	<header>
		<h1>Survey Detail Demo</h1>
	</header>
	<ul class="list-unstyled">
		<li class="border-top my-3"></li>
	</ul>
	<div>
		<%-- form start --%>
		<form action="addSurveyClient" method="post">
			<table class="table">
				<thead>
					<tr>
						<th colspan="2">SurveyClientDetail</th>
					</tr>
				</thead>
				<tbody>
				<tbody>
					<tr>
						<th>제목</th>
						<td colspan="2"><input type="text" value="${vo.sub}"
							readonly="readonly"> <input type="hidden" name="subcode"
							value="${vo.num}"></td>
					</tr>
					<c:forEach var="e" items="${vo.subvey}" varStatus="i">
						<tr>
							<th>${i.index+1}<input type="radio" name="subtype"
								value="${e.subtype}"></th>
							<td>${e.surveytitle}</td>
							<td style="text-align: center;">투표수 : ${e.surveycnt}<input
								type="hidden" name="surveycnt" value="${e.surveycnt}"></td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<th colspan="2"><input type="submit" value="투표하기"> 
						<input
							type="button" value="list" onclick="location='surveylist'">
						<input type="button" value="Chart" onclick="location='../survey/surveyTitle?num=${vo.num}'">
						</th>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</article>