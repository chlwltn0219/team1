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
<style type="text/css">

	.weather, .date, .temp{
		position: absolute;
		width: 100%;
		text-align: center;
	}
	
	.temp {
		bottom: 5px;
		right: 5px;
		text-align: right;
	}
	
	span.max {
		color: red;
	}
	
	span.min {
		color: blue;
	}
	
	div.sky {
		text-align: left;
		clear: both;
		border: 1px solid #DDDDDD;
		border-radius : 10px;
	}
	div.sky img{
		float: left;
	}
	
	#forecast6days div.sky img{
		float: left;
	}
	
	#summary, #forecast6days, div.sky{
		height: 80px;
		text-align: center;
	}
	
	@media ( min-width :992px){
		#summary, #forecast6days, div.sky{
			height: 100px;
		}
	}
	
	@media ( min-width :1200px) {
		#summary, #forecast6days, div.sky{
			height: 120px;
		}
	}
	
	@media ( min-width :1600px) {
		#summary, #forecast6days, div.sky{
			height: 140px;
		}
	}
	
	div.sky img{
		height: 80px;
	}
	
	@media ( min-width :992px){
		div.sky img{
			height: 100px;
		}
	}
	
	@media ( min-width :1200px) {
		div.sky img{
			height: 120px;
		}
	}

	@media ( min-width :1600px) {
		div.sky img{
			height: 140px;
		}
	}
	
</style>
</head>
<body>
	<!-- Weather -->
	<div class="box box-success">
		<div class="box-header">
			<h3 class="box-title">Weather</h3>
		</div>

		<div class="box-body">
			<div id="summary" class="row">
				<h2> 3일 예보 </h2>
			</div>
			<hr>
			<div id="forecast6days" class="row">
				<h2> 중기 예보 (오전/오후) </h2>
			</div>
		</div>
	</div>
	
	<div class="row">
		<!-- left column -->
		<div class="col-md-6">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">REGISTER BOARD</h3>
				</div>
				<!-- /.box-header -->

				<form id='registerForm' role="form" method="post" onsubmit="submitCheck(event)">
					<div class="box-body">
						<!-- title -->
						<div class="form-group">
							<label for="title">Title</label>
							<input type="text" name='title' class="form-control" placeholder="Enter Title" maxlength="200" required>
						</div>
						<!-- content -->
						<div class="form-group">
							<label for="content">Content</label>
							<textarea class="form-control" name="content" rows="25" placeholder="Enter ..." required></textarea>
						</div>
						<!-- contentId -->
						<div class="form-group">
							<input id="contentId" type="hidden" name=contentid>
						</div>
						<!-- contentTitle -->
						<div class="form-group">
							<input id="contentTitle" type="hidden" name=contitle>
						</div>
						<!-- writer (read only) -->
						<div class="form-group">
							<label for="exampleInputEmail1">Writer</label> <input type="text"
								name="writer" class="form-control" value='${login.uid }'readonly>
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

		<!-- right column -->
		<div class="col-md-6">
			<!-- select event -->
			<div class="box box-warning">
				<div class="box-header">
					<h3 class="box-title">Search Event</h3>
				</div>
	
				<div class="box-body">
					<!-- selected event -->
					<div>
						<input id="selectedEvent" class="form-control" type="text" readonly="readonly" placeholder="Selected Event...">
					</div>
					<hr>
					<!-- event list -->
					<div>
						<ul id="eventList" class="list-group"></ul>
					</div>
				</div>

				<div class="box-footer">
					<!-- pager -->
					<div id="pager" style="text-align: center;"></div>
				</div>
					
			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->

	<script type="text/javascript" src="/resources/js/upload.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	
	<script id="summaryTemplate" type="text/x-handlebars-template">
		<div class="col-xs-1">
			<div class="weather">
				<div class="date"></div>
				<img alt="sorry" src={{sky.icon}} width="100%">
				<div class="temp">
					<b><span class="max">{{temperature.tmax}}</span> - <span class="min">{{temperature.tmin}}</span></b>
				</div>
			</div>
		</div>
	</script>
	
	<script id="forecastTemplate" type="text/x-handlebars-template">
		{{#for 0 5 1}}
			<div class="col-xs-2">
				<div class="weather">
					<div class="date"></div>
					<div class="sky">
						<img alt="" src="" width="50%">						
						<img alt="" src="" width="50%">
					</div>
					<div class="temp">
						<b><span class="max"></span> - <span class="min"></span></b>
					</div>
				</div>
			</div>
		{{/for}}
	</script>

	<script id="eventTemplate" type="text/x-handlebars-template">
	   {{#each .}}
			<li class="list-group-item">
				<div class="title"><h4>{{title}}</h4></div>
				<input type="hidden" name="contentId" value="{{contentid}}">
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
			
			var mapx;
			var mapy;
			
			$.getJSON('/jboard/threeMonth?pageNo='+ pageNo, function(data) {
				console.dir(data);
				console.log(pageNo);
				
				var item = data.items.item;
				var pageMaker = data.pageMaker;
				console.dir(item);
				console.dir(pageMaker);
				
				// Print List
				var temp = $('#eventTemplate').html();
				var template = Handlebars.compile(temp);
				var html = template(item);
				$('#eventList').html(html);
				
				// Print Pager
				var page = $('#pageTemplate').html();
				var pageTemplate = Handlebars.compile(page);
				var pagehtml = pageTemplate(pageMaker);
				$('#pager').html(pagehtml);

				setPaginationEvent(data);
				setListEvent(item);
			});
			
		}
		

		function setPaginationEvent(data) {
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
		
		function setListEvent(item) {
			$('li.list-group-item').on({
				// hover event
			    mouseenter: function(){
			        $(this).css("background-color", "#FAFAFA");
			    }, 
			    mouseleave: function(){
			        $(this).css("background-color", "#FFFFFF");
			    },
			 	// click event
			    click: function(){
			    	$(this).css("background-color", "#F0F0F0");
			        var index = $('li.list-group-item').index(this);
			    	
					if(item[index].today > item[index].eventenddate){
						 alert("*   이미 종료된 행사입니다.   *"+"\n"+"* 다른 행사를 선택해 주세요. *");
					} else {
				        var selectTitle = $('li.list-group-item div.title h4').eq(index).html();
				        var contentId = $('li.list-group-item input').eq(index).val();
				    	$('#selectedEvent').val(selectTitle);
				    	$('#contentTitle').val(selectTitle);
				    	$('#contentId').val(contentId);
						
						$.getJSON('/weather/forecast?lat='+ item[index].mapy + "&lon=" + item[index].mapx, function(weather) {
							
							console.log("###################################");
							console.dir(weather);
							console.log("###################################");
							
							var date = new Date();
							var today = date.getDate();
							var month;
							var day;
							
							var summary = weather.summary[0];
							var forecast6days = weather.forecast6days[0];
							
							var summaryTemp = $('#summaryTemplate').html();
							var compSummaryTemp = Handlebars.compile(summaryTemp);
							
							var forecastTemp = $('#forecastTemplate').html();
							var comForecastTemp = Handlebars.compile(forecastTemp);
							
							$('#summary').html("");
							$('#summary').append(compSummaryTemp(summary.today));
							$('#summary').append(compSummaryTemp(summary.tomorrow));
							$('#summary').append(compSummaryTemp(summary.dayAfterTomorrow));
							
							$('#forecast6days').html(comForecastTemp());
							
							$('#forecast6days img').eq(0).attr("src", forecast6days.sky.amIcon3day);
							$('#forecast6days img').eq(1).attr("src", forecast6days.sky.pmIcon3day);
							$('#forecast6days img').eq(2).attr("src", forecast6days.sky.amIcon4day);
							$('#forecast6days img').eq(3).attr("src", forecast6days.sky.pmIcon4day);
							$('#forecast6days img').eq(4).attr("src", forecast6days.sky.amIcon5day);
							$('#forecast6days img').eq(5).attr("src", forecast6days.sky.pmIcon5day);
							$('#forecast6days img').eq(6).attr("src", forecast6days.sky.amIcon6day);
							$('#forecast6days img').eq(7).attr("src", forecast6days.sky.pmIcon6day);
							$('#forecast6days img').eq(8).attr("src", forecast6days.sky.amIcon7day);
							$('#forecast6days img').eq(9).attr("src", forecast6days.sky.pmIcon7day);
							$('#forecast6days img').eq(10).attr("src", forecast6days.sky.amIcon8day);
							$('#forecast6days img').eq(11).attr("src", forecast6days.sky.pmIcon8day);
							
							$('#forecast6days span.max').eq(0).html(forecast6days.temperature.tmax3day);
							$('#forecast6days span.min').eq(0).html(forecast6days.temperature.tmin3day);
							$('#forecast6days span.max').eq(1).html(forecast6days.temperature.tmax4day);
							$('#forecast6days span.min').eq(1).html(forecast6days.temperature.tmin4day);
							$('#forecast6days span.max').eq(2).html(forecast6days.temperature.tmax5day);
							$('#forecast6days span.min').eq(2).html(forecast6days.temperature.tmin5day);
							$('#forecast6days span.max').eq(3).html(forecast6days.temperature.tmax6day);
							$('#forecast6days span.min').eq(3).html(forecast6days.temperature.tmin6day);
							$('#forecast6days span.max').eq(4).html(forecast6days.temperature.tmax7day);
							$('#forecast6days span.min').eq(4).html(forecast6days.temperature.tmin7day);
							
							for(var i=0; i<3; i++) {
								date.setDate(today + i);
								month = date.getMonth()+ 1;
								day = date.getDate();
								
								$('#summary div.date').eq(i).html("<b>" + month + "/" + day + "</b>");
							}
							for(var i=0; i<5; i ++) {
								date.setDate(today + i + 3);
								month = date.getMonth()+ 1;
								day = date.getDate();
								
								$('#forecast6days div.date').eq(i*2).html("<b>" + month + "/" + day + "</b>");
								$('#forecast6days div.date').eq(i*2+1).html("<b>" + month + "/" + day + "</b>");
							}
							
						});
				    	
					} 
								    	
			    } 
			});
		}
		
		function submitCheck(event) {

			var contentId = $('#contentId').val();
// 			alert(contentId);
			
			if(contentId == "") {
				alert("* 참여하는 행사를 선택해 주세요. *");
				event.preventDefault();
			}
			
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
		
		
		Handlebars.registerHelper('for', function(from, to, incr, block) {
		    var accum = '';
		    for(var i = from; i < to; i += incr){
		        accum += block.fn();
		    }
		    return accum;
		});
		
	</script>

</body>
</html>
