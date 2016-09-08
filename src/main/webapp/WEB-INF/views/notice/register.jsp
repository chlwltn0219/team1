<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>register.jsp</title>
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<style>
.fileDrop {
	width: 80%;
	height: 100px;
	border: 1px dotted gray;
	background-color: lightslategrey;
	margin: auto;
}
</style>
</head>
<body>

	<div class="row">
		<div>
			<h3 >등록판</h3>
		</div>
		<div>
			<h3 class="box-title">등록판</h3>
			<form id="regusterform" role="form" method="post">
				<div>
					<div>
						<label for="exampleInputEmail1">Title</label>
						 <input type="text"	name='title' class="form-control" placeholder="Enter Title">
					</div>
					<div>
						<label for="exampleInputPassword1">Content</label>
						<textarea class="form-control" name="content" rows="3"	placeholder="Enter ..."></textarea>
					</div>
					<div>
						<label for="exampleInputEmail1">Writer</label> 
						<input type="text" name="writer" class="form-control" value='${login.uid }'	readonly>
						</div>
					<div >
						<label for="exampleInputEmail1">File DROP Here</label>
						<div class="fileDrop"></div>
					</div>
				</div>
				
				<div class="box-footer">
					<div>
						<hr>
					</div>
					<ul class="mailbox-attachments clearfix uploadedList">
					</ul>
					<button type="submit" class="btn btn-secondary">Submit</button>
				</div>
			
			</form>
			
		</div>
	</div>
	
	<script>
	var template = Handlebars.compile($("#template").html())
		var template = Handlebars.compile($("#template").html());

		$(".fileDrop").on("dragenter dragover", function(event) {
			event.preventDefault();
		});

		$(".fileDrop").on("drop", function(event) {
			event.preventDefault();

			var files = event.originalEvent.dataTransfer.files;

			var file = files[0];

			var formData = new FormData();

			formData.append("file", file);

			$.ajax({
				url : '/uploadAjax',
				data : formData,
				dataType : 'text',
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(data) {

					var fileInfo = getFileInfo(data);

					var html = template(fileInfo);

					$(".uploadedList").append(html);
				}
			});
		});
	
		$("#registerForm").submit(
				function(event) {
					event.preventDefault();

					var that = $(this);

					var str = "";
					$(".uploadedList .delbtn").each(
							function(index) {
								str += "<input type='hidden' name='files["
										+ index + "]' value='"
										+ $(this).attr("href") + "'> ";
							});

					that.append(str);

					that.get(0).submit();
				});
	</script>
</body>
</html>