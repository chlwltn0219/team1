<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>festival.jsp</title>
<!-- Bootstrap 3.3.4 -->
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<!-- Font Awesome Icons -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!-- jQuery 2.1.4 -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- HandleBars -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link href="/resources/css/fRead.css" rel="stylesheet" type="text/css" />
<!-- Modal -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>

<div class="container">

<div class="table-responsive">
	<table class="table table-hover">
	<thead id="result">
	</thead>
	<tbody id="result1"></tbody>
	</table>
</div>

<div class="modal fade" id="map" role="dialog">
    <div class="modal-dialog">
    
    <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
          <p>Some text in the modal.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>

<!-- 행사 기간 -->
<script id="codeTemp1" type="text/xxx-mytemplate">
<br>
		<ul>	
			<li>행사 기간</li>
<br>
				<div>{{eventstartdate}}~{{eventenddate}}</div>
		</ul>	
</script>

<!-- 제목, 이미지, 전화번호, 주소, 홈페이지, 개요 -->
<script id="codeTemp" type="text/xxx-mytemplate">
<br>
	<div class="title">{{title}}</div>
<br>
<hr>
	<div>
		<img class="firstimg" src="{{firstimage}}">
	</div>
<br>
<hr>
<ul>
	<li>전화번호</li><br>
		<p>{{tel}}</p>
	<li>주소</li><br>
		<p>{{addr1}}{{addr2}} <button id="map" class="btn btn-info btn-lg" data-toggle="modal" data-target="#map">Map</button></p>
	<br>
	<li>상세 페이지</li><br>
		<p id="homepage"></p><br>
	<li>개요</li><br>
		<p id="overview"></p>
	</ul>
</script>

<!-- Id 값을 받아 기본정보 리턴 -->
<script type="text/javascript">
	$.getJSON("/detail/common?contentId=" + "${contentid}", function(data) {
		console.dir(data);
		
		var items = data.items.item;
		console.dir(items);
		
		var temp2 = $('#codeTemp').html();
		var template = Handlebars.compile(temp2);
		var html = template(items);
		
		$('#result').html(html);
		$('#overview').html(items.overview);
		$('#homepage').html(items.homepage);

		imgCheck();
		

	/* contenttypeid, contentid 값을 받아 행사기간 리턴 */
	var typeId = items.contenttypeid;
	$.getJSON("/detail/intro?contentId=" + "${contentid}" + "&contentTypeId=" + typeId, function(data) {
		console.dir(data);
		
		var items = data.items.item;
		console.dir(items);
		
		var temp2 = $('#codeTemp1').html();
		var template = Handlebars.compile(temp2);
		var html = template(items);
		
		$('#result1').html(html);

	});
});
	
	/* 이미지 없을 경우 대체 이미지 나타내기 */
	function imgCheck() {
		if($('.firstimg').eq(0).attr('src')=='')
			$('.firstimg').eq(0).attr('src','/resources/img/no-image.jpg');
	};
</script>
</body>
</html>