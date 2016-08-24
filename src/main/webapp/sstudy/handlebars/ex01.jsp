<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01.jsp</title>

<!-- Handlebar -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script id="mytemplate" type="text/x-handlebars-template">
	<li><i class="fa {{shape}} {{spin}}"></i>{{empno}} {{ename}} {{loc}}</li>
</script>

</head>
<body>

	<button id="btn1" class="btn btn-primary">append</button>
	<ol id="emps"></ol>

<script type="text/javascript">
	$("#btn1").on('click', function() {
// 		alert('aaaaa');
		var template = $('#mytemplate');
		
// 		template.html() ~ template 내부의 html 문자열을 가져옴
		var ctemplate = Handlebars.compile(template.html());
		
		var emp = {
			shape : "fa-comments",
			spin  : "fa-spin",
			empno : 10,
			ename : "hong",
			loc   : "seoul"
		};
		
		var html = ctemplate(emp);
		
// 		$('#emps').html(html);
// 		$('#emps').after(html);
		$('#emps').append(html);
	});
</script>

</body>
</html>