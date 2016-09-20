<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sitemesh" tagdir="/WEB-INF/tags/sitemesh"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><sitemesh:write property="title" /></title>

<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
<!-- Bootstrap 3.3.4 -->
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- Font Awesome Icons -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
<!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
<link href="/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
	    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

<!-- jQuery 2.1.4 -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

<!-- Sitemesh Head -->
<sitemesh:write property="head" />

<style type="text/css">

div.container {
	margin-top: 65px;
 	margin-bottom: 15px;
}

/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Add a gray background color and some padding to the footer */
.footer {
	width: 100%;
	background-color: #f2f2f2;
	padding: 25px;
	bottom: 0;
	position: relative;
}

</style>

</head>
<body>
	<!-- wrapper -->
	<div>
		<header>
			<!-- Navigation -->
			<nav class="navbar navbar-inverse navbar-fixed-top">
				<div class="container-fluid">
					<!-- Logo -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
							<span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="#">Website Logo</a>
					</div>
					<!-- Menu bar -->
					<div class="collapse navbar-collapse" id="myNavbar">
						<!-- Menu -->
						<ul class="nav navbar-nav">
							<li class="active"><a href="/jboard/list">Go With Me?</a></li>
							<li class="dropdown">
								<a href="/festival/festival">행사</a>
<!-- 								<ul class="dropdown-menu"> -->
<!-- 									<li><a href="#">행사</a></li> -->
<!-- 									<li><a href="/festival/festival">축제</a></li> -->
<!-- 									<li><a href="#">공연</a> -->
<!-- 								</ul> -->
							</li>
							<li class="dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown" href="#">관광 <span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="/place/list">관광지</a></li>
									<li><a href="/place/list">문화시설</a></li>
								</ul>
							</li>
							<li><a href="#">Gallery</a></li>
							<li><a href="#">Statistics</a></li>
						</ul>
						<!-- Before Log in -->
						<c:if test="${empty login}">
						<ul class="nav navbar-nav navbar-right">
							<li>
								<a href="/user/login"><span class="glyphicon glyphicon-log-in"></span> Login</a>
							</li>
						</ul>
						</c:if>
						<!-- After Log in -->
						<c:if test="${not empty login}">
						<ul class="nav navbar-nav navbar-right">
							<li>
								<a href="/user/logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a>
							</li>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li>
								<a href="/user/logout"> ${login.uname }</a>
							</li>
						</ul>
						</c:if>
					</div>
				</div>
			</nav>
		</header>
		
		<!-- Content Wrapper. Contains page content -->
		<div class="container well well-lg">
			<section>
				<!-- ################## -->
				<!-- START Main Content -->
				<!-- ################## -->
				<div class="container-fluid">
					<sitemesh:write property="body" />
				</div>
				<!-- ################## -->
				<!-- END   Main Content -->
				<!-- ################## -->
			</section>
		</div>

		<footer class="container-fluid text-center footer">
			<div class="pull-right hidden-xs">
				<b>Version</b> 0.1
			</div>
			<strong>Copyright &copy; 2016 <a
				href="#">Team1 2nd Project</a>.
			</strong> All rights reserved.
		</footer>

	</div>
	<!-- /wrapper -->


	<!-- Bootstrap 3.3.2 JS -->
	<script src="/resources/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<!-- FastClick -->
	<script src='/resources/plugins/fastclick/fastclick.min.js'></script>
	<!-- AdminLTE App -->
	<script src="/resources/dist/js/app.min.js" type="text/javascript"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="/resources/dist/js/demo.js" type="text/javascript"></script>
</body>
</html>

