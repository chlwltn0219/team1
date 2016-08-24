<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>progress.jsp</title>
<!-- Bootstrap 3.3.4 -->
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<!-- Font Awesome Icons -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!-- jQuery 2.1.4 -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- Handlebar -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>

<script id="template" type="text/x-handlebars-template">
	<div class="progress-bar progress-bar-striped active" style="width: {{progress}}%">
		{{progress}}%
	</div>
</script>

<script type="text/javascript">

	$(document).ready(function() {
		
		var template = $('#template').html();
		var ctemplate = Handlebars.compile(template);
		var html;
		
		$('#start').on('click', function() {
			
				
			for(var i=0; i<=110; i=i+Math.random()*5) {
				if(i>100) i=100;
				
				var prog = {
						progress : i
				};
				
				html = ctemplate(prog);
				$('#progress').html(html);
				
				if(i==100) break;
			}
						
		});
		
		
	});
</script>

<h1>Random Progress Bar</h1>
<div id="progress" class="progress">
</div>

<button id="start">START</button>

</body>
</html>