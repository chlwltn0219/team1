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

				<form role="form" method="post" onsubmit="">
					<div class="box-body">
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label for="">ID</label>
									<div class="row">
										<div class="col-md-10">
											<input type="text" name='uid' id="uid" class="form-control" required
												placeholder="Enter ID">
										</div>
										<input type="button" id="iddc" value="check" />
									</div>
								</div>
								<div class="form-group">
									<label for="">Password</label> <input type="password" required
										name='upw' class="form-control" placeholder="Enter Password">
								</div>
								<div class="form-group">
									<label for="">PW Check</label> <input type="password" required
										name='upwcheck' class="form-control"
										placeholder="check Password">
								</div>
								<div class="form-group">
									<label for="">Sex &nbsp;</label> <label class="radio-inline"><input
										required type="radio" name="sex"> Female</label> <label
										class="radio-inline"><input type="radio" name="sex" required>
										Male</label>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label for="">E-mail</label> <input type="email" name="uname" required
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

			var uidl = $("#uid");
			var uidll = uidl.val();
			
			$.getJSON("/check/dup?uid=" + uidll, function(data) {
				var IDchecking = data.IDchecking;
				if (IDchecking) {
					alert("만들 수 있습니다.");	
				} else {
					alert("만들 수 없습니다.");
				}
			 	
			});	
// 			$.ajax({
// 				type : 'get',
// 				url : '/check/dup?uid=' + uidll,
// 				headers : {
// 					"Content-Type" : "json",
// 					"X-HTTP-Method-Override" : "GET"
// 				},
// 				success : function(data, textStatus) {
// 					alert(textStatus)
// 				}
// 			});
		});
	</script>
</body>
</html>