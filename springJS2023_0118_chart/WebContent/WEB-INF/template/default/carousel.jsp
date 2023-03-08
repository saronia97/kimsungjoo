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
				<h3>�������� jQuery ���͵� ����</h3>
				<p>
					<c:choose>
						<c:when test="${sessionScope.sessionName != null}">
									${sessionScope.sessionName}�� �ݰ�����! ���� ������ �ʹ� ���׿�!
						<div class="card">
								<div class="row no-gutters">
									<div class="col-8">
										<div id="map"></div>

									</div>
									<div class="col-4">
										<div class="card-body">
											<h4 class="card-text">jQuery���͵� ����</h4>
											<p class="card-text">���� ��õ�� ���������1�� 151 2�� B���ǽ�</p>
											<button type="button" class="btn btn-dark"
												onclick="alert('Open �غ���!')">jQuery���͵� ���� Ȯ��</button>
										</div>
									</div>
								</div>

							</div>
						</c:when>

						<c:otherwise>
									jQuery �� �̿��Ͽ� �������� �������Ͽ��� �Ʒ� �䱸���״�� �����մϴ�.
									�α����� �ϸ� ��Ҹ� Ȯ�� �� �� �־��
								</c:otherwise>
					</c:choose>
				</p>
			</div>
		</div>
		<div class="carousel-item">
			<%-- image�� ���ǰ��� ���� �����غ��� ����! --%>
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
				<h3>Carousel ����� CSS3��!</h3>
				<c:choose>
					<c:when test="${sessionScope.sessionName != null}">
						<p>${sessionScope.sessionName}�Թݰ�����!���ó������ʹ����׿�!</p>
					</c:when>
					<c:otherwise>
						<p>Thank you, CSS3!</p>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="carousel-item">
			<%-- image�� ���ǰ��� ���� �����غ��� ����! --%>
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
				<h3>UI �䱸���� Ȯ���ϱ�,UI �����ϱ�</h3>
				<p>
					<c:choose>
						<c:when test="${sessionScope.sessionName != null}">
									${sessionScope.sessionName}�� �ݰ�����. ����� �����ϴ� ������ ?
								</c:when>
						<c:otherwise>
									������ ����
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
<%--īī�� Map Api--%>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=66d73ad601e7ed0d5f16e6075dd5a211&libraries=services"></script>

<script>
var mapContainer = document.getElementById('map'), // ������ ǥ���� div  
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
        level: 3 // ������ Ȯ�� ����
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // ������ �����մϴ�
 
// ��Ŀ�� ǥ���� ��ġ�� ������ ������ �ִ� ��ü �迭�Դϴ� 
var positions = [
    {
        content: '<div>īī��</div>', 
        latlng: new kakao.maps.LatLng(33.450705, 126.570677)
    },
    {
        content: '<div>���¿���</div>', 
        latlng: new kakao.maps.LatLng(33.450936, 126.569477)
    },
    {
        content: '<div>�Թ�</div>', 
        latlng: new kakao.maps.LatLng(33.450879, 126.569940)
    },
    {
        content: '<div>�ٸ�����</div>',
        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
    }
];

for (var i = 0; i < positions.length; i ++) {
    // ��Ŀ�� �����մϴ�
    var marker = new kakao.maps.Marker({
        map: map, // ��Ŀ�� ǥ���� ����
        position: positions[i].latlng // ��Ŀ�� ��ġ
    });

    // ��Ŀ�� ǥ���� ���������츦 �����մϴ� 
    var infowindow = new kakao.maps.InfoWindow({
        content: positions[i].content // ���������쿡 ǥ���� ����
    });

    // ��Ŀ�� mouseover �̺�Ʈ�� mouseout �̺�Ʈ�� ����մϴ�
    // �̺�Ʈ �����ʷδ� Ŭ������ ����� ����մϴ� 
    // for������ Ŭ������ ����� ���� ������ ������ ��Ŀ���� �̺�Ʈ�� ��ϵ˴ϴ�
    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
}

// ���������츦 ǥ���ϴ� Ŭ������ ����� �Լ��Դϴ� 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// ���������츦 �ݴ� Ŭ������ ����� �Լ��Դϴ� 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}

</script>