<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
<title>register.jsp</title>
<link rel="stylesheet"
	type="text/css" />
</head>
<body>

	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title input-lg">
					Join us
					</h3>
				</div>
				<!-- /.box-header -->

				<form name="myForm" role="form" method="post" onsubmit="return validateForm()">
					<div class="box-body">
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label for="">ID</label>
									<div class="row">
										<div class="col-md-9">
											<input type="text" name='uid' id="uid" class="form-control input-lg"
											onfocus="doubleCheck()" required placeholder="Enter ID" />
										</div>
										<div class="col-md-3">
											<input type="button" id="iddc" name="niddc" value="check"
											class="btn btn-primary input-lg"/>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="">Password</label>
										<input type="password" required pattern="(?=.*\d)(?=.*[A-Za-z]).{8,}" 
										title="Must contain at least one number and one letter, and at least 8 or more characters"
										name='upw' class="form-control input-lg" placeholder="Enter Password">
								</div>
								<div class="form-group">
									<label for="">PW Check</label> 
										<input type="password" required	name='upwcheck' class="form-control input-lg"
										placeholder="Check Password">
										
								</div>
								<div class="form-group">
									<label for="">Sex &nbsp;</label>
										<label class="radio-inline">
											<input required type="radio" name="sex"> Female
										</label> 
										<label class="radio-inline">
											<input required type="radio" name="sex"> Male
										</label>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label for="">E-mail</label> 
										<input type="email" name="uname" required class="form-control input-lg" placeholder="Enter Email">
								</div>
								<div class="form-group">
									<label for="bir">Birth Year</label>
									 <select class="form-control input-lg" id="bir" name="bir">
										<c:forEach var="i" begin="1900" end="2016" step="1">
											<option>${i}</option>
										</c:forEach>
									</select>
								</div>
								<div class="form-group">
									<label for="cont">Continent</label>
									<select class="form-control input-lg" id="cont" name="conti">
										<c:forTokens var="ii"
											items="ASIA,EUROPE.AFRICA.NORTH AMERICA.SOUTH AMERICA.OCEANIA"
											delims=",.">
											<option>${ii}</option>
										</c:forTokens>
									</select>
								</div>
								<div class="form-group">
									<button type="submit" class="btn btn-success">Sign up</button>
								</div>
								<div class="form-group">
									<br>
									<br>
									<br>
									<br>
								</div>
							</div>
						</div>
					</div>
					<!-- /.box-body -->
				</form>


			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
	<script>
		function validateForm() {
				var a = document.getElementById("uid").value;
			    var x = document.forms["myForm"]["niddc"].value;
				var y = document.forms["myForm"]["upw"].value;
				var z = document.forms["myForm"]["upwcheck"].value;
				if (x == "check" || y != z) {
					alert("Please check ID or Password");
					return false;
				}
			}
	
		$("#iddc").on("click", function() {
			var uidl = $("#uid");
			var uidll = uidl.val();
			
			$.getJSON("/check/dup?uid=" + uidll, function(data) {
				var IDchecking = data.IDchecking;
				if (IDchecking && uidll != "") {
					alert("* Available ID *");
					document.getElementById("iddc").value = "confirm";
				} else {
					alert("* Unavailable ID *");
					document.getElementById("iddc").value = "check";
				}
			});
		});
		
		function doubleCheck() {
			if(document.getElementById("iddc").value = "confirm") {
		    document.getElementById("iddc").value = "check";
			}
		}
	</script>
</body>
</html>