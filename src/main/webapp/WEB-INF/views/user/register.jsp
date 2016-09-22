<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>register.jsp</title>
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
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

				<form role="form" method="post">
					<div class="box-body">
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label for="">ID</label>
									<div class="row">
										<div class="col-md-10">
											<input type="text" name='uid' id="uid" class="form-control"
												placeholder="Enter ID">
										</div>
										<input type="button" id="iddc" value="check" />
									</div>
								</div>
								<div class="form-group">
									<label for="">Password</label> <input type="password"
										name='upw' class="form-control" placeholder="Enter Password">
								</div>
								<div class="form-group">
									<label for="">PW Check</label> <input type="password"
										name='upwcheck' class="form-control"
										placeholder="check Password">
								</div>
								<div class="form-group">
									<label for="">Sex &nbsp;</label> <label class="radio-inline"><input
										type="radio" name="sex"> Female</label> <label
										class="radio-inline"><input type="radio" name="sex">
										Male</label>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label for="">E-mail</label> <input type="email" name="uname"
										class="form-control" placeholder="Enter Email">
								</div>
								<div class="form-group">
									<label for="bir">Birth Year</label> <select
										class="form-control" id="bir">
										<c:forEach var="i" begin="1900" end="2016" step="1">
											<option>${i}</option>
										</c:forEach>
									</select>
								</div>
								<div class="form-group">
									<label for="cont">Continent</label> <select
										class="form-control" id="cont">
										<c:forTokens var="ii"
											items="ASIA,EUROPE.AFRICA.NORTH AMERICA.SOUTH AMERICA.OCEANIA"
											delims=",.">
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
	<script>
		$("#iddc").on("click", function() {

			alert("iddc clicked...");
			var uidl = $("#uid");
			var uidll = uidl.val();
			
			$.ajax({
				type : 'get',
				url : '/check/dup?uid=' + uidll,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "GET"
				},
				success : function(result) {
					if (result == 'SUCCESS') {
						alert("avaluable");
					}
				}
			});
		});
	</script>
</body>
</html>