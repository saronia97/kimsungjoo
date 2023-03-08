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
		<h1>Chart Demo</h1>
	</header>
	<div id="chart"></div>
</article>

<script>
	//서버측 JSON을 파싱한 데이터	
	const students = [];
	students.push({
		name : '구름',
		kor : 87,
		eng : 98,
		math : 88,
		math : 90
	});
	students.push({
		name : '별이',
		kor : 92,
		eng : 98,
		math : 96,
		scien : 88
	});
	students.push({
		name : '겨울',
		kor : 76,
		eng : 96,
		math : 94,
		scien : 86
	});
	students.push({
		name : '바다',
		kor : 98,
		eng : 52,
		math : 98,
		scien : 92
	});
	console.log(students);

	//bar차트 : 데이터에서 사용자의 이름을 axis.x.category로 받는다.
	var chart = c3.generate({
		bindto : '#chart',
		//data.json
		data : {

			json : students, //서버측 JSON을 파싱한 데이터를 가져온다.

			keys : {
				// x: 'name', // it's possible to specify 'x' when category axis
				value : [ 'kor', 'eng', 'math', 'scien' ]
			},
			//data type   그래프 형식
			type : 'bar' //bar 막대형식으로 나타낸다. 

		},
		//
		axis : {
			x : {
				type : 'category',
				categories : [ students[0].name, students[1].name,
						students[2].name, students[3].name ]
			}
		}
	});
</script>