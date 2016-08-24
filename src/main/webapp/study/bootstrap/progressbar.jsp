<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>template.jsp</title>
<!-- Bootstrap 3.3.4 -->
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<!-- Font Awesome Icons -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!-- jQuery 2.1.4 -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
</head>
<body>
	<div class="container">
	
		<div class="row">
			<h2>Basic Progress Bar</h2>
			<div class="progress">
				<div class="progress-bar" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width: 70%">
					<span class="sr-only">70% Complete</span>
				</div>
			</div>
		</div>
	
		<div class="row">
			<h2>Colored Progress Bar</h2>
			<div class="progress">
				<div class="progress-bar progress-bar-success"  style="width: 40%"
					 role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100">
					40% Complete (success)
				</div>
			</div>
	
			<div class="progress">
				<div class="progress-bar progress-bar-info" style="width: 50%">
					50% Complete (info)			
				</div>
			</div>
			
			<div class="progress">
				<div class="progress-bar progress-bar-warning" style="width: 60%">
					60% Complete (warning)
				</div>
			</div>
			
			<div class="progress">
				<div class="progress-bar progress-bar-danger" style="width: 70%">
					70% Complete (danger)
				</div>
			</div>
		</div>
	
		<div class="row">
			<h2>Striped Progress Bar</h2>
			<div class="progress">
				<div class="progress-bar progress-bar-success progress-bar-striped" style="width: 40%">
					40% Complete (success, striped)
				</div>
			</div>
			
			<div class="progress">
				<div class="progress-bar progress-bar-info progress-bar-striped" style="width: 50%">
					50% Complete (info, striped)
				</div>
			</div>
			
			<div class="progress">
				<div class="progress-bar progress-bar-warning progress-bar-striped" style="width: 60%">
					60% Complete (warning, striped)
				</div>
			</div>
			
			<div class="progress">
				<div class="progress-bar progress-bar-danger progress-bar-striped" style="width: 70%">
					70% Complete (danger, striped)
				</div>
			</div>
		</div>
	
		<div class="row">
			<h2>Animated Progress Bar</h2>
			<div class="progress">
				<div class="progress-bar progress-bar-striped active" style="width: 40%">
					40%
				</div>
			</div>
		</div>
		
		<div class="row">
			<h2>Stacked Progress Bars</h2>
			<div class="progress">
				<div class="progress-bar progress-bar-success progress-bar-striped active" style="width: 40%">
					Free Space
				</div>
				<div class="progress-bar progress-bar-warning progress-bar-striped active" style="width: 10%">
					Warning
				</div>
				<div class="progress-bar progress-bar-danger progress-bar-striped active" style="width: 20%">
					Danger
				</div>
			</div>
		</div>

	</div>
	<!-- /.container -->
</body>
</html>