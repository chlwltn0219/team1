<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<html>
<head>
<!-- CSS -->
<link href="/resources/css/place.css" rel="stylesheet" type="text/css" />
<!-- Bootstrap 3.3.4 -->
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<!-- Font Awesome Icons -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!-- jQuery 2.1.4 -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- HandleBars -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<title>list.jsp</title>
</head>
<body>

	<div class="row">
		<!-- left column -->

		<div class="col-md-12">
			<!-- general form elements -->
			<div class='box'>
				<div class="box-header with-border">
					<h3 class="box-title">관광리스트</h3>
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
				<div class="selectBox">
					<select id="gu">
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
				</div>
			</div>


			<div class="table-responsive" style="width: 100%">
			   <table class="table table-hover">
			   <tbody id="result"></tbody>
			   </table>
			</div>



<a class="return-top" href="#" style="right:27px; bottom:50px; position:fixed; z-index:9999;">
	<img src="http://cfs.tistory.com/custom/blog/202/2025510/skin/images/top1.png">
</a>


<script id="codeTemp" type="text/xxx-mytemplate">
	<div class="table_list imgbox_hover">
			<a href="/place/detailList?contentid={{contentid}}">
				<img class="table_imgbox" alt="" src="{{firstimage}}">
				<div class="img_hover">
					<p> [관광] {{title}} </p>
				</div>
			</a>
	</div>
</script>

<script type="text/javascript">

   var serviceKey = "oMYSCkfnU%2BrM%2F6ad8zAICkGBj0eUCOxJc9bR%2F8MHuzhfo62P6cGA1YVZ7iY5QnDedVyfk5tMhc0Wu42fjDJ%2BcA%3D%3D";
   /* default Page */
   $.getJSON("http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=" + serviceKey + "&contentTypeid=12&areaCode=1&sigunguCode=" + 1 + "&MobileOS=ETC&MobileApp=AppTesting", function(areaCode) {
       
       var items = areaCode.response.body.items.item;
       var temp2 = $('#codeTemp').html();
       var template = Handlebars.compile(temp2);
       
       $('#result').html("");
       
       var j = 0;
       for(var i=0; i<items.length; i++) {
	         var html = template(items[i]);
	         $('#result').append(html);
	         imgCheck(i);
	         imgHover();
       }
    });
   /* select 버튼 클릭시 */
   $('#gu').on('change', function() {
	   
   var sigunguCode = $('#gu option:selected').val();

      $.getJSON("http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=" + serviceKey + "&contentTypeid=12&areaCode=1&sigunguCode=" + sigunguCode + "&MobileOS=ETC&MobileApp=AppTesting", function(areaCode) {
         
         var items = areaCode.response.body.items.item;
         var temp2 = $('#codeTemp').html();
         var template = Handlebars.compile(temp2);
         
         $('#result').html("");
         
         for(var i=0; i<items.length; i++) {
	         var html = template(items[i]);
	         $('#result').append(html);
	         imgCheck(i);
	         imgHover();
         }
      });
   });
   /*----------------------------------------------------------------*/
	
	function imgCheck(i) {
		if($('div.table_list img').eq(i).attr('src')==''){
			$('div.table_list img').eq(i).attr('src','http://placehold.it/300x350?text=No_Image');
		}
	};
      
	function imgHover() {
		var $btn=$('.img_hover');
		
		$( ".imgbox_hover" ).on({
			mouseenter: function() {
				var index = getIndex(this);
// 				$btn.eq(index).fadeIn();
				if(!$btn.eq(index).is(':animated')) 
					$btn.eq(index).fadeIn();
			},
			mouseleave: function() {
				$btn.fadeOut();
			}
		});
	}
	
	function getIndex(obj) {
		return $('.imgbox_hover').index(obj);
	}
</script>

<script>
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
		$('#searchBtn').on("click", function(event) {
			self.location = "list"
			+ '${pageMaker.makeQuery(1)}'
			+ "&searchType="
			+ $("select option:selected").val()
			+ "&keyword="
			+ $('#keywordInput').val();
		});

		$('#newBtn').on("click", function(evt) {
			self.location = "register";
		});
	});
</script>

</body>
</html>