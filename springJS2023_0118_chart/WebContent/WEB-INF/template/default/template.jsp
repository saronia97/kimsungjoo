<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- tiles 선언 -->
<%-- 분리한 각각의 jsp를 tiles설정으로 현재 템플리트에서 insert(포함) 시키는 태그를 사용하기 위한 라이브러리를 선언 --%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>


<%-- 헤더 시작 --%>
<head>
<TITLE>Kosmo123</TITLE>
<meta charset="euc-kr">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
a {
	text-decoration: none;
}

select.btn-mini {
	height: auto;
	width: 200px;
	line-height: 14px;
}

.card {
	border: none;
	box-shadow: 5px 6px 6px 2px #e9ecef;
	border-radius: 4px;
}

.dots {
	height: 4px;
	width: 4px;
	margin-bottom: 2px;
	background-color: #bbb;
	border-radius: 50%;
	display: inline-block;
}

.badge {
	padding: 7px;
	padding-right: 9px;
	padding-left: 16px;
	box-shadow: 5px 6px 6px 2px #e9ecef;
}

.user-img {
	margin-top: 4px;
}

.check-icon {
	font-size: 17px;
	color: #c3bfbf;
	top: 1px;
	position: relative;
	margin-left: 3px;
}

.form-check-input {
	margin-top: 6px;
	margin-left: -24px !important;
	cursor: pointer;
}

.form-check-input:focus {
	box-shadow: none;
}

.icons i {
	margin-left: 8px;
}

.reply {
	margin-left: 12px;
}

.reply small {
	color: #b7b4b4;
}

.reply small:hover {
	color: green;
	cursor: pointer;
}

.bgGr1 {
	background-color: #0d6efd
}

.bgGr2 {
	background-color: #ffc107
}

.bgGr3 {
	background-color: #0dcaf0
}

#colTitle {
	background-color: #000000;
}

.mytable-condensed {
	font-size: 11px;
}
</style>
<script>
	$(function() {
		$('#searchv').focusin(function() {
			$(this).val("검색어 입력")
		});
		$('#searchv').focusout(function() {
			$(this).val("")
		});

		//let firstColor ="d-flex flex-row-reverse mybgColor";
		console.log("log00 => " + $('.mybgColor').attr('class'));
		$('#item1').click(function() {
			//$(this).attr('class',firstColor)
			console.log("log => " + $('.mybgColor').attr('class'));
			$('.mybgColor').attr('class', function() {
				$(this).attr('style', 'background-color:#0dcaf0');
				/*
				let changeClass = $(this).attr('class');
				let class_sttr_arr = changeClass.split(" ");
				$.each(class_sttr_arr,function(e,val){
					console.log(e+"::::::::::::::::::"+val)
					if(val.includes("bg-")){
						console.log("================>"+e+":"+val);
						$('.mybgColor').attr('class').replace(val,'bg-info');
					}else{
						changeClass +=" bg-info";
					}
					$('.mybgColor').attr('class',changeClass)
				});
				 */
			});
		});
		$('#item2').click(
				function() {
					console.log("log => " + $('.mybgColor').attr('class'));
					$('.mybgColor').attr('class', function() {
						$(this).attr('style', 'background-color:#ffc107');
					});
					//이미지 세팅하기
					let imgArr = [ 'd1.jpg', 'd2.jpg', 'd3.jpg' ];
					$('.carousel-item > img').each(
							function(idx) {
								console
										.log("바뀔 이미지 :" + imgArr[idx]
												+ ", log Img => "
												+ $(this).attr('src'));
								$(this).attr('src',
										'resources/image/' + imgArr[idx]);
							});

				});
		$('#item3').click(
				function() {
					$('.mybgColor').attr('class', function() {
						$(this).attr('style', 'background-color:#0d6efd');
					});
					//이미지 세팅하기
					let imgArr = [ 'c1.jpg', 'c2.jpg', 'c3.jpg' ];
					$('.carousel-item > img').each(
							function(idx) {
								console
										.log("바뀔 이미지 :" + imgArr[idx]
												+ ", log Img => "
												+ $(this).attr('src'));
								$(this).attr('src',
										'resources/image/' + imgArr[idx]);
							});
				});
	});
</script>
</head>
<body>
	<header class="text-white text-center">

		<%-- header --%>
		<%-- header 안에 상단 메뉴 컨트럴 : template에  header.jsp 가 적용 되도록 이름을 설정 --%>
		<tiles:insertAttribute name="header" />

		<%-- Carousel --%>
		<tiles:insertAttribute name="carousel" />
	
	</header>

	<%-- menu --%>
	<tiles:insertAttribute name="menu" />

	<!-- menu와 footer영역에는 아무것도 없어야한다. body 외 -->
	<%-- body --%> <%-- body는 jsp파일로 분리하는 것이 아니라 tiles가 불러오는 경로에서 제작한 views/{1}/{2}.jsp가 들어올 자리다. --%>
	<tiles:insertAttribute name="body" />

	<%--footer 시작--%>
	<tiles:insertAttribute name="footer" />

	<script>
		$(function() {
			$('#wbtn').click(function() {
				location = "boardForm";
			});
			$('#wbtn2').click(function() {
				location = "upform";
			});
		});
	</script>
</body>
</html>

