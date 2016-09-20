<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
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
					<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
							<label for="">Email</label>
							<input type="email"
								name='uid' class="form-control" placeholder="Enter Email">
						</div>
						<div class="form-group">
							<label for="">Password</label>
							<input type="password"
								name='upw' class="form-control" placeholder="Enter Password">
						</div>
						<div class="form-group">
							<label for="">PW Check</label>
							<input type="password"
								name='upwcheck' class="form-control" placeholder="check Password">
						</div>
						<div class="form-group">
							<label for="">Sex &nbsp;</label> 
							<label class="radio-inline"><input type="radio" name="sex"> Female</label>
							<label class="radio-inline"><input type="radio" name="sex"> Male</label>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<label for="">User Name</label> <input
								type="text" name="uname" class="form-control">
						</div>
						<div class="form-group">
							<label for="gen">Generation</label>
						      <select class="form-control" id="gen">
						        <c:forEach var="i" begin="1900" end="2016" step="1">
							        <option>${i}</option>
						        </c:forEach>
						      </select>
						</div>
						<div class="form-group">
							<label for="nation">Nationality</label>
							 <select class="form-control" id="nation">
							 	<c:forTokens var="ii" items="ASIA,EUROPE.AFRICA.NORTH AMERICA.SOUTH AMERICA.OCEANIA" delims=",.">
							 	 <option>${ii}</option>
							 	</c:forTokens>
						      </select>
						</div>
					</div>
					</div>
					</div>

					<!-- /.box-body -->

					<div class="box-footer">
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