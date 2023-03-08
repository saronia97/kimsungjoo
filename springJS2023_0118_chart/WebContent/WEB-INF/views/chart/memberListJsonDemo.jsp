<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- 2023-01-18 2교시 -->
<article>
	<header>
		<h1>deptJsonDemo</h1>
	</header>
	<ul class="list-unstyled">
		<li class="border-top my-3"></li>
	</ul>
	<div class="container">
		<div class="row">
			<button id="listBtn">Click</button>
			<div class="row justify-content-center">
				<table class="table">
					<thead>
						<tr>
							<td>Num</td>
							<td>Id</td>
							<td>Name</td>
							<td>age</td>
							<td>Gender</td>
							<td>Mdate</td>
						</tr>
					</thead>
					<tbody id="target">

					</tbody>
				</table>
			</div>
		</div>
	</div>
</article>
<script>
	//jQuery 시작  오늘자 복습~~~~~ 01 18
	$(function() {
		$('#listBtn').click(function() {

			$.ajaxSetup({
				cache : false
			});

			$.ajax({
				url : "../memberJsonList",
				success : function(jsonData) {
					$('#target').html("");

					$.each(jsonData,function(k, v) {
						let htmlTag = "<tr>";
						$.each(v, function(k1, v1){
							console.log(k1 +":"+v1);
							if(v1 !== null)
							htmlTag += "<td>"+v1+"</td>";
						})
						htmlTag += "</tr>";
						$('#target').append(htmlTag);
					})
				}
			});
		});

	});
</script>