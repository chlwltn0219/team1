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

<style type="text/css">

.temp{
	float: left;
	position: relative;
	margin: 2.9%;
}

.img, .info{
	width: 300px;
	height:300px;
	float:left; 
	
}

.img{
	z-index: 50;
}

.info{
	opacity : 0.7;
	background-color : white;
	position : absolute;
	display : none;
	z-index : 100;
}

.info * {
	padding : 1px 5px;
}

</style>
</head>
<body>
<!-- <button id="json" class="btn btn-primary">getJSON form Open API</button> -->
<!-- <label><input type="date" id="start"></label> -->
<!-- <label><input type="date" id="stop"></label> -->
<!-- <input type="text" id="find"> -->


<div class="table-responsive">
	<table class="table table-hover">
	<thead>
		<tr>	
			<th>contentId = ${contentid}</th>
<!-- 			<th>썸네일</th> -->
<!-- 			<th>타이틀</th> -->
<!-- 			<th>주소</th> -->
<!-- 			<th>전화번호</th> -->
<!-- 			<th>행사 시작일</th> -->
<!-- 			<th>행사 종료일</th> -->
		</tr>
	</thead>
	<tbody id="result"></tbody>
	</table>
</div>
<script id="codeTemp" type="text/xxx-mytemplate">

/*
 <div class="abc temp">		
	<div class="info">
		<br>
		<div class="title"><h3>{{title}}</h3></div>
		<hr>
		<div class="addr"><h4>{{addr1}}</h4></div>
		<div class="eventdate"><h4>{{eventstartdate}}~{{eventenddate}}</h4></div>
		<div class="tel"><h4>{{tel}}</h4></div>
		<button class="map">map</button>
	</div>
	<img class="img" src="{{firstimage2}}">
</div> 
*/
</script>

<script type="text/javascript">

	$.getJSON("/detail/common?contentId=" + '${contentid}', function(data) {
		// json 객체 내부 접근하기
		console.dir(data);
		
// 		var items = data.items.item;
		
// 		var temp2 = $('#codeTemp').html();
// 		var template = Handlebars.compile(temp2);
		
// 		$('#result').html("");
		
// 		for(var i=0; i<items.length; i++) {
// 			var html = template(items[i]);
// 			console.log(html);
// 			$('#result').append(html);
// 			imgCheck(i);
// 			imgHover();
// 		}
		
	});
	
// 	function imgCheck(i) {
// 		if($('div.abc img').eq(i).attr('src')=='')
// 			$('div.abc img').eq(i).attr('src','http://placehold.it/300x300?text=No_Img');
// 	};
	
// 	function imgHover() {
// 	    $('div.abc').on({
// 	        mouseenter: function(){
// 	        	var index = getIndex(this);
// 	        	console.log(index)
// 	            $('div.abc img').eq(index).css("opacity", 0.1);
// // 	            $('div.abc div.info').eq(index).css("display", "block");
// 	            if(!$('div.abc div.info').eq(index).is(':animated')) 
// 					$('div.abc div.info').eq(index).fadeIn();
// 	        },
// 	        mouseleave: function(){
// 	        	var index = getIndex(this);
// 	            $('div.abc img').eq(index).css("opacity", 1);
// // 	            $('div.abc div.info').eq(index).css("display", "none");
// 	            $('div.abc div.info').fadeOut();
// 	        }
// 	    });
// 	}
	
// 	function getIndex(obj) {
// 		return $('div.abc').index(obj);
// 	}
	

	
</script>

</body>
</html>