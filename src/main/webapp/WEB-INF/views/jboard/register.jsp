<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
				<div  style="border: 1px solid red">
					<h3>Find  Festival</h3>
					<input type="text" class="col-sm-8" id="searchFestival" >
					<button class="btn btn-primary col-sm-4" type="submit" >Find</button>
				</div>
				
				
					<div class="row content">
						<div class="col-sm-12 text-left" style="border: 1px solid red">
							<p>Lorem ipsum...</p>
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

</body>
</html>

