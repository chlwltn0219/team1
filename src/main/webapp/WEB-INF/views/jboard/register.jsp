<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<!-- Font Awesome Icons -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!-- jQuery 2.1.4 -->
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<style>
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 450px
}

/* Set gray background color and 100% height */
.sidenav {
	padding-top: 20px;
	background-color: #f1f1f1;
	height: 100%;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}
</style>
</head>
<body>

			<div style="border: 1px solid red">
				<h3>Find Festival</h3>
				<input type="text" class="col-sm-8" id="searchFestival">
				<button id="find" class="btn btn-primary col-sm-4">Find</button>
				<p id="result"></p>
			</div>
			
	<form id='registerForm' role="form" method="post">
		<div class="box-body">
			<div class="form-group" style="border: 1px solid red">
				<label for="exampleInputEmail1">Title</label> <input type="text"
					name='title' class="form-control" placeholder="Enter Title">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Content</label>
				<textarea class="form-control" name="content" rows="3"
					placeholder="Enter ..."></textarea>
				<div class="container-fluid text-center">
					<div class="row content">
						<div class="col-sm-12 text-left" style="border: 1px solid red">

						</div>
					</div>
				</div>
			</div>
			<div class="form-group" style="border: 1px solid red">
				<label for="exampleInputEmail1">Writer</label> <input type="text"
					name="writer" class="form-control" value='${login.uid }' readonly>
			</div>
			<!-- /.box-body -->


			<ul class="mailbox-attachments clearfix uploadedList">
			</ul>

			<button type="submit" class="btn btn-primary">Submit</button>
		</div>

	</form>


	<footer class="container-fluid text-center">
		<p>Footer Text</p>
	</footer>
<script id="codeTemp" type="text/xxx-mytemplate">
	{{#each .}}
	<tr>
		<td>{{addr1}}</td>
		<td>{{addr2}}</td>
		<td>{{areacode}}</td>
		<td>{{contentid}}</td>
	</tr>
	{{/each}}
</script>


	<script type="text/javascript">
		$('#find').on('click', function() {
			$.getJSON("/keyword/test2", function(data) {
				
				console.dir(data);
				var item =	 data.items.item;
				
				var temp = $('codeTemp').html();
				var template = Handlebars.compile(temp);
				
				var html = template(item);
// 				console.log(html);
				$('#result').html(html);
				
// 				for(var i=0; i<items.length; i++) {
// 					var html = template(item[i]);
// 					console.log(html);
// 					$('#result').append(html);
// 				}
			});
		});
	</script>

</body>
</html>

