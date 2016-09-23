<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<title>modifyPage.jsp</title>
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
		<!-- left column -->
		<div class="col-md-6">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">MODIFY BOARD</h3>
				</div>
				<!-- /.box-header -->

				<form role="form" action="modifyPage" method="post">

					<input type='hidden' name='page' value="${cri.page}"> <input
						type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">

					<div class="box-body">

						<div class="form-group">
							<label for="exampleInputEmail1">BNO</label> <input type="text"
								name='bno' class="form-control" value="${jBoardVO.bno}"
								readonly="readonly">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">Title</label> <input type="text"
								name='title' class="form-control" value="${jBoardVO.title}">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Content</label>
							<textarea class="form-control" name="content" rows="3">${jBoardVO.content}</textarea>
						</div>
						<!-- contentId -->
						<div class="form-group">
							<input id="contentId" type="hidden" name="contentid" value="${jBoard.contentid}">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">Writer</label> <input type="text"
								name="writer" class="form-control" value="${jBoardVO.writer}">
						</div>
					</div>
					<div class="box-footer">

						<button type="submit" class="btn btn-primary">SAVE</button>
						<button type="submit" class="btn btn-warning">CANCEL</button>

					</div>
				</form>
			</div>
		</div>
		<!-- /.box-body -->
		<div class="col-md-6">
			<!-- general form elements -->
			<div class="box box-warning">
				<div class="box-header">
					<h3 class="box-title">Search Event</h3>
				</div>
				<!-- /.box-header -->

				<div class="box-body">
					<!-- selected event -->
					<div>
						<input id="selectedEvent" class="form-control" type="text"
							readonly="readonly" placeholder="Selected Event...">
					</div>
					<hr>
					<!-- event list -->
					<div>
						<ul id="eventList" class="list-group"></ul>
					</div>
					<!-- pager -->
					<div id="pager" style="text-align: center;"></div>
				</div>
				<!-- /.box-body -->
				<div class="box-footer"></div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="/resources/js/upload.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

	<script id="template" type="text/x-handlebars-template"></script>
	
	
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
			$.getJSON('/jboard/threeMonth?pageNo='+ pageNo, function(data) {
				console.dir(data);
				console.log(pageNo);
				
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
			    	
// 			        console.dir(item);
// 			        alert(item[index].today);
			        
			    	
					if(item[index].today > item[index].eventenddate){
						 alert("*   이미 종료된 행사입니다.   *"+"\n"+"* 다른 행사를 선택해 주세요. *");
					} else {
				        alert("*   이 행사로 변경되었습니다.   *"+"\n")
						var selectTitle = $('li.list-group-item div.title h4').eq(index).html();
				        var contentId = $('li.list-group-item input').eq(index).val();
				    	$('#selectedEvent').val(selectTitle);
				    	$('#contentId').val(contentId);
						
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
		
	</script>
	<script>
	$(document).ready(	function() {
		var formObj = $("form[role='form']");
		formObj.submit(function(event) {
			event.preventDefault();
			var that = $(this);
			var str = "";
			that.append(str);
// 			console.log(str);
			that.get(0).submit();
		});
		$(".btn-warning").on("click",function() {
			alert("clicked  cancel");
				self.location = "/jboard/list?page=${cri.page}&perPageNum=${cri.perPageNum}"+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
			});
		});
		$(".btn-primary").on("click" , function() {
			alert("clicked");
			formObj.submit();
		});
	
		var template = Handlebars.compile($("#template").html());
		
		
		//console.log(file);
		</script>

	<!-- /.box -->
	<!--/.col (left) -->

	<!-- /.row -->

</body>
</html>
