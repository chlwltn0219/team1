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

<style type="text/css">

.temp{
	float: left;
	position: relative;
	margin: 2.9%;
}

.img, .info{
	width: 300px;
	height:300px;
	float:left; 
	
}

.img{
	z-index: 50;
}

.info{
	opacity : 0.7;
	background-color : white;
	position : absolute;
	display : none;
	z-index : 100;
}

.info * {
	padding : 1px 5px;
}

</style>
</head>
<body>
<!-- <button id="json" class="btn btn-primary">getJSON form Open API</button> -->
<!-- <label><input type="date" id="start"></label> -->
<!-- <label><input type="date" id="stop"></label> -->
<!-- <input type="text" id="find"> -->


<div class="table-responsive">
	<table class="table table-hover">
	<thead>
		<tr>
		</tr>
		<tr>
<!-- 			<td><img src="{{firstimage}}"> -->
		</tr>
	</thead>
	<tbody id="result"></tbody>
	</table>
</div>


<script id="codeTemp" type="text/xxx-mytemplate">
	<tr>
		<td>{{title}}</td>
	</tr>
	<tr>
		<td><img src="{{firstimage}}"></td>
	</tr>
	<tr>
		<td>{{addr1}}{{addr2}}</td>
	</tr>
	<tr>
		<td>{{tel}}</td>
	</tr>
	<tr>
		<td>{{eventstartdate}}~{{eventenddate}}</td>
	</tr>
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
			imgCheck();
		
// 		for(var i=0; i<items.length; i++) {
// 			var html = template(items[i]);
// 			console.log(html);
// 			$('#result').append(html);
// 			imgHover();
// 		}

		function imgCheck() {
			if($('div.abc img').eq().attr('src')=='')
				$('div.abc img').eq().attr('src','/resources/img/no-image.jpg');
		};
	});
</script>
</body>
</html>