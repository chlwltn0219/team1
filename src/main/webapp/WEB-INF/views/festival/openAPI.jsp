<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>openAPI.jsp</title>
<!-- Bootstrap 3.3.4 -->
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<!-- Font Awesome Icons -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!-- jQuery 2.1.4 -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- HandleBars -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
<h1>open API로 부터 JSON 호출 및 결과 객체 출력</h1>
<h1>예제 : 관광정보 조회하기</h1>
<ol>
	<li>요청 URL : http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList</li>
	<li>
		<h1>요청 메시지</h1>
		<ol>
			<li>ServiceKey : oMYSCkfnU%2BrM%2F6ad8zAICkGBj0eUCOxJc9bR%2F8MHuzhfo62P6cGA1YVZ7iY5QnDedVyfk5tMhc0Wu42fjDJ%2BcA%3D%3D</li>
			<li>numOfRows : 한 페이지 결과 수</li>
			<li>pageNo : 페이지 번호</li>
			<li>MobileOS : OS 구분</li>
			<li>MobileApp : 서비스명</li>
			<li>areaCode : 지역코드</li>
			<li>_type : 요청 문서</li>
			<li>요청 url 예시 : http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?ServiceKey=[서비스키]&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=TestApp&_type=json</li>
		</ol>
	</li>
	<li>
		<h1>응답 메시지</h1>
		<ol>
			<li>code : 지역코드  or 시군구 코드</li>
			<li>name : 지역명 or 시군구명</li>
			<li>rnum : 일련번호</li>
		</ol>
	</li>
</ol>
<hr>

<h1>호출 결과 보기</h1>
<button class="btn btn-primary">getJSON form Open API</button>
<button id="clear" class="btn btn-info">clear</button>
<input type="text" id="find">
<button id="findbtn" class="btn btn-info">find</button>

<div class="table-responsive">
	<table class="table table-hover">
	<thead>
		<tr>
			<th>이미지</th>
			<th>타이틀</th>
			<th>주소</th>
			<th>전화번호</th>
			<th>ID</th>
		</tr>
	</thead>
	<tbody id="result"></tbody>
	</table>
</div>


<script id="codeTemp" type="text/xxx-mytemplate">
	{{#each .}}
	<tr>
		<td>{{firstimage}}</td>
		<td>{{title}}</td>
		<td>{{addr1}}{{addr2}}</td>
		<td>{{tel}}</td>
		<td>{{contentid}}</td>
	</tr>
	{{/each}}
</script>

<script type="text/javascript">

	var serviceKey = "oMYSCkfnU%2BrM%2F6ad8zAICkGBj0eUCOxJc9bR%2F8MHuzhfo62P6cGA1YVZ7iY5QnDedVyfk5tMhc0Wu42fjDJ%2BcA%3D%3D";
	
	$('button').eq(1).on('click', function() {
		$.getJSON("http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=" + serviceKey + "&areaCode=1&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=TestApp&_type=json", function(areaCode) {
			// json 객체 내부 접근하기
			console.dir(areaCode);
			console.log(areaCode);
			console.log(areaCode.response);
			console.log(areaCode.response.body);
			console.log(areaCode.response.body.items);
			console.log(areaCode.response.body.items.item);
			
			var items = areaCode.response.body.items.item;
			
			var temp2 = $('#codeTemp').html();
			var template = Handlebars.compile(temp2);
			
			var html = template(items);
			console.log(html);
			
			$('#result').html(html);
			
		});
	});
	
	$('#clear').on('click', function() {
		$('#result').html("");
	});

</script>
</body>
</html>

