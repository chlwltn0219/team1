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
	margin: 2%;
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
	opacity : 0.3;
	
	position: absolute;
	display: none;
	z-index: 100;
}

.info * {
	padding: 1px 5px;
}

 .title,.eventdate,.addr,.tel,.map { 
 	text-align: center; 
 } 
 
 .wldur {
  	margin-top: 1%; 
 	margin-left: 3%;
 }
 
</style>
</head>
<body>
<!-- <button id="json" class="btn btn-primary">getJSON form Open API</button> -->
<!-- <label><input type="date" id="start"></label> -->
<!-- <label><input type="date" id="stop"></label> -->
<!-- <input type="text" id="find"> -->
<div class="wldur">
<label>지역: &nbsp;</label>
<select id="sigungu">
	<option value="1">강남구</option>
    <option value="2">강동구</option>
    <option value="3">강북구</option>
    <option value="4">강서구</option>
    <option value="5">관악구</option>
    <option value="6">광진구</option>
    <option value="7">구로구</option>
    <option value="8">금천구</option>
    <option value="9">노원구</option>
    <option value="10">도봉구</option>
    <option value="11">동대문구</option>
    <option value="12">동작구</option>
    <option value="13">마포구</option>
    <option value="14">서대문구</option>
    <option value="15">서초구</option>
    <option value="16">성동구</option>
    <option value="17">성북구</option>
    <option value="18">송파구</option>
    <option value="19">양천구</option>
    <option value="20">영등포구</option>
    <option value="21">용산구</option>
    <option value="22">은평구</option>
    <option value="23">종로구</option>
    <option value="24">중구</option>
    <option value="25">중랑구</option>
</select>
<hr>
</div>


<div class="table-responsive">
	<table class="table table-hover">
	<thead>
		<tr>
<!-- 			<th>썸네일</th> -->
<!-- 			<th>타이틀</th> -->
<!-- 			<th>주소</th> -->
<!-- 			<th>전화번호</th> -->
<!-- 			<th>행사 시작일</th> -->
<!-- 			<th>행사 종료일</th> -->
		</tr>
	</thead>
	<tbody id="result" ></tbody>
	</table>
</div>
<script id="codeTemp" type="text/xxx-mytemplate">

<div class="abc temp">		
	<div class="info">
		<a class="atag" href="/festival/fRead?contentid={{contentid}}" style="text-decoration: none; color: black;">
			<br>
			<div style="opacity : 1" >
				<div class="title"><h3>{{title}}</h3></div>
				<hr>
				<div class="addr"><h4>{{addr1}}</h4></div>
				<div class="eventdate"><h4>{{eventstartdate}}~{{eventenddate}}</h4></div>
				<div class="tel"><h4>{{tel}}</h4></div>
			</div>
		</a>
	</div>
	<img class="img" src="{{firstimage2}}">
</div>
</script>


<script type="text/javascript">
	$('#sigungu').on('change', function() {
		
		var areaCode = $('#sigungu option:selected').val();
		
		$.getJSON("/festival/list?sigunguCode=" + areaCode, function(data) {
			// json 객체 내부 접근하기
			console.dir(data);
			
			var items = data.items.item;
			
			var temp2 = $('#codeTemp').html();
			var template = Handlebars.compile(temp2);
			
			$('#result').html("");
			
			for(var i=0; i<items.length; i++) {
				var html = template(items[i]);
				console.log(html);
				$('#result').append(html);
				imgCheck(i);
				imgHover();
			}
		});
	});
		
	var areaCode = 1;
	
	$.getJSON("/festival/list?sigunguCode=" + areaCode, function(data) {
		// json 객체 내부 접근하기
		console.dir(data);
		
		var items = data.items.item;
		
		var temp2 = $('#codeTemp').html();
		var template = Handlebars.compile(temp2);
		
		$('#result').html("");
		
		for(var i=0; i<items.length; i++) {
			var html = template(items[i]);
			console.log(html);
			$('#result').append(html);
			imgCheck(i);
			imgHover();
		}
		
	});
	
	function imgCheck(i) {
		if($('div.abc img').eq(i).attr('src')=='')
			$('div.abc img').eq(i).attr('src','/resources/img/NoImage.jpg');
	};
	
	function imgHover() {
	    $('div.abc').on({
	        mouseenter: function(){
	        	var index = getIndex(this);
	        	console.log(index)
	            $('div.abc img').eq(index).css("opacity", 0.1);
// 	            $('div.abc div.info').eq(index).css("display", "block");
	            if(!$('div.abc div.info').eq(index).is(':animated')) 
					$('div.abc div.info').eq(index).fadeIn();
	        },
	        mouseleave: function(){
	        	var index = getIndex(this);
	            $('div.abc img').eq(index).css("opacity", 1);
// 	            $('div.abc div.info').eq(index).css("display", "none");
	            $('div.abc div.info').fadeOut();
	        }
	    });
	}
	
	function getIndex(obj) {
		return $('div.abc').index(obj);
	}
	

	
</script>
</body>
</html>