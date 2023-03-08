
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 차트만들때 필수요소 --%>
<%-- load c3.css  타이틀 밑에넣음--%>
<link href="${pageContext.request.contextPath}/resources/css/c3.css"
	rel="stylesheet">
<style></style>
<!-- Load d3.js and c3.js -->
<script
	src="${pageContext.request.contextPath}/resources/js/d3-5.8.2.min.js"
	charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/c3.min.js"></script>

<article>
	<header>
		<h1>[ChartJson Demo]S.D.C.A</h1>
	</header>
	<ul class="list-unstyled">
		<li class="border-top my-3"></li>
	</ul>
	<div class="container">
		<div id="chart"></div>

	</div>

</article>
<script>
	// donut : 데이터에서 사용자의 이름을 axis.x.category
	$.ajaxSetup({
		cache : false
	});

	$.ajax({
		url : "../surveyJsonObj2?num="+${num},
		success : function(jsondata) { //url이 성공하면 밑의 ajax를 실행한다
			console.log(jsondata[0].sub);
			console.log("---------------------");
			console.log(jsondata[1]);
			console.log("---------------------");
			var chart = c3.generate({
				bindto : '#chart',
				data : {
					json : [jsondata[1]],
					keys : {
						value : Object.keys(jsondata[1]),
					},
					type : 'donut'
				},
				donut : {
					title : jsondata[0].sub,
				},
			});
			//----------------------
		},
		error : function(e) {
			console.log("error:" + e);
		}
	});
</script>