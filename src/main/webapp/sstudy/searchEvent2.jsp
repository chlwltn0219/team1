<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
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
<head>
<title>register.jsp</title>


</head>
<body>

	<div class="row">
		<!-- left column -->
		<div class="col-md-6">
			<!-- general form elements -->
			<div class="box box-warning">
				<div class="box-header">
					<h3 class="box-title">Search Event</h3>
				</div>
				<!-- /.box-header -->

<!-- 				<form id='registerForm' role="form" method="post"> -->
				
					<div class="box-body">
<!-- 						<div> -->
<!-- 							<input id="keyword" class="form-control" type="search" value="" placeholder="Searsh Keyword..."> -->
<!-- 						</div> -->
						<div>
							<input id="selectedEvent" class="form-control" type="text" value="" readonly="readonly" placeholder="Selected Event...">
						</div>
						<hr>
						<div>
							<ul id="eventList" class="list-group"></ul>
						</div>
						<div>
							<ul class="pager">
								<li><a href="#">Prev</a></li>
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#">Next</a></li>
							</ul>
						</div>
					</div>

					<!-- /.box-body -->

					<div class="box-footer">

					</div>
					
<!-- 				</form> -->


			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->

	<script type="text/javascript" src="/resources/js/upload.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

	<script id="eventTemplate" type="text/x-handlebars-template">
	   {{#each .}}
			<li class="list-group-item">
				<div>{{title}}</div>
				<hr>
				<div>
					<h4><span class="label {{onTime today eventstartdate eventenddate}}">{{eventstartdate}}-{{eventenddate}}</span></h4>
				</div>
			</li>
	   {{/each}}
	</script>

	<script id="pageTemplate" type="text/x-handlebars-template">
		<li><a href="#">Prev</a></li>
	   		{{#each .}}
				<li class="{{active}}"><a href="#">{{page}}</a></li>
	   		{{/each}}
		<li><a href="#">Next</a></li>
	</script>

	<script type="text/javascript">
		
// 		$('document').on('ready', function() {
			$.getJSON('/jboard/threeMonth?pageNo='+'1', function(data) {
				console.dir(data);
				
				var item = data.items.item;
				console.dir(item);
				
				Handlebars.registerHelper('onTime' , function(today, eventstartdate, eventenddate) {
					if(today > eventenddate){
						return 'label-default';
					} else if(today < eventstartdate){
						return 'label-warning';
					} else {
						return 'label-success';
					}
				});
				
				var temp = $('#eventTemplate').html();
				var template = Handlebars.compile(temp);
				
				var html = template(item);
				
				$('#eventList').html(html);
				
				
			});

			
			
// 		})
		
		function searshEvent(keyword) {
			$.getJSON('/jboard/keywordFestival?keyword=' + keyword + '&pageNo=1', function(data) {
				console.dir(data);
				
				var items = data.items.item;
				console.dir(items);
				
 				var temp = $('#eventTemplate').html();
 				var template = Handlebars.compile(temp);

 				var html = template(items);

 				$('#eventList').html(html);
			});
		};
		
		
	</script>

</body>
</html>
