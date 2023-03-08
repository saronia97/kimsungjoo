<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageurl"
	value="pro.kosmo?cmd=member&subcmd=mPageList&searchType=${searchType}&searchValue=${searchValue}&cPage"></c:set>
<style>
a:link {
	text-decoration: none;
}

table img {
	width: 80px;
}
/* paging */
table tfoot ol.paging {
	margin-left: 30%;
	list-style: none;
}

table tfoot ol.paging li {
	float: left;
	margin-right: 8px;
}

table tfoot ol.paging li a {
	display: block;
	padding: 3px 7px;
	border: 1px solid #00B3DC;
	color: #2f313e;
	font-weight: bold;
}

table tfoot ol.paging li a:hover {
	background: #00B3DC;
	color: white;
	font-weight: bold;
}

.disable {
	padding: 3px 7px;
	border: 1px solid silver;
	color: silver;
}

.now {
	padding: 3px 7px;
	border: 1px solid #ff4aa5;
	background: #ff4aa5;
	color: white;
	font-weight: bold;
}
</style>
<article>
	<header>
		<h1>UpBoard Demo</h1>
	</header>
	<ul class="list-unstyled">
		<li class="border-top my-3"></li>
	</ul>
	<div>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>이미지</th>
					<th>작성날짜</th>
				</tr>
			</thead>
			<tbody>
				<%-- for start --%>
				<c:forEach var="e" items="${list }">
					<tr>
						<td class="align-middle">${e.num }</td>
						<td class="align-middle"><a href="디테일경로">${e.sub }</a></td>
						<td class="align-middle">${e.writer }</td>
						<td><img
							src="${pageContext.request.contextPath}/resources/imgfile/${e.imgn}"
							class="rounded mx-auto d-block"></td>
						<td class="align-middle">${e.udate}</td>
					</tr>
				</c:forEach>
				<%-- for end --%>
			</tbody>
			<tfoot>
			
				
				<tr>
					<td colspan="5">
		<%@include file="../page/pageModule.jsp" %>
					</td>
				</tr>



				<%-- 
    <tr>
<th colspan="5" style="text-align: center; ">
      <ul class="pagination" style="margin:0 auto; width: 35%">
		  <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
		  <li class="page-item active" ><a class="page-link" href="#">1</a></li>
		  <li class="page-item"><a class="page-link" href="#">2</a></li>
		  <li class="page-item"><a class="page-link" href="#">3</a></li>
		  <li class="page-item"><a class="page-link" href="#">4</a></li>
		  <li class="page-item"><a class="page-link" href="#">5</a></li>
		  <li class="page-item"><a class="page-link" href="#">Next</a></li>
      </ul>
 </th>
      </tr>
      --%>
				<%--
    end
       --%>



				<tr>
					<th colspan="5">
						<form class="d-flex">
							<select class="form-control btn-mini" id="sel1"
								style="margin-left: 120px;">
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
							</select> <input class="form-control me-2" type="text"
								placeholder="Search.." style="width: 300px">
							<button class="btn btn-outline-secondary" type="button">Search</button>
						</form>
					</th>
				</tr>
				<tr>
					<td colspan="5" style="text-align: right;">
						<!-- 
      jQuery로 글작성 폼으로 이동시키기
      id를 부여하여 선택자로 selector를 사용해서 이동시키기
      footer.jsp에서 작성.
       -->
						<button type="button" class="btn btn-outline-secondary" id="wBtn">글작성</button>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</article>
<script>
	$(function() {
		$('#wBtn').click(function() {
			location = 'upform';
		});
	});
</script>
