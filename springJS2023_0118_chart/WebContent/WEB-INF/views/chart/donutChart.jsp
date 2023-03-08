
    <%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- ��Ʈ���鶧 �ʼ���� --%>
<%-- load c3.css  Ÿ��Ʋ �ؿ�����--%>
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
// ������ json�� �Ľ��� ������ 
let jsondata = {
		  '�� �ɴϴ�': 500,
		  '�ȿɴϴ�': 200,
		  '�𸨴ϴ�': 666,
		  '��ǳ�̿ɴϴ�': 54,
		  '���ɾ���': 120
}; 
console.log(jsondata);
// donut : �����Ϳ��� ������� �̸��� axis.x.category
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
		  title: "���� �������系��",
	  },
});
</script>