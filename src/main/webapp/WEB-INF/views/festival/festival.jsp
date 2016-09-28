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
<link href="/resources/css/festival.css" rel="stylesheet" type="text/css" />

</head>
<body>
<div class="box">
	<div class="row">
		<div class="wldur">
			<label>지역: &nbsp;</label>
			<select id="sigungu">
				<option value="1">강남구</option>
			    <option value="2">강동구</option>
			    <option value="3">강북구</option>
			    <option value="4">강서구</option>
<!-- 			    <option value="5">관악구</option> -->
			    <option value="6">광진구</option>
			    <option value="7">구로구</option>
			    <option value="8">금천구</option>
			    <option value="9">노원구</option>
<!-- 			    <option value="10">도봉구</option> -->
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
	</div>
	<div class="row fList">
		<div id="result" ></div>
	</div>
</div>
<div id="pager"></div>

<a class="return-top" href="#">
	<img src="http://cfs.tistory.com/custom/blog/202/2025510/skin/images/top1.png"> <!-- TOP 스크롤 -->
</a>

<!-- 리스트 나타내기 -->
<script id="codeTemp" type="text/xxx-mytemplate">

<div class="abc temp">		
		<a class="atag" href="/festival/fRead?contentid={{contentid}}" style="text-decoration: none; color: black;">
	<div class="info">
			<br>
			<div class="a">
				<div class="title"><h3>{{title}}</h3></div>
				<div class="eventdate"><h4>{{eventstartdate}}~{{eventenddate}}</h4></div>
			</div>
	</div>
		</a>
	<img class="img" src="{{firstimage2}}">
</div>
</script>


<script type="text/javascript">
	/* 시군구 셀렉트 값을 받아 리스트 리턴 */
	$('#sigungu').on('change', function() {
		var areaCode = $('#sigungu option:selected').val();
		$.getJSON("/festival/list?sigunguCode=" + areaCode + "&pageNo=" + pageNo, function(data) {
			// json 객체 내부 접근하기
			console.dir(data);
			console.dir(pageMaker);
			
			var items = data.items.item;
			var pageMaker = data.pageMaker;
			
			var temp2 = $('#codeTemp').html();
			var template = Handlebars.compile(temp2);
			
			var page = $('#pageTemplate').html();
			var pageTemplate = Handlebars.compile(page);
			var pagehtml = pageTemplate(pageMaker);
			$('#pager').html(pagehtml);

			setPaginationEvent(data);
			
			$('#result').html("");
			
			for(var i=0; i<items.length; i++) {
				var html = template(items[i]);
				console.log(html);
				$('#result').append(html);
				imgCheck(i);
				imgHover2();
			}
		});
	});
	
	/* 기본 리스트 */
	pageNo = 1;
	areaCode = $('#sigungu option:selected').val();
	getList(1, 1);
	function getList(pageNo, areaCode) {
		areaCode = $('#sigungu option:selected').val();		
		$.getJSON("/festival/list?sigunguCode=" + areaCode + "&pageNo=" + pageNo, function(data) {
			// json 객체 내부 접근하기
			console.dir(data);
			console.dir(pageMaker);
			
			var items = data.items.item;
			var pageMaker = data.pageMaker;
			
			var temp2 = $('#codeTemp').html();
			var template = Handlebars.compile(temp2);
			
			var page = $('#pageTemplate').html();
			var pageTemplate = Handlebars.compile(page);
			var pagehtml = pageTemplate(pageMaker);
			$('#pager').html(pagehtml);
		
			setPaginationEvent(data);
			
			$('#result').html("");
			
			for(var i=0; i<items.length; i++) {
				var html = template(items[i]);
				console.log(html);
				$('#result').append(html);
				imgCheck(i);
				imgHover2();
			}
			
		});
	}
	
	/* 마우스 오버 */
	function imgHover2() {
		$("div.abc").on({
	        mouseenter: function(){
	        	var index = getIndex(this);
	        	if(!$("div.abc img").eq(index).is(':animated')){
		        	$("div.abc img").eq(index).fadeTo('slow', 0.2);
	        	}
	            if(!$('div.abc div.info').eq(index).is(':animated')) {
					$('div.abc div.info').eq(index).fadeIn();	            	
	            }
	        },
	        mouseleave: function(){
	        	var index = getIndex(this);	
        		$("div.abc img").eq(index).stop().fadeTo('slow',1);	        	
	            $('div.abc div.info').fadeOut();
	        }
	    });
		
	}
	
	
	/* 이미지 없을 경우 대체 이미지 나타내기 */
	function imgCheck(i) {
		if($('div.abc img').eq(i).attr('src')=='')
			$('div.abc img').eq(i).attr('src','/resources/img/noImage.png');
	};
	
	/* 마우스 over시 이벤트 */
	function imgHover() {
	    $('div.abc').on({
	        mouseenter: function(){
	        	var index = getIndex(this);
	        	console.log(index)
	            $('div.abc img').eq(index).css("opacity", 0.3);
	            if(!$('div.abc div.info').eq(index).is(':animated')) 
					$('div.abc div.info').eq(index).fadeIn();
	        },
	        mouseleave: function(){
	        	var index = getIndex(this);
	            $('div.abc img').eq(index).css("opacity", 1);
	            $('div.abc div.info').fadeOut();
	        }
	    });
	}
	
	/* 인덱스값 리턴 */
	function getIndex(obj) {
		return $('div.abc').index(obj);
	}
	
	/* 스크롤 이벤트 */
	$(document).ready(function(){
        
	    $(".return-top").hide(); // 탑 버튼 숨김
	    $(function () {
	                 
	        $(window).scroll(function () {
	            if ($(this).scrollTop() > 100) { // 스크롤 내릴 표시
	                $('.return-top').fadeIn();
	            } else {
	                $('.return-top').fadeOut();
	            }
	        });
	                
	        $('.return-top').click(function () {
	            $('body,html').animate({
	                scrollTop: 0
	            }, 600);  // 탑 이동 스크롤 속도
	            return false;
	        });
	    });
	});
	
	/* paging */
	
	function setPaginationEvent(data) {
		$('button.page').on('click', function() {
			getList(this.value)
		});
		$('#prev').on('click', function() {
			getList(data.pageMaker.startPage-1);					
		});
		$('#next').on('click', function() {
			getList(data.pageMaker.endPage+1);
		});
	}
	
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

<!-- pagination Template -->
<script id="pageTemplate" type="text/x-handlebars-template">
	<button id="prev" type="button" class="btn btn-default" style="visibility: {{visiblility prev}}">Prev</button>
		<div class="btn-group">
			{{#pageMaker startPage endPage 1}}
				<button type="button" class="btn btn-default page {{this.active}}" value={{this.pageNo}}>{{this.pageNo}}</button>
			{{/pageMaker}}
		</div>
	<button id="next" type="button" class="btn btn-default" style="visibility: {{visiblility next}}">Next</button>
</script>
</body>
</html>