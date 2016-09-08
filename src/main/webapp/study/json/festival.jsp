<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>festival.jsp</title>
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
		</tr>
	</thead>
	<tbody id="result"></tbody>
	</table>
	<img alt="" src="">
</div>


<script id="codeTemp" type="text/xxx-mytemplate">
	{{#each .}}
	<tr>
		<td><img src="{{firstimage}}" style="width:300px; height:300px;"></td>
		<td>{{title}}</td>
		<td>{{addr1}}</td>
		<td>{{tel}}</td>
	</tr>
	{{/each}}
</script>

<script type="text/javascript">

	var serviceKey = "oMYSCkfnU%2BrM%2F6ad8zAICkGBj0eUCOxJc9bR%2F8MHuzhfo62P6cGA1YVZ7iY5QnDedVyfk5tMhc0Wu42fjDJ%2BcA%3D%3D";
	
	$('button').eq(0).on('click', function() {
		$.getJSON("http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=" + serviceKey + "&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=TestApp&_type=json", function(areaCode) {
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