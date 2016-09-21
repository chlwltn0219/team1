<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link href="/resources/css/fRead.css" rel="stylesheet" type="text/css" />

</head>
<body>
<!-- <button id="json" class="btn btn-primary">getJSON form Open API</button> -->
<!-- <label><input type="date" id="start"></label> -->
<!-- <label><input type="date" id="stop"></label> -->
<!-- <input type="text" id="find"> -->


<div class="table-responsive">
	<table class="table table-hover">
	<thead id="result">
	</thead>
	<tbody id="result1"></tbody>
	<tbody id="result2"></tbody>
	</table>
</div>

<script id="codeTemp1" type="text/xxx-mytemplate">
<br>
		<ul>	
			<li>행사 기간</li>
<br>
				<div>{{eventstartdate}}~{{eventenddate}}</div>
		</ul>	
</script>
<script id="codeTemp" type="text/xxx-mytemplate">
<br>
	<div class="title">{{title}}</div>
<br>
<hr>
	<div>
		<img class="firstimg" src="{{firstimage}}">
	</div>
<br>
<hr>
<ul>
	<li>전화번호</li><br>
		<p>{{tel}}</p>
	<li>주소</li><br>
		<p>{{addr1}}{{addr2}} <button style="font-size:15px">Map</button></p>
	<br>
	<li>상세 페이지</li><br>
		<p id="homepage"></p><br>
	<li>개요</li><br>
		<p id="overview"></p>
	</ul>
</script>

<script type="text/javascript">
	$.getJSON("/detail/common?contentId=" + "${contentid}", function(data) {
		console.dir(data);
		
		var items = data.items.item;
		console.dir(items);
		
		var temp2 = $('#codeTemp').html();
		var template = Handlebars.compile(temp2);
		var html = template(items);
		
		$('#result').html(html);
		$('#overview').html(items.overview);
		$('#homepage').html(items.homepage);
		

		
	var typeId = items.contenttypeid;
	$.getJSON("/detail/intro?contentId=" + "${contentid}" + "&contentTypeId=" + typeId, function(data) {
		console.dir(data);
		
		var items = data.items.item;
		console.dir(items);
		
		var temp2 = $('#codeTemp1').html();
		var template = Handlebars.compile(temp2);
		var html = template(items);
		
		$('#result1').html(html);

	});
});
</script>
</body>
</html>