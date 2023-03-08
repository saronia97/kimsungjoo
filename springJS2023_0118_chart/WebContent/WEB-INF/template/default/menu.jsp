<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-expand-sm mybgColor">
	<div class="container-fluid">
		<ul class="navbar-nav">
			<li class="nav-item"><a
				href="${pageContext.request.contextPath}/web/web/main"
				class="nav-link active">Home</a></li>
			<li class="nav-item"><a
				href="${pageContext.request.contextPath}/web/mboard/mboardlist"
				class="nav-link">Board</a></li>
			<li class="nav-item"><a
				href="${pageContext.request.contextPath}/web/upload/upboardList"
				class="nav-link">Upload</a></li>
			<li class="nav-item"><a
				href="
					${pageContext.request.contextPath}/web/mail/emailForm"
				class="nav-link">Email</a></li>
			<li class="nav-item"><a
				href="${pageContext.request.contextPath}/web/survey/surveyForm"
				class="nav-link">Survey</a></li>

			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle"
				href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false">
					Chart </a>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="${pageContext.request.contextPath}/web/mychart/chartlist">chartlist</a></li>
					<li><a class="dropdown-item" href="${pageContext.request.contextPath}/web/mychart/donutchart">donutchart</a></li>

					<li><a class="dropdown-item" href="${pageContext.request.contextPath}/web/mychart/deptJsonDemo">deptJsonDemo</a></li>

					<li><a class="dropdown-item" href="${pageContext.request.contextPath}/web/mychart/memberListJsonDemo">memberListJsonDemo</a></li>

					<li><a class="dropdown-item" href="${pageContext.request.contextPath}/web/mychart/surveyAjax">surveyDonutChartAjax</a></li>

					<li><a class="dropdown-item" href="#">AjaxChart</a></li>
				</ul></li>
		</ul>
		
		
		<form class="d-flex">
			<input class="form-control me-2" type="text" placeholder="Search"
				name="searchv" id="searchv">
			<button class="btn btn-primary" type="button">Search</button>
		</form>
	</div>
</nav>