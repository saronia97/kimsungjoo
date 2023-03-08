<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<article>
	<header>
		<h1>FileUpload Demo</h1>
	</header>
	<ul class="list-unstyled">
		<li class="border-top my-3"></li>
	</ul>
	<div class="container">
		<%-- boardForm 들어 갈 자리. --%>
		<fieldset>
			<legend>이미지 업로드 폼</legend>
			<form method="post" action="uploadpro" enctype="multipart/form-data">
				<div class="row mb-3">
					<label class="col-sm-2 col-form-label">제 목</label>
					<div class="col-sm-10">
						<input type="text" name="sub" id="sub" placeholder="제목을 입력하세요." />
					</div>

				</div>
				<div class="row mb-3">
					<label class="col-sm-2 col-form-label">작성자</label>
					<div class="col-sm-10">
						<input type="text" name="writer" id="writer" />
					</div>
				</div>
				<div class="row mb-3">
					<label class="col-sm-2 col-form-label">비밀번호</label>
					<div class="col-sm-10">
						<input type="password" name="pwd" id="pwd" />
					</div>
				</div>
				<div class="row mb-3">
					<label class="col-sm-2 col-form-label">이미지 내용</label>
					<textarea name="cont" id="cont" rows="10" cols="13"></textarea>
				</div>
				<div class="row mb-3">
					<label class="col-sm-2 col-form-label">*이미지업로드</label>
					<div class="col-sm-10">
						<input type="file" name="mfile" id="mfile" />
					</div>
					<div class="col-sm-10">
						<img
							src="${pageContext.request.contextPath}/resources/image/noimage.jpg"
							id="imgx">
					</div>
				</div>
				<div class="row mb-3 ">
					<div class="col-sm-10">
						<input type="submit" value="등록" id="btn1" class="btn btn-info" />
						<input type="button" value="등록" id="btn1" class="btn btn-danger"
							onclick="location='ex1_list.jsp?cPage=1'" />
					</div>
				</div>
			</form>
		</fieldset>

	</div>

</article>
<%-- 11월 25일  --%>
<%-- 미리보기 --%>
<script>
function readURL(input){
	 // input type="file" 의 주소를 가져온다.
	 if (input.files && input.files[0]) {
		// 자바스크립트 I/O 
		var reader = new FileReader();
		// 감지자
		reader.onload = function(e) {
			$('#imgx').attr('src', e.target.result);  // setter 넣겠다.
			
		}
		reader.readAsDataURL(input.files[0]);
	 }
}
//jQuery 문법 
$(function(){
	 //jQuery 선택자
	// 대상선택자에서 변화를 감지하는 이벤트 : change()
	 $('#mfile').change(function(){
		 if($(this).val().length > 0){
			 readURL(this);
		 }else{
			 console.log("이미지 없다.");
		 }
	 });

});
</script> 

