<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<html>
<!-- Bootstrap 3.3.4 -->
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- Font Awesome Icons -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<head>
<title>jboard/list.jsp</title>
<!-- HandleBars -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<style type="text/css">
	.info-box {
		position: relative;
		width: 100%;
		height: 200px;
	}

	div.info, div.image{
		float: left;
		position : absolute;
 		top: 0; 
 		left: 0;
		width: 100%;
		height: 200px;
		text-align: center;
		background-color: black;
		color: white;
	}
	
	div.info {
		z-index: 50;
	}
	
	div.image {
		z-index: 100;
	}
	
	.info .title, .info .date {
		width: 100%;
		height: 100px;
	}
</style>
</head>
<body>

	<div class="row">
		<!-- left column -->

		<div class="col-md-12">
			<!-- Hot Festival List -->
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">Hot Event</h3>
				</div>
				<div class="box-body container-fluid">
					<div id="hotFestival" class="row">
					</div>
				</div>
			</div>
			
			<!-- general form elements -->
			<div class='box'>
				<div class="box-header with-border">
					<h3 class="box-title">Search</h3>
				</div>
				<div class='box-body'>
					<select name="searchType">
						<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							---</option>
						<option value="t"
							<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
							Title</option>
						<option value="c"
							<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
							Content</option>
						<option value="w"
							<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
							Writer</option>
						<option value="tc"
							<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
							Title OR Content</option>
						<option value="cw"
							<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>
							Content OR Writer</option>
						<option value="tcw"
							<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>
							Title OR Content OR Writer</option>
					</select> <input type="text" name='keyword' id="keywordInput"
						value='${cri.keyword }'>
					<button id='searchBtn'>Search</button>
					<button id='newBtn'>New Board</button>
				</div>
			</div>

			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">LIST PAGING</h3>
				</div>
				<div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th style="width: 10px">BNO</th>
							<th>TITLE</th>
							<th>WRITER</th>
							<th>REGDATE</th>
							<th style="width: 40px">VIEWCNT</th>
						</tr>

						<c:forEach items="${list}" var="jBoardVO">
						
							<tr>
								<td>${jBoardVO.bno}</td>
								<td><a
									href='/jboard/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&bno=${jBoardVO.bno}'>
										${jBoardVO.title} <strong>[ ${jBoardVO.replycnt} ]</strong>
								</a></td>
								<td>${jBoardVO.writer}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
										value="${jBoardVO.regdate}" /></td>
								<td><span class="badge bg-red">${jBoardVO.viewcnt }</span></td>
							</tr>

						</c:forEach>

					</table>
				</div>
				<!-- /.box-body -->


				<div class="box-footer">

					<div class="text-center">
						<ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li><a
									href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
							</c:if>

						</ul>
					</div>

				</div>
				<!-- /.box-footer-->
			</div>
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
	
	<script id="temp" type="text/xxx-mytemplate">
		{{#each .}}
			<div class="col-md-4 col-xs-6">
				<div class=" info-box">
					<div class="image">
						<img alt="{{title}}" src="{{firstimage}}" width="100%" height="200">
					</div>
					<div class="info">
						<br>
						<div>
							<div class="title"><h3>{{title}}</h3></div>
							<div class="date"><h4>{{eventstartdate}} - {{eventenddate}}</h4></div>
						</div>
					</div>
				</div>
			</div>
		{{/each}}
	</script>
	
	<script type="text/javascript">
		$.getJSON("/jboard/nearFestival?pageNo=" + Math.floor(Math.random()*10), function(data){
			console.dir(data);
			
			var item = data.items.item;
			console.dir(item);
			
			var temp = $('#temp').html();
			var template = Handlebars.compile(temp);
			
			var html = template(item);
			console.log(html);
			
			$('#hotFestival').html(html);
			
			for(var i=0; i<data.numOfRows; i++){
				$('img').eq(i).attr("src", function(j, originValue) {
					if(originValue=="")
						return "/resources/img/NoImage.jpg";
				});
			}
			
			$('div.info-box').on({
				mouseenter: function() {
					var index = getIndex('div.info-box', this);
					console.log("enter: " + index);
					$('div.image').eq(index).css('opacity', 0.3);
				},
				mouseleave: function() {
					var index = getIndex('div.info-box', this);
					console.log("leave: " + index);
					$('div.image').eq(index).css('opacity', 1);
				}
			});
			
			function getIndex(which, obj) {
				return $(which).index(obj);
			}
			
		});		
	</script>

	<script>
		var result = '${msg}';

		if (result == 'SUCCESS') {
			alert("처리가 완료되었습니다.");
			location.replace(self.location);
		}
	</script>

	<script>
		$(document).ready( function() {

			$('#searchBtn').on("click",	function(event) {
				self.location = "list"
						+ '${pageMaker.makeQuery(1)}'
						+ "&searchType="
						+ $("select option:selected").val()
						+ "&keyword="
						+ $('#keywordInput').val();
			});

			$('#newBtn').on("click", function(evt) {
				self.location = "register";
// 				location.replace("/user/login");
			});
			
		});
		
	</script>

</body>
</html>