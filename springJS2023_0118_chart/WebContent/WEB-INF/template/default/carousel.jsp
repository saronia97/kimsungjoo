<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style>
.card {
	margin-bottom: 5%;
	min-height: 200px;
}

.card-caption h4 {
	margin-bottom: 8px;
	font-style: bold;
}

.card button {
	margin-top: 16px;
}

.card-text {
	margin: 8px 0;
	color: #232323;
}

#map {
	display: flex;
	width: 100%;
	min-height: 300px;
	height: 100%;
}
</style>

<div id="demo" class="carousel slide" data-bs-ride="carousel">
	<!-- Indicators/dots -->
	<div class="carousel-indicators">
		<button type="button" data-bs-target="#demo" data-bs-slide-to="0"
			class="active"></button>
		<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
		<button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
	</div>

	<!-- The slideshow/carousel -->
	<div class="carousel-inner">
		<div class="carousel-item active">
			<c:choose>
				<c:when test="${sessionScope.sessionName == null}">
					<c:set var="imgv3" value="d1.jpg" />
				</c:when>
				<c:otherwise>
					<c:set var="imgv3" value="d4.png" />
				</c:otherwise>
			</c:choose>
			<img
				src="${pageContext.request.contextPath}/web/resources/image/${imgv3}"
				alt="Kosmo113" class="d-block" style="width: 100%">
			<div class="carousel-caption">
				<h3>오프라인 jQuery 스터디 모임</h3>
				<p>
					<c:choose>
						<c:when test="${sessionScope.sessionName != null}">
									${sessionScope.sessionName}님 반가워요! 오늘 날씨가 너무 좋네요!
						<div class="card">
								<div class="row no-gutters">
									<div class="col-8">
										<div id="map"></div>

									</div>
									<div class="col-4">
										<div class="card-body">
											<h4 class="card-text">jQuery스터디 모임</h4>
											<p class="card-text">서울 금천구 가산디지털1로 151 2층 B강의실</p>
											<button type="button" class="btn btn-dark"
												onclick="alert('Open 준비중!')">jQuery스터디 모임 확인</button>
										</div>
									</div>
								</div>

							</div>
						</c:when>

						<c:otherwise>
									jQuery 를 이용하여 제공받은 샘플파일에서 아래 요구사항대로 구현합니다.
									로그인을 하면 장소를 확인 할 수 있어요
								</c:otherwise>
					</c:choose>
				</p>
			</div>
		</div>
		<div class="carousel-item">
			<%-- image를 세션값에 따라 변경해보는 데모! --%>
			<c:choose>
				<c:when test="${sessionScope.sessionName == null}">
					<c:set var="imgv3" value="d2.jpg" />
				</c:when>
				<c:otherwise>
					<c:set var="imgv3" value="d4.png" />
				</c:otherwise>
			</c:choose>
			<img
				src="${pageContext.request.contextPath}/web/resources/image/${imgv3}"
				alt="Carousel" class="d-block" style="width: 100%">
			<div class="carousel-caption">
				<h3>Carousel 기능을 CSS3로!</h3>
				<c:choose>
					<c:when test="${sessionScope.sessionName != null}">
						<p>${sessionScope.sessionName}님반가워요!오늘날씨가너무좋네요!</p>
					</c:when>
					<c:otherwise>
						<p>Thank you, CSS3!</p>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="carousel-item">
			<%-- image를 세션값에 따라 변경해보는 데모! --%>
			<c:choose>
				<c:when test="${sessionScope.sessionName == null}">
					<c:set var="imgv3" value="d3.jpg" />
				</c:when>
				<c:otherwise>
					<c:set var="imgv3" value="d4.png" />
				</c:otherwise>
			</c:choose>
			<img
				src="${pageContext.request.contextPath}/web/resources/image/${imgv3}"
				alt="Carousel" class="d-block" style="width: 100%">
			<div class="carousel-caption">
				<h3>UI 요구사항 확인하기,UI 설계하기</h3>
				<p>
					<c:choose>
						<c:when test="${sessionScope.sessionName != null}">
									${sessionScope.sessionName}님 반가워요. 당신이 좋아하는 선물은 ?
								</c:when>
						<c:otherwise>
									오늘의 날씨
								</c:otherwise>
					</c:choose>
				</p>
				<p></p>
			</div>
		</div>
	</div>

	<!-- Left and right controls/icons -->
	<button class="carousel-control-prev" type="button"
		data-bs-target="#demo" data-bs-slide="prev">
		<span class="carousel-control-prev-icon"></span>
	</button>
	<button class="carousel-control-next" type="button"
		data-bs-target="#demo" data-bs-slide="next">
		<span class="carousel-control-next-icon"></span>
	</button>
</div>
<%--카카오 Map Api--%>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=66d73ad601e7ed0d5f16e6075dd5a211&libraries=services"></script>

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
var positions = [
    {
        content: '<div>카카오</div>', 
        latlng: new kakao.maps.LatLng(33.450705, 126.570677)
    },
    {
        content: '<div>생태연못</div>', 
        latlng: new kakao.maps.LatLng(33.450936, 126.569477)
    },
    {
        content: '<div>텃밭</div>', 
        latlng: new kakao.maps.LatLng(33.450879, 126.569940)
    },
    {
        content: '<div>근린공원</div>',
        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
    }
];

for (var i = 0; i < positions.length; i ++) {
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng // 마커의 위치
    });

    // 마커에 표시할 인포윈도우를 생성합니다 
    var infowindow = new kakao.maps.InfoWindow({
        content: positions[i].content // 인포윈도우에 표시할 내용
    });

    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
}

// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}

</script>