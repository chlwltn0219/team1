<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<html>
<!-- Bootstrap 3.3.4 -->
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- Font Awesome Icons -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<head>
<title>readPage.jsp</title>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAA4WMo8DvHp--izPUaJTqHDV0wJotTBpc"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<!-- Main content -->
<style type="text/css">
	.popup {
		position: absolute;
	}
	
	.back {
		background-color: gray;
		opacity: 0.5;
		width: 100%;
		height: 300%;
		overflow: hidden;
		z-index: 1101;
	}
	
	.front {
		z-index: 1110;
		opacity: 1;
		boarder: 1px;
		margin: auto;
	}
	
	.show {
		position: relative;
		max-width: 1200px;
		max-height: 800px;
		overflow: auto;
	}
	
	button.btnImg{
		width : 100%;
		height: 100%;
	}
	
	.weather, .date, .temp{
		position: absolute;
		width: 100%;
		text-align: center;
	}
	
	.temp {
		bottom: 0;
		text-align: right;
	}
	
	span.max {
		color: red;
	}
	
	span.min {
		color: blue;
	}
	
	#summary, #forecast6days {
			height: 50px;
			text-align: center;
	}
	
	@media ( min-width :992px){
		#summary, #forecast6days {
			height: 70px;
		}
	}
	
	@media ( min-width :1200px) {
		#summary, #forecast6days {
			height: 90px;
		}
	}
	
</style>
</head>
<body>
    <div class='popup back' style="display:none;"></div>
    <div id="popup_front" class='popup front' style="display:none;">
    	<img id="popup_img">
    </div>
    
	<!-- Weather -->
	<div class="box box-success">
		<div class="box-header">
			<h3 class="box-title">Weather</h3>
		</div>

		<div class="box-body">
			<div id="summary" class="row">
				<h2> 3일 예보 </h2>
			</div>
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
					<h3 class="box-title">READ BOARD</h3>
				</div>
				<!-- /.box-header -->

				<form role="form" action="modifyPage" method="post">
					<input type='hidden' name='bno' value="${jBoardVO.bno}">
					<input type='hidden' name='page' value="${cri.page}">
					<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">
				</form>

				<div class="box-body">
					<div class="form-group">
						<label>Title</label>
						<input type="text" name='title' class="form-control" value="${jBoardVO.title}" readonly="readonly">
					</div>
					<div class="form-group">
						<label>Content</label>
						<textarea class="form-control" name="content" rows="25" readonly="readonly">${jBoardVO.content}</textarea>
					</div>
					<div class="form-group">
						<label>Writer</label>
						<input type="text" name="writer" class="form-control" value="${jBoardVO.writer}" readonly="readonly">
					</div>
				</div>
				<!-- /.box-body -->

				<div class="box-footer">


					<ul class="mailbox-attachments clearfix uploadedList">
					</ul>
					<c:if test="${login.uid == jBoardVO.writer}">
						<button type="submit" class="btn btn-warning" id="modifyBtn">Modify</button>
						<button type="submit" class="btn btn-danger" id="removeBtn">REMOVE</button>
					</c:if>
					<button type="submit" class="btn btn-primary" id="goListBtn">GO	LIST</button>
				</div>

			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->
		
		<!-- festival info -->
		<div class="col-md-6">
			<div id="eventInfo" class="box box-warning">
				<div class="box-header">
					<h3 id="infoTitle" class="box-title">{{title}}</h3>
				</div>
				<div class="box-body">
					<div id="btnre" class="row">
						<div class="col-xs-2 btnImg">
							<button id="btnLeft" class="btn btn-warning" style="height: 150px; width: 100%"><h3><i class="fa fa-arrow-circle-o-left"></i></h3></button>
						</div>
						<div class="col-xs-8" style="text-align: center;" id="infoImage">
							<img alt="image" src="/resources/img/NoImage.jpg" style="height: 150px">
						</div>
						<div class="col-xs-2 btnImg">
							<button id="btnRight" class="btn btn-warning" style="height: 150px; width: 100%"><h3><i class="fa fa-arrow-circle-o-right"></i></h3></button>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-xs-1"></div>
						<div class="col-xs-3"><label>Location : </label></div>
						<div class="col-xs-7" id="infoLocation">
							<span>{{addr1}}</span>
							<button class="btn" type="button" data-toggle="modal" data-target="#mapModal" style="background-color: white;">
								<img alt="{{mapIcon}}" src="/resources/img/location.png" style="width: 20px; height: 20px;">
							</button>
						</div>
						<div class="col-xs-1"></div>
					</div>
					<hr>
					<div class="row">
						<div class="col-xs-1"></div>
						<div class="col-xs-3"><label>Overview : </label></div>
						<div class="col-xs-7" id="infoOverview">
							<div>{{overview}}</div>
						</div>
						<div class="col-xs-1"></div>
					</div>
					<hr>
					<div class="row">
						<div class="col-xs-1"></div>
						<div class="col-xs-3"><label>Programs : </label></div>
						<div class="col-xs-7" id="infoProgram">
							<div>{{program}}</div>
							<div>{{subevent}}</div>
						</div>
						<div class="col-xs-1"></div>
					</div>
					<hr>
					<div class="row">
						<div class="col-xs-1"></div>
						<div class="col-xs-3"><label>Cost : </label></div>
						<div class="col-xs-7" id="infoCost">
							<div>{{usetimefestival}}</div>
							<div>{{discountinfofestival}}</div>
						</div>
						<div class="col-xs-1"></div>
					</div>
					<hr>
					<div class="row">
						<div class="col-xs-1"></div>
						<div class="col-xs-3"><label>HomePage : </label></div>
						<div class="col-xs-7" id="infoHomepage">{{homepage}}</div>
						<div class="col-xs-1"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.row -->
	
	<!-- Map Modal -->
	<div id="mapModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="modal-title">행사 장소</h3>
				</div>
				<div class="modal-body">
					<div id="map" style="width: 100%; height: 400px"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">

			<div class="box box-success">
				<div class="box-header">
					<h3 class="box-title">ADD NEW REPLY</h3>
				</div>
				
				<!-- 로그인 상태 -->
				<c:if test="${not empty login}">
					<div class="box-body">
						<label>Writer</label> 
							<input class="form-control" type="text" placeholder="USER ID"
								   id="newReplyWriter" value="${login.uid }" readonly="readonly">
						<label>Reply Text</label>
							<input class="form-control" type="text" placeholder="REPLY TEXT" id="newReplyText">
					</div>

					<div class="box-footer">
						<button type="submit" class="btn btn-primary" id="replyAddBtn">ADD REPLY</button>
					</div>
				</c:if>
				
				<!-- 로그아웃 상태 -->
				<c:if test="${empty login}">
					<div class="box-body">
						<div>
							<a href="/user/login">Login Please</a>
						</div>
					</div>
				</c:if>
			</div>



			<!-- The time line -->
			<ul class="timeline">
				<!-- timeline time label -->
				<li class="time-label" id="repliesDiv">
					<span class="bg-green">
							Replies List <small id='replycntSmall'> [ ${jBoardVO.replycnt} ] </small>
					</span>
				</li>
			</ul>

			<div class='text-center'>
				<ul id="pagination" class="pagination pagination-sm no-margin ">
				
				</ul>
			</div>

		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->


	<!-- Modal -->
	<div id="modifyModal" class="modal modal-primary fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">댓글 수정 및 삭제</h4>
				</div>
				<div class="modal-body" data-rno>
					<p>
						<input type="text" id="replytext" class="form-control">
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
					<button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<script id="template" type="text/x-handlebars-template">
		{{#each .}}
			<li class="replyLi" data-rno={{rno}}>
				<i class="fa fa-thumbs-o-up bg-blue"></i>
				<div class="timeline-item" >
					<span class="time">
						<i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
					</span>
					<h3 class="timeline-header"><strong>{{rno}}</strong> -{{replyer}}</h3>
					<div class="timeline-body">{{replytext}} </div>
					<div class="timeline-footer">
						{{#eqReplyer replyer }}
							<a class="btn btn-primary btn-xs" data-toggle="modal" data-target="#modifyModal">Modify</a>
						{{/eqReplyer}}
					</div>
				</div>			
			</li>
		{{/each}}
	</script>
	
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
		{{#for 0 12 1}}
			<div class="col-xs-1">
				<div class="weather">
					<div class="date"></div>
					<img alt="sorry" src="" width="100%">
					<div class="temp">
						<b><span class="max"></span> - <span class="min"></span></b>
					</div>
				</div>
			</div>
		{{/for}}
	</script>

<script>
	
	var imageNo = 0;
	var item ;
	var zoom ;
	
	$.getJSON("/detail/jboardInfo?contentId=${jBoardVO.contentid}&contentTypeId=15", function(data){
		console.dir(data);
		item = data;
		
		var image = data.image
		var location = data.location;
		var cost = data.cost;
		var programs = data.programs;
		
		$('#infoTitle').html(data.title);
		
		if(image!=null)
			$('#infoImage img').attr("src", image[imageNo]);
		
		$('#infoOverview div').html(data.overview);
		$('#infoLocation span').html(location.addr1);
		$('#infoProgram div').eq(0).html(programs.program);
		$('#infoProgram div').eq(1).html(programs.subevent);
		$('#infoCost div').eq(0).html(cost.usetimefestival);
		$('#infoCost div').eq(1).html(cost.discountinfofestival);
		$('#infoHomepage').html(data.homepage);
		
		$.getJSON('/weather/forecast?lat='+ location.mapy + "&lon=" + location.mapx, function(weather) {
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
			
			alert();
			
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
			
			for(var i=0; i<3; i++) {
				date.setDate(today + i);
				month = date.getMonth()+ 1;
				day = date.getDate();
				
				$('div.date').eq(i).html("<b>" + month + "/" + day + "</b>");
			}
			for(var i=3; i<15; i += 2) {
				date.setDate(today + i);
				month = date.getMonth()+ 1;
				day = date.getDate();
				
				$('div.date').eq(i).html("<b>" + month + "/" + day + "</b>");
				$('div.date').eq(i+1).html("<b>" + month + "/" + day + "</b>");
			}
			
		});
		
		
		$('#btnRight').on('click', function() {
			if(imageNo==image.length-1)
				imageNo = 0;
			else
				imageNo += 1;
			
			$('#infoImage img').attr("src", image[imageNo]);
		})
		$('#btnLeft').on('click', function() {
			if(imageNo==0)
				imageNo = image.length-1;
			else
				imageNo -= 1;
			
			$('#infoImage img').attr("src", image[imageNo]);
		})
	});
	
	$("#mapModal").on('shown.bs.modal', function () {
		initMap(item);
	});

	// Map
	function initMap(item) {
		var map_center = {
			lat : item.location.mapy*1,
			lng : item.location.mapx*1
		};
		// Create a map object and specify the DOM element for display.
		var map = new google.maps.Map(document.getElementById('map'), {
			center : map_center,
			scrollwheel : true,
			zoom : item.location.mlevel*1 + 10
		});
		// Create a marker and set its position.
		var marker = new google.maps.Marker({
			map : map,
			position : map_center,
			title : item.title
		});
	}
	

	// reply
	Handlebars.registerHelper("eqReplyer", function(replyer, block) {
		var accum = '';
		if (replyer == '${login.uid}') {
			accum += block.fn();
		}
		return accum;
	});

	Handlebars.registerHelper("prettifyDate", function(timeValue) {
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		return year + "/" + month + "/" + date;
	});

	var printData = function(replyArr, target, templateObject) {

		var template = Handlebars.compile(templateObject.html());

		var html = template(replyArr);
		$(".replyLi").remove();
		target.after(html);

	}
	
	// reply pagination
	var bno = ${jBoardVO.bno};
	var replyPage = 1;

	function getPage(pageInfo) {
		$.getJSON(pageInfo, function(data) {
			printData(data.list, $("#repliesDiv"), $('#template'));
			printPaging(data.pageMaker, $(".pagination"));

			$("#modifyModal").modal('hide');
			$("#replycntSmall").html("[ " + data.pageMaker.totalCount + " ]");
		});
	}

	var printPaging = function(pageMaker, target) {
		var str = "";
		if (pageMaker.prev) {
			str += "<li><a href='" + (pageMaker.startPage - 1)
					+ "'> << </a></li>";
		}
		for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.cri.page == i ? 'class=active' : '';
			str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
		}
		if (pageMaker.next) {
			str += "<li><a href='" + (pageMaker.endPage + 1)
					+ "'> >> </a></li>";
		}
		target.html(str);
	};
	
	// reply pager print
	$("#repliesDiv").on("click", function() {
		if ($(".timeline li").size() > 1) {
			return;
		}
		getPage("/replies/" + bno + "/1");
	});
	
	// change page
	$(".pagination").on("click", "li a", function(event) {
		event.preventDefault();
		replyPage = $(this).attr("href");

		getPage("/replies/" + bno + "/" + replyPage);
	});
	
	// add reply
	$("#replyAddBtn").on("click", function() {

		var replyerObj = $("#newReplyWriter");
		var replytextObj = $("#newReplyText");
		var replyer = replyerObj.val();
		var replytext = replytextObj.val();

		$.ajax({
			type : 'post',
			url : '/replies/',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : JSON.stringify({
				bno : bno,
				replyer : replyer,
				replytext : replytext
			}),
			success : function(result) {
				console.log("result: " + result);
				if (result == 'SUCCESS') {
					alert("등록 되었습니다.");
					replyPage = 1;
					getPage("/replies/" + bno + "/" + replyPage);
					replyerObj.val("");
					replytextObj.val("");
				}
			}
		});
	});
	
	// print reply
	$(".timeline").on("click", ".replyLi", function(event) {
		var reply = $(this);

		$("#replytext").val(reply.find('.timeline-body').text());
		$(".modal-title").html(reply.attr("data-rno"));
	});
	
	// modify reply
	$("#replyModBtn").on("click", function() {
		var rno = $(".modal-title").html();
		var replytext = $("#replytext").val();

		$.ajax({
			type : 'put',
			url : '/replies/' + rno,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PUT"
			},
			data : JSON.stringify({
				replytext : replytext
			}),
			dataType : 'text',
			success : function(result) {
				console.log("result: " + result);
				if (result == 'SUCCESS') {
					alert("수정 되었습니다.");
					getPage("/replies/" + bno + "/" + replyPage);
				}
			}
		});
	});

	// delete reply
	$("#replyDelBtn").on("click", function() {

		var rno = $(".modal-title").html();
		var replytext = $("#replytext").val();

		$.ajax({
			type : 'delete',
			url : '/replies/' + rno,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			dataType : 'text',
			success : function(result) {
				console.log("result: " + result);
				if (result == 'SUCCESS') {
					alert("삭제 되었습니다.");
					getPage("/replies/" + bno + "/" + replyPage);
				}
			}
		});
	});
	
	
</script>


<script>
$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	console.log(formObj);
	
	$("#modifyBtn").on("click", function(){
		formObj.attr("action", "/jboard/modifyPage");
		formObj.attr("method", "get");		
		formObj.submit();
	});
	
	$("#removeBtn").on("click", function(){
		var replyCnt =  $("#replycntSmall").html();
		
		if(replyCnt > 0 ){
			alert("댓글이 달린 게시물을 삭제할 수 없습니다.");
			return;
		}	
		
		var arr = [];
		$(".uploadedList li").each(function(index){
			 arr.push($(this).attr("data-src"));
		});
		
		if(arr.length > 0){
			$.post("/deleteAllFiles",{files:arr}, function(){
				
			});
		}
		
		formObj.attr("action", "/jboard/removePage");
		formObj.submit();
	});	
	
	$("#goListBtn ").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/jboard/list");
		formObj.submit();
	});
	
});
</script>

</body>
</html>

