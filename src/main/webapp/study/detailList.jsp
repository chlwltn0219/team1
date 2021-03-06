<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- CSS -->
<link href="/resources/css/place2.css" rel="stylesheet" type="text/css" />

<title>SINAE_Detail.jsp</title>
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Font Awesome Icons -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<!-- jQuery 2.1.4 -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- HandleBars -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
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

				<div class="container">
					<h2>Modal Example</h2>
					<!-- Trigger the modal with a button -->
					<button id="btn" type="button" class="btn btn-info btn-lg"
						data-toggle="modal" data-target="#myModal">Open Modal</button>

					<!-- Modal -->
					<div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog">

							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">Modal Header</h4>
								</div>
								<div class="modal-body">
										여기에 지도가 떠야해
								<div id="map" style="width:100%; height: 400px"></div>								
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
								</div>
							</div>

						</div>
					</div>

				</div>
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
						<li><b>소개 : </b> <br><br> <p id="overview" class="detailtext"></p></li><br>
						<li><b>주소 : </b> <p class="detailtext"> {{addr1}}&nbsp;&nbsp;&nbsp;<a href="http://www.w3schools.com"><img src="/resources/img/location.png" style="width:25px; height:25px;"></a></p></li>
						<li><b>홈페이지 : </b> <p class="detailtext" id="homepage"></p></li><br>
					</ul>
				</p>
			</div>
	</script>

	<script type="text/javascript">
		var serviceKey = "oMYSCkfnU%2BrM%2F6ad8zAICkGBj0eUCOxJc9bR%2F8MHuzhfo62P6cGA1YVZ7iY5QnDedVyfk5tMhc0Wu42fjDJ%2BcA%3D%3D";

		
		
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
							var mapzoom = items.mlevel;
							var title = items.title;

							//x,y값 items에서 가져와 적용 
							initMap(items.mapx, items.mapy);

							var temp2 = $('#codeTemp').html();
							var template = Handlebars.compile(temp2);

							var html = template(items);

							$('#result').html(html);
							$('#overview').html(items.overview);
							$('#homepage').html(items.homepage);
							
							

							function initMap(x, y) {
								var map_center = {
									lat : y,
									lng : x
								};

								// Create a map object and specify the DOM element for display.
								var map = new google.maps.Map(document
										.getElementById('map'), {
									center : map_center,
									scrollwheel : false,
									zoom : mapzoom + 10
								});

								// Create a marker and set its position.
								var marker = new google.maps.Marker({
									map : map,
									position : map_center,
									title : title
								});
							}

						});
	</script>



</body>
</html>