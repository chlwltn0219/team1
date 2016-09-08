<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>register.jsp</title>
</head>
<body>

	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">REGISTER BOARD</h3>
				</div>
				<!-- /.box-header -->

				<form id='registerForm' role="form" method="post">
					<div class="box-body">
						<div class="form-group">
							<label for="exampleInputEmail1">Email</label> <input type="text"
								name='uid' class="form-control" placeholder="Enter Email">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Password</label>
							<input type="password"
								name='upw' class="form-control" placeholder="Enter Password">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">User Name</label> <input
								type="text" name="uname" class="form-control">
						</div>

					</div>

					<!-- /.box-body -->

					<div class="box-footer">
						<div>
							<hr>
						</div>

						<ul class="mailbox-attachments clearfix uploadedList">
						</ul>

						<button type="submit" class="btn btn-primary">Submit</button>

					</div>
				</form>


			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->

	<script type="text/javascript" src="/resources/js/upload.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<script id="template" type="text/x-handlebars-template"></script>
	<script>
		var template = Handlebars.compile($("#template").html());
		$("#registerForm").submit(
				function(event) {
					event.preventDefault();

					var that = $(this);

					var str = "";

					that.append(str);

					that.get(0).submit();
				});
	</script>
</body>
</html>