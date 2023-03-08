<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
	<header>
		<h1>Board Demo</h1>
	</header>
	<ul class="list-unstyled">
		<li class="border-top my-3"></li>
	</ul>
	<div class="container">
		<%-- boardForm ��� �� �ڸ�. --%>
		<form action="boardIn" method="post">
			<%-- ������� �����Ǹ� �޾ƿͼ� ������ �ʴ� �Ӽ����� reip �� �Ķ���ͷ� �����Ѵ�. --%>
			<input type="hidden" name="reip" value="<%=request.getRemoteAddr()%>">
			<div class="form-group">
				<label for="title">����</label>
				<!-- placeholder �Ӽ� �Է��� �����Ͱ� ���� ��� ������� ��Ÿ����.���������� �Է��� 100�ڱ����� ���� -->
				<!-- required �Ӽ��� �����ϸ� �ʼ��Է� �����̵ȴ�. -->
				<!-- pattern �Ӽ��� �̿��� ����ǥ�������� �������� ��ȿ�� �˻縦 �� �� �ִ�. -->
				<input type="text" class="form-control" id="subject" name="subject" placeholder="���� �Է�(4-100)" maxlength="100"
					required="required" pattern=".{4,100}">
			</div>
			<div class="form-group">
				<label for="content">����</label>
				<!--  �������� �����͸� �Է��ϰ� �ϰ��� �Ҷ� textarea �±׸� ����Ѵ�. -->
				<!--  textarea �ȿ� �ִ� ��� ���ڴ� �״�� ��Ÿ����. ���鹮��, tag, enter -->
				<textarea class="form-control" rows="5" id="contents" name="contents"
					placeholder="���� �ۼ�"></textarea>
			</div>
			<div class="form-group">
				<label for="writer">�ۼ���</label> <input type="text"
					class="form-control" id="writer" placeholder="�ۼ���(2��-10��)"
					name="writer">
			</div>
			<div class="form-group" style="text-align: right; margin-top: 10px;">
				<button type="submit" class="btn btn-primary">���</button>
				<button type="button" class="btn btn-success" id="listBtn">����Ʈ</button>
			</div>
		</form>

	</div>
</article>
	<script>
		//������ JSON�� �Ľ��� ������	
		const students = [];
		students.push({
			name : '����',
			kor : 87,
			eng : 98,
			math : 88,
			math : 90
		});
		students.push({
			name : '����',
			kor : 92,
			eng : 98,
			math : 96,
			scien : 88
		});
		students.push({
			name : '�ܿ�',
			kor : 76,
			eng : 96,
			math : 94,
			scien : 86
		});
		students.push({
			name : '�ٴ�',
			kor : 98,
			eng : 52,
			math : 98,
			scien : 92
		});
		console.log(students);

		//bar��Ʈ : �����Ϳ��� ������� �̸��� axis.x.category�� �޴´�.
		var chart = c3.generate({
			bindto : '#chart',
			//data.json
			data : {
				
				json : students, //������ JSON�� �Ľ��� �����͸� �����´�.
				
				keys : {
					// x: 'name', // it's possible to specify 'x' when category axis
					value : [ 'kor', 'eng', 'math', 'scien' ]
				},
				//data type   �׷��� ����
				type : 'bar' //bar ������������ ��Ÿ����. 

			},
			//
			axis : {
				x : {
					type : 'category',
					categories : [ students[0].name, students[1].name, students[2].name,students[3].name]
				}
			}
		});
	</script>