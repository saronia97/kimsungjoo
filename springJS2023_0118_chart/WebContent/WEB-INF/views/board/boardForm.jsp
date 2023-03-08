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
		<%-- boardForm 들어 갈 자리. --%>
		<form action="boardIn" method="post">
			<%-- 사용자의 아이피를 받아와서 보이지 않는 속성으로 reip 란 파라미터로 지정한다. --%>
			<input type="hidden" name="reip" value="<%=request.getRemoteAddr()%>">
			<div class="form-group">
				<label for="title">제목</label>
				<!-- placeholder 속성 입력한 데이터가 없는 경우 배경으로 나타난다.실제적으로 입력을 100자까지로 지정 -->
				<!-- required 속성을 설정하면 필수입력 사항이된다. -->
				<!-- pattern 속성을 이용한 정규표현식으로 데이터의 유효성 검사를 할 수 있다. -->
				<input type="text" class="form-control" id="subject" name="subject" placeholder="제목 입력(4-100)" maxlength="100"
					required="required" pattern=".{4,100}">
			</div>
			<div class="form-group">
				<label for="content">내용</label>
				<!--  여러줄의 데이터를 입력하고 하고자 할때 textarea 태그를 사용한다. -->
				<!--  textarea 안에 있는 모든 글자는 그대로 나타난다. 공백문자, tag, enter -->
				<textarea class="form-control" rows="5" id="contents" name="contents"
					placeholder="내용 작성"></textarea>
			</div>
			<div class="form-group">
				<label for="writer">작성자</label> <input type="text"
					class="form-control" id="writer" placeholder="작성자(2자-10자)"
					name="writer">
			</div>
			<div class="form-group" style="text-align: right; margin-top: 10px;">
				<button type="submit" class="btn btn-primary">등록</button>
				<button type="button" class="btn btn-success" id="listBtn">리스트</button>
			</div>
		</form>

	</div>
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
					categories : [ students[0].name, students[1].name, students[2].name,students[3].name]
				}
			}
		});
	</script>