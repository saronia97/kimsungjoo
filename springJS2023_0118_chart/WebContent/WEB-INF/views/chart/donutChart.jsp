
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
    
    <article >
        <header>
            <h1>ChartJson Demo</h1>
        </header>
        <ul class="list-unstyled"><li class="border-top my-3"></li></ul>
        <div class="container">
		<div id="chart"></div>

     </div>
 
    </article>
<script>
// 서버측 json을 파싱한 데이터 
let jsondata = {
		  '비가 옵니다': 500,
		  '안옵니다': 200,
		  '모릅니다': 666,
		  '태풍이옵니다': 54,
		  '관심없음': 120
}; 
console.log(jsondata);
// donut : 데이터에서 사용자의 이름을 axis.x.category
var chart = c3.generate({
    bindto: '#chart',
    data: {
          json: [jsondata],
          keys: {
        	  value: Object.keys(jsondata),
          },
      type: 'donut'
    },
    donut: {
		  title: "날씨 설문조사내용",
	  },
});
</script>