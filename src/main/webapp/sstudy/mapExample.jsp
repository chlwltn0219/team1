<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<html>
<head>
<!-- CSS -->
<link href="/resources/css/place2.css" rel="stylesheet" type="text/css" />
<!-- Google map marker -->
<link rel="stylesheet" href="/maps/documentation/javascript/demos/demos.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SINAE_Detail.jsp</title>
<!-- Bootstrap 3.3.4 -->
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<!-- Font Awesome Icons -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<!-- jQuery 2.1.4 -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- HandleBars -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<!-- GoogoleMap Asynchronously Loading the API ********************************************* -->
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAA4WMo8DvHp--izPUaJTqHDV0wJotTBpc&callback=initMap"></script>

</head>

<body>

	<div class="row">
		<div class="col-md-12">
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">
						<b>상세보기</b>
					</h3>
				</div>
				<hr>
				<div id="result"></div>
				<div id="map" style="width: 80%; height: 400px"></div>
			</div>
		</div>
	</div>


			
			
<script id="codeTemp" type="text/xxx-mytemplate">
			<div class="centered">
				<h2>{{title}}</h2><br>
				<img class="img1" src="{{firstimage}}">
			</div>
			<div class="detail">
				<p>
					<ul>
						<li><b>{{tltle}} 소개 : </b> <br><br> <p class="detailtext">{{overview}}</p></li><br>
						<li><b>주소 : </b> <p class="detailtext"> {{addr1}}&nbsp;&nbsp;&nbsp;<a href="http://www.w3schools.com"><img src="/resources/img/location.png" style="width:25px; height:25px;"></a></p></li>
					</ul>
				</p>
			</div>


</script>

	<script type="text/javascript">
		var serviceKey = "oMYSCkfnU%2BrM%2F6ad8zAICkGBj0eUCOxJc9bR%2F8MHuzhfo62P6cGA1YVZ7iY5QnDedVyfk5tMhc0Wu42fjDJ%2BcA%3D%3D";

		var sigunguCode = $('#gu option:selected').val();

		$.getJSON(
						"http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey="

								+ serviceKey
								+ "&contentId=126508"
								+ "&defaultYN=Y"
								+ "&addrinfoYN=Y"
								+ "&firstImageYN=Y"
								+ "&areacodeYN=Y"
								+ "&overviewYN=Y"
								+ "&mapinfoYN=Y"
								+ "&MobileOS=ETC" + "&MobileApp=TestApp",

						function(areaCode) {
							// json 객체 내부 접근하기
							var items = areaCode.response.body.items.item;
// 							alert(items.mapx + "\n" + items.mapy);
							initMap(items.mapx, items.mapy);
							
							var temp2 = $('#codeTemp').html();
							var template = Handlebars.compile(temp2);

							// "<br />" ==> ""   /<br\s\/>/g, ""
							items.overview = items.overview.replace(/<br\s\/>/g, "");
							items.overview = items.overview.replace(/<br>/g, "");

							var html = template(items);

							$('#result').html(html);
						});
	</script>

<script type="text/javascript">
// 	var map;
// 	var marker;
// 	function initMap() {
// 		map = new google.maps.Map(document.getElementById('map'), {
// 			center : {
// 				lat : 36.322473,
// 				lng : 127.412501
// 			},
// 			zoom : 18,
// 			mapTypeId : google.maps.MapTypeId.ROADMAP
// 		});

// 		// 마커로 사용할 이미지 주소
// 		var image = new google.maps.MarkerImage(
// 				'http://www.larva.re.kr/home/img/boximage3.png','', new google.maps.Size(60, 60));

// 		marker = new google.maps.Marker({
// 			center : {
// 				lat : 36.322473,
// 				lng : 127.412501
// 			},
// 			map : map,
// 			icon : image, // 마커로 사용할 이미지(변수)
// 		});
// 	}
	

	function initMap(x, y) {
		var map_center = {
			lat : y,
			lng : x
		};

		// Create a map object and specify the DOM element for display.
		var map = new google.maps.Map(document.getElementById('map'), {
			center : map_center,
			scrollwheel : false,
			zoom : 15
		});

		// Create a marker and set its position.
		var marker = new google.maps.Marker({
			map : map,
			position : map_center,
			title : 'Event Location'
		});
	}

	// 	function initialize() {
	// 		var mapLocation = new google.maps.LatLng(36.322473, 127.412501); // 지도에서 가운데로 위치할 위도와 경도
	// 		var markLocation = new google.maps.LatLng(36.322473, 127.412501); // 마커가 위치할 위도와 경도

	// 		var mapOptions = {
	// 			center : mapLocation, // 지도에서 가운데로 위치할 위도와 경도(변수)
	// 			zoom : 18, // 지도 zoom단계
	// 			mapTypeId : google.maps.MapTypeId.ROADMAP
	// 		};
	// 		var map = new google.maps.Map(document.getElementById("map-canvas"), // id: map-canvas, body에 있는 div태그의 id와 같아야 함
	// 		mapOptions);

	// 		var size_x = 60; // 마커로 사용할 이미지의 가로 크기
	// 		var size_y = 60; // 마커로 사용할 이미지의 세로 크기

	// 		// 마커로 사용할 이미지 주소
	// 		var image = new google.maps.MarkerImage(
	// 				'http://www.larva.re.kr/home/img/boximage3.png',

	// 				'', new google.maps.Size(size_x, size_y));

	// 		var marker;
	// 		marker = new google.maps.Marker({
	// 			position : markLocation, // 마커가 위치할 위도와 경도(변수)
	// 			map : map,
	// 			icon : image, // 마커로 사용할 이미지(변수)
	// 			//             info: '말풍선 안에 들어갈 내용',
	// 			title : '서대전네거리역이지롱~' // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
	// 		});

	// 		var content = "이곳은 서대전네거리역이다! <br/> 지하철 타러 가자~"; // 말풍선 안에 들어갈 내용

	// 		// 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
	// 		var infowindow = new google.maps.InfoWindow({
	// 			content : content
	// 		});

	// 		google.maps.event.addListener(marker, "click", function() {
	// 			infowindow.open(map, marker);
	// 		});

	// 	}
	// 	google.maps.event.addDomListener(window, 'load', initialize);
</script>

</body>
</html>