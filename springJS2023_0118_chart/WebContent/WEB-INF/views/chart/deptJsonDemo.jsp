<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- 2023-01-18 2���� -->
<article>
	<header>
		<h1>deptJsonDemo</h1>
	</header>
	<ul class="list-unstyled">
		<li class="border-top my-3"></li>
	</ul>
	<div class="container">
		<div class="row">
			<input type="text" id="id" name="id" placeholder="���̵� �Է��غ�����">

			<hr>
			<button id="jsonAjaxTest">Click</button>
			<div id="target" class="row justify-content-center">Target!</div>
		</div>
	</div>
</article>
<script>
	//jQuery ����
	$(function() {
		$('#jsonAjaxTest').click(function() {
			
			alert("Test"+$('#id').val());
			
			//alert("Test");
			$.ajaxSetup({ //Ajax ĳ�ø� ����
				cache:false
			});
			$.ajax({
				url:"../deptJsonView1?id="+$('#id').val(),
				success:function(jsonData){
					$('#target').html(""); //���� (�ߺ��ȵǰ�)
					console.log(jsonData);
					console.log(Object.keys(jsonData));
					console.log(typeof(jsonData));
					console.log('-------------');
					for(let e in jsonData){
						console.log(e);
					}
					console.log('-------------');
					//json�����͸� jQuery�ݺ��ڸ� ����ؼ� ����ϱ�
					$.each(jsonData,function(k,v){
						console.log(k+":"+v);
						$('#target').append("<p>"+k+":"+v+"</p>");
					});
					console.log('-------------');
					//target�� �ڽ��� p �±׸� �����ؼ�
					//jQuery�� css�Լ��� ����ؼ� �������� css�� ������ �� �ִ�.
					$('#target>p').css("background","orange").css("text-align","center").css("color","#ffffff");
				}
			});
		});
	
		
	});
</script>