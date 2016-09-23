<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- CSS -->
<link href="/resources/css/place2.css" rel="stylesheet" type="text/css" />

<title>SINAE_Detail.jsp</title>
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet"
   href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
   src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Font Awesome Icons -->
<link
   href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
   rel="stylesheet" type="text/css" />
<!-- jQuery 2.1.4 -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- HandleBars -->
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<!-- GoogoleMap Asynchronously Loading the API ********************************************* -->
<script async defer
   src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAA4WMo8DvHp--izPUaJTqHDV0wJotTBpc"></script>
<style type="text/css">

</style>
</head>

<body>

   <div class="row">
      <div class="col-md-12">
         <div class="box">
            <div class="box-header with-border">
               <h3 class="box-title">
                  <b>상세보기</b>
               </h3>
            </div>
            <hr>
            <div id="result"></div>
<!--             <div id="map" style="width:100%; height: 400px"></div>    -->

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
                           <button type="button" class="btn btn-default"
                              data-dismiss="modal">Close</button>
                        </div>
                     </div>

                  </div>
               </div>
            
         </div>
      </div>
   </div>
   <div>
      <button></button>
      <a type="submi"></a>
   </div>

   <script id="codeTemp" type="text/xxx-mytemplate">
         <div class="centered">
            <h2>{{title}}</h2><br>
            <img class="img1" src="{{firstimage}}">
         </div>
         <div class="detail">
            <p>
               <ul>
                  <li><b>소개 : </b> <br><br> <p id="overview" class="detailtext"></p></li><br>
                  <li><b>주소 : </b> 
                     <p class="detailtext"> {{addr1}}&nbsp;&nbsp;&nbsp; 
                        <a type="submit" data-toggle="modal" data-target="#myModal">
                           <img class="btn_map" src="/resources/img/location.png">
                        </a>
                     </p>
                  </li>
                  <li><b>홈페이지 : </b> <p class="detailtext" id="homepage"></p></li><br>
               </ul>
            </p>
         </div>
   </script>

   <script type="text/javascript">
   
      var items;
      var mapzoom;
      var title;
      
      $("#myModal").on('shown.bs.modal', function () {
         initMap(items.mapx, items.mapy);
         
         
      });

      //////////////////////////////////////////////////   Map
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

      });
      
   </script>

</body>
</html>