<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminLTE 2 | Log in</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<!-- Bootstrap 3.3.4 -->
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	  type="text/css" />
<!-- Font Awesome Icons -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	  rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet"
	  type="text/css" />
<!-- jQuery 2.1.4 -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- HandleBars -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

  </head>
<style>

#loginBox {
	hieght: 100%;
}

</style>
</head>

<body class="login-page">
	<div class="login-box" id="loginBox">
		<div class="login-logo">
			<a href="/"><b>Team1 2nd</b>Project</a>
		</div>
		<!--<div class="login-box-body"> -->
		<div>
			<p class="login-box-msg input-lg">Log in to Seoul Tour</p>

			<form action="/user/loginPost" method="post">
				<div class="form-group has-feedback">
					<input type="text" name="uid" class="form-control" placeholder="ID" />
					<span class="glyphicon glyphicon-globe form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" name="upw" class="form-control" placeholder="Password" />
					<span class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="row">
					<div class="col-xs-8 input-lg">
						<a href="/user/register" class="text-center">Sign up now</a>
					</div>
					<!-- /.col -->
					<div class="col-xs-4 input-lg">
						<button type="submit" class="btn btn-success btn-block btn-flat">Sign In</button>					</div>
					<!-- /.col -->
				</div>
			</form>

			<button id="btn1" class="btn btn-info" style="width:100%">Preview</button>
			<div class="table-responsive">
			<table class="table table-hover">
				<tbody id="result"></tbody>
			</table>
			</div>
			<script id="preview" type="text/xxx-mytemplate">
			{{#each .}}
				<tr>	
					<td><img id="img1" onclick="disappearImg()" class="img-responsive img-circle" style="width:100%" src="{{firstimage}}"/></td>
				</tr>
			{{/each}}
			</script>
		</div>
		<!-- /.login-box-body -->
	</div>
	<!-- /.login-box -->
	<script type="text/javascript">
	
	var serviceKey = "msIAbKVe7I8wGXfBFqvMDC3oIM1g4Yqjub91VLdltRRso40CBt8HrC4tM8L4DXKKduY4aB6qOgtO4FCyOhPnMA%3D%3D";
	
	$('#btn1').eq(0).on('click', function() {
		var ran1 = Math.floor((Math.random() * 5) + 1);
		var ran2 = Math.floor((Math.random() * 5) + 1);
		$.getJSON("http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=" + serviceKey + "&areaCode=1&numOfRows=" + ran1 + "&pageNo=" + ran2 + "&MobileOS=ETC&MobileApp=TestApp&_type=json", function(areaCode) {
			console.dir(areaCode);
			console.log(areaCode);
			console.log(areaCode.response);
			console.log(areaCode.response.body);
			console.log(areaCode.response.body.items);
			console.log(areaCode.response.body.items.item);
			var items = areaCode.response.body.items.item;
			var temps = $('#preview').html();
			var template = Handlebars.compile(temps);
			var html = template(items);
			console.log(html);
			$('#result').html(html);
		});
	});
	function disappearImg() {
		$('#result').html("");
	}


</script>
</body>
</html>