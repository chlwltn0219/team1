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
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">REGISTER BOARD</h3>
				</div>
				<!-- /.box-header -->

				<form id='registerForm' role="form" method="post">
					<div class="box-body">
						<div class="form-group">
							<label for="exampleInputEmail1">Title</label>
							<input type="text" name='title' class="form-control" placeholder="Enter Title">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Content</label>
							<textarea class="form-control" name="content" rows="25" placeholder="Enter ..."></textarea>
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">Writer</label> <input type="text"
								name="writer" class="form-control" value='${login.uid }'
								readonly>
						</div>

					</div>

					<!-- /.box-body -->

					<div class="box-footer">

						<ul class="mailbox-attachments clearfix uploadedList">
						</ul>

						<button type="submit" class="btn btn-primary">Submit</button>

					</div>
				</form>


			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

		<!-- right column -->
		<div class="col-md-6">
			<!-- general form elements -->
			<div class="box box-warning">
				<div class="box-header">
					<h3 class="box-title">Search Event</h3>
				</div>
				<!-- /.box-header -->

<!-- 				<form id='registerForm' role="form" method="post"> -->
				
					<div class="box-body">
						<div>
							<input id="selectedEvent" class="form-control" type="text" value="" readonly="readonly" placeholder="Selected Event...">
						</div>
						<hr>
						<div>
							<ul id="eventList" class="list-group"></ul>
						</div>
						<div id="pager" style="text-align: center;"></div>
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
	
	<script id="selectTemplate" type="text/x-handlebars-template">
		


	</script>

	<script id="eventTemplate" type="text/x-handlebars-template">
	   {{#each .}}
			<li class="list-group-item">
				<div class="title"><h4>{{title}}</h4></div>
				<hr>
				<div style="text-align: right;">
					<h4><span class="label {{onTime today eventstartdate eventenddate}}">{{eventstartdate}}-{{eventenddate}}</span></h4>
				</div>
			</li>
	   {{/each}}
	</script>

	<script id="pageTemplate" type="text/x-handlebars-template">
		<button id="prev" type="button" class="btn btn-default" style="visibility: {{visiblility prev}}">Prev</button>
			<div class="btn-group">
				{{#pageMaker startPage endPage 1}}
					<button type="button" class="btn btn-default page {{this.active}}" value={{this.pageNo}}>{{this.pageNo}}</button>
				{{/pageMaker}}
			</div>
		<button id="next" type="button" class="btn btn-default" style="visibility: {{visiblility next}}">Next</button>
	</script>

	<script type="text/javascript">
		
		getList(1);
	
		function getList(pageNo) {
			$.getJSON('/jboard/threeMonth?pageNo='+ pageNo, function(data) {
				console.dir(data);
				
				var item = data.items.item;
				var pageMaker = data.pageMaker;
				console.dir(item);
				console.dir(pageMaker);
				
	// 			Print List
				var temp = $('#eventTemplate').html();
				var template = Handlebars.compile(temp);
				var html = template(item);
				$('#eventList').html(html);
				
				
				
	// 			Print Pager
				var page = $('#pageTemplate').html();
				var pageTemplate = Handlebars.compile(page);
				var pagehtml = pageTemplate(pageMaker);
				$('#pager').html(pagehtml);
				

// 				$("li.list-group-item").on("click", function() {
// 					alert(" clicked...");
					
					
// 				});
				
				setBtnEvent(data);
				setListEvent();
				
			});
		}

		function setBtnEvent(data) {
			$('button.page').on('click', function() {
				getList(this.value);
			});
			$('#prev').on('click', function() {
				getList(data.pageMaker.startPage-1);					
			});
			$('#next').on('click', function() {
				getList(data.pageMaker.endPage+1);
			});
		}
		
		function setListEvent() {
			$('li.list-group-item').on({
			    mouseenter: function(){
			        $(this).css("background-color", "#FAFAFA");
			    }, 
			    mouseleave: function(){
			        $(this).css("background-color", "#FFFFFF");
			    }, 
			    click: function(){
			    	$(this).css("background-color", "#F0F0F0");
			        var index = $('li.list-group-item').index(this);
			        var selectTitle = $('li.list-group-item div.title h4').eq(index).html();
			    	$('#selectedEvent').val(selectTitle);
			    } 
			});
		}
		
		Handlebars.registerHelper('onTime' , function(today, eventstartdate, eventenddate) {
			if(today > eventenddate){
				return 'label-default';
			} else if(today < eventstartdate){
				return 'label-warning';
			} else {
				return 'label-success';
			}
		});
		
		Handlebars.registerHelper('visiblility' , function(visible) {
			if(visible)
				return 'visible'; 
			else 
				return 'hidden';
		});


		Handlebars.registerHelper('pageMaker', function(from, to, incr, block) {
			console.dir(block);
			
		    var accum = '';
		    var nowPage = block.data.root.cri.page;
			var active = '';
		    
		    for(var i = from; i <= to; i += incr){
			    if(nowPage==i)
		    		active = 'active';
		    	
		    	var custom = {
		    		pageNo : i,
		    		active : active
		    	};
		        accum += block.fn(custom);
		        active = '';
		    }
		    console.dir(accum);
		    
		    return accum;
		});
		
	</script>

</body>
</html>
