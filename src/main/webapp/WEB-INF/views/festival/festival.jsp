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
</head>
<body>
<!-- <button id="json" class="btn btn-primary">getJSON form Open API</button> -->
<!-- <button id="clear" class="btn btn-info">clear</button> -->
<input type="text" id="find">
<button id="findbtn" class="btn btn-info">find</button>
<select id="startdate">
	<option value=""></option>
</select>
<select id="enddate"></select>

<div class="table-responsive">
	<table class="table table-hover">
	<thead>
		<tr>
			<th>썸네일</th>
			<th>타이틀</th>
			<th>주소</th>
			<th>전화번호</th>
			<th>행사 시작일</th>
			<th>행사 종료일</th>
			
		</tr>
	</thead>
	<tbody id="result"></tbody>
	</table>
</div>

<script id="codeTemp" type="text/xxx-mytemplate">
	<tr>
		<td><img src="{{firstimage2}}" style="width:300px; height:300px;"></td>
		<td>{{title}}</td>
		<td>{{addr1}}</td>
		<td>{{tel}}</td>
		<td>{{eventstartdate}}</td>
		<td>{{eventenddate}}</td>
	</tr>
</script>

<script type="text/javascript">
		$.getJSON("/festival/list", function(data) {
			// json 객체 내부 접근하기
			console.dir(data);
			
			var items = data.items.item;
			
			var temp2 = $('#codeTemp').html();
			var template = Handlebars.compile(temp2);
			
			$('#result').html("");
			
			for(var i=0; i<items.length; i++) {
				var html = template(items[i]);
				console.log(html);
				$('#result').append(html);
			}
			
		});
</script>
</body>
</html>