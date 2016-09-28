<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<html>
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- CSS -->
<link href="/resources/css/place2.css" rel="stylesheet" type="text/css" />

<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Font Awesome Icons -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!-- jQuery 2.1.4 -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- HandleBars -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<!-- GoogoleMap Asynchronously Loading the API ********************************************* -->
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAA4WMo8DvHp--izPUaJTqHDV0wJotTBpc"></script>
<title>관광지 상세보기</title>
</head>

<body>
	<div class="row">
    	<div class="col-md-12">
        	<div class="box">
            	<div class="box-header with-border">
            		<h3 class="box-title">
                		<b>상세보기</b>
            		</h3>
	            	<a href="list">
	            		<img class="btn_list" src="http://kr.seaicons.com/wp-content/uploads/2015/11/Data-List-icon.png">
	            	</a>
            	</div>

            	<div id="result"></div>

               	<!-- Modal -->
               	<div class="modal fade" id="myModal" role="dialog">
                	<div class="modal-dialog">
                    <!-- Modal content-->
                    	<div class="modal-content">
                        	<div class="modal-header">
                           		<button type="button" class="close" data-dismiss="modal">&times;</button>
                           		<h4 class="modal-title">위치보기</h4>
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
			</div>
		</div>
	</div>

	<a class="return-top" href="#" style="right: 27px; bottom: 50px; position: fixed; z-index: 9999;">
    	<img src="http://cfs.tistory.com/custom/blog/202/2025510/skin/images/top1.png">
	</a>

<script id="codeTemp" type="text/xxx-mytemplate">
	<div class="centered">
    	<h2>{{title}}</h2><br>
    </div>
         
    <div class="w3-content" id="imgresult" style="max-width: 800px; position: relative">
		<div>
			<img class="w3-display-container mySlides firstimage" src="{{firstimage}}" style="width:100%; height=300px;">
		</div>
               
        <a class="w3-btn-floating w3-hover-dark-grey" style="position: absolute; top: 250px; left: 0; background-color: rgb(14,201,190);" onclick="plusDivs(-1)">❮</a> 
        <a class="w3-btn-floating w3-hover-dark-grey" style="position: absolute; top: 250px; right: 0; background-color: rgb(14,201,190);" onclick="plusDivs(1)">❯</a>
	</div>

   	<div class="detail">
    	<p>
        	<ul>
            	<li><b>소개 : </b><br><br><p id="overview" class="detailtext"></p></li><br>
                <li><b>주소 : </b><br><br>
                	<p class="detailtext"> {{addr1}} 
                		<a data-toggle="modal" data-target="#myModal">
                    		<img class="btn_map" src="/resources/img/location.png">
     					</a>
                	</p>
                </li>
                <li><b>홈페이지 : </b><br><br><p class="detailtext" id="homepage"></p></li><br>
			</ul>
		</p>
	</div>
</script>

<script id="codeTemp2" type="text/xxx-mytemplate">
	{{#each .}}
       	<img class="w3-display-container mySlides" src="{{originimgurl}}" style="width: 100%;">
    {{/each}}
</script>
            
<script type="text/javascript">
	var slideIndex = 1;
    showDivs(slideIndex);
   
    function plusDivs(n) {
    	showDivs(slideIndex += n);
    }
   
    function showDivs(n) {
        var x = document.getElementsByClassName("mySlides");
        var $Slides = $('.mySlides');
        if (n > x.length) {
        	slideIndex = 1;
        }
        if (n < 1) {
        	slideIndex = x.length;
        }
        for (var i = 0; i < x.length; i++) {
        	$Slides.eq(i).css("display", "none");
        }
        $Slides.eq(slideIndex-1).css("display", "block");
	}
</script>

<script>
	
	var items;
	var mapzoom;
	var title;

	$("#myModal").on('shown.bs.modal', function() {
    	initMap(items.mapx, items.mapy);
    });

    //   Map
    function initMap(x, y) {
    	var map_center = {
        	lat : y,
            lng : x
    	};
       	// Create a map object and specify the DOM element for display.
        var map = new google.maps.Map(document.getElementById('map'), {
        	center : map_center,
            scrollwheel : false,
            zoom : mapzoom + 10
        });
        // Create a marker and set its position.
        var marker = new google.maps.Marker({
        	map : map,
            position : map_center,
            title : title
        });
	}
	
	$.getJSON("/detail/common?contentId=" + "${contentid}", function(data) {

	    // json 객체 내부 접근하기
	    items = data.items.item;
	    mapzoom = items.mlevel;
	    title = items.title;
	
	    //x,y값 items에서 가져와 적용 
	    var temp2 = $('#codeTemp').html();
	    var template = Handlebars.compile(temp2);
	
	    var html = template(items);
	
	    $('#result').html(html);
	    $('#overview').html(items.overview);
	    $('#homepage').html(items.homepage);
	    
		// no image check
		if($('.firstimage').attr('src') == "")
			$('.firstimage').attr('src', '/resources/img/noImage.png');
	    
		// if return index < 0 => NOT ENTER
		$.getJSON("/detail/image?contentId=" + "${contentid}", function(data) {
			// json 객체 내부 접근하기
			var items = data.items.item;
			var img = $('.firstimage').attr('src');
			
			if(img == '/resources/img/noImage.png'){
				$('#imgresult>div').html("");
			}
			
			//x,y값 items에서 가져와 적용 
			var temp2 = $('#codeTemp2').html();
			var template = Handlebars.compile(temp2);
			var html = template(items);
			$('#imgresult>div').append(html);
			
			plusDivs(0);
		});
		
 	});
</script>

<script>
   /* 스크롤 이벤트 */
   $(document).ready(function() {

      $(".return-top").hide(); // 탑 버튼 숨김
      $(function() {

         $(window).scroll(function() {
            if ($(this).scrollTop() > 100) { // 스크롤 내릴 표시
               $('.return-top').fadeIn();
            } else {
               $('.return-top').fadeOut();
            }
         });

         $('.return-top').click(function() {
            $('body,html').animate({
               scrollTop : 0
            }, 600); // 탑 이동 스크롤 속도
            return false;
         });
      });
   });
</script>

</body>
</html>