<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>FRead.jsp</title>
</head>
<body>
<div class="table-responsive">
	<table class="table table-hover">
	<thead>
		<tr>
			<th>타이틀</th>
			<th>주소</th>
			<th>행사기간</th>
			<th>위치</th>
			<th>전화번호</th>
		</tr>
	</thead>
	<tbody id="result"></tbody>
	</table>
</div>

<script id="codeTemp" type="text/xxx-mytemplate">
{{#each .}}
	<tr>
		<td>{{title}}</td>
		<td>{{addr1}}</td>
		<td>{{eventstartdate}}</td>
		<td>{{mapx}}</td>
		<td>{{tel}}</td>
	</tr>
	{{/each}}
</script>

<script type="text/javascript">
		
		$.getJSON("/festival/read", function(data) {
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
				imgCheck(i);
				imgHover()
			}
	});
</script>
</body>
</html>