<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<article>
	<header>
		<h1>memberDetail Demo</h1>
	</header>
	<ul class="list-unstyled">
		<li class="border-top my-3"></li>
	</ul>
	<div class="container">
		<%-- boardDetail ��� �� �ڸ�. --%>

		<div class="form-group">
			<label for="id">���̵� </label>
			<!-- placeholder �Ӽ� �Է��� �����Ͱ� ���� ��� ������� ��Ÿ����.���������� �Է��� 100�ڱ����� ���� -->
			<!-- required �Ӽ��� �����ϸ� �ʼ��Է� �����̵ȴ�. -->
			<!-- pattern �Ӽ��� �̿��� ����ǥ�������� �������� ��ȿ�� �˻縦 �� �� �ִ�. -->
			<input type="text" class="form-control" id="id" name="id"
				value="${vo.id}" readonly="readonly">
		</div>
		<div class="form-group">
			<label for="content">�̸�</label>
			<!--  �������� �����͸� �Է��ϰ� �ϰ��� �Ҷ� textarea �±׸� ����Ѵ�. -->
			<!--  textarea �ȿ� �ִ� ��� ���ڴ� �״�� ��Ÿ����. ���鹮��, tag, enter -->
			<textarea class="form-control" rows="5" id="name" name="name"
				readonly="readonly">${vo.name}</textarea>
		</div>
		<div class="form-group">
			<label for="age">����</label> <input type="text" class="form-control"
				id="age" name="age" value="${vo.age}" readonly="readonly">
		</div>
		<div class="form-group">
			<label for="writer">�ۼ���</label> <input type="text"
				class="form-control" id="writer" name="writer" value="${vo.writer}"
				readonly="readonly">
		</div>
		<div class="form-group">
			<label for="mdate">���Գ�¥</label> <input type="text"
				class="form-control" id="mdate" name="mdate" value="${vo.mdate}"
				readonly="readonly">
		</div>
		<div class="form-group" style="text-align: right; margin-top: 10px;">
			<button type="button" class="btn btn-warning" id="delBtn">����</button>
			<button type="button" class="btn btn-primary" id="writeBtn">�۾���</button>
			<button type="button" class="btn btn-success" id="listBtn">����Ʈ</button>
		</div>
	</div>
</article>

<script>
	$(function() {
		$('#delBtn').click(function() {
			location = 'boardDel?num=' + $
			{
				vo.num
			}
			;
		});
		$('#writeBtn').click(function() {
			location = 'mboardForm';
		});
		$('#listBtn').click(function() {
			location = 'mboardlist';
		});
	})
</script>