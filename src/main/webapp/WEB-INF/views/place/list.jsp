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
               <div class="selectBox" >
                  <label>지역: &nbsp;</label>
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
                  <label>&nbsp;&nbsp;컨텐츠: &nbsp;</label>
                  <select id="content">
                        <option value="12">문화재</option>
                        <option value="14">문화시설</option>
                     </select>
               </div>
               
            
            </div>
         </div>
         
<!--          <div class="table-responsive" style="width: 100%"> -->
            <div class="fList table-hover">
               <div id="result"></div>
            </div>
            <div id="pagination"></div>            
<!--          </div> -->
      </div>
   </div>
         
   <a class="return-top" href="#" style="right:27px; bottom:50px; position:fixed; z-index:9999;">
      <img src="http://cfs.tistory.com/custom/blog/202/2025510/skin/images/top1.png">
   </a>

<script id="codeTemp" type="text/xxx-mytemplate">
   <div class="table_list imgbox_hover">
      <a href="/place/detailList${placePageMaker.makeQuery(placePageMaker.cri.page) }&contentid={{contentid}}">
         <img class="table_imgbox" src="{{firstimage}}">
         <div class="info">
            <br>
            <div>
               <div class="title"><h3>{{title}}</h3></div>
               <div class="addr"><h4>{{addr1}}</h4></div>
            </div>
         </div>
      </a>
   </div>
</script>

<script id="pageTemp" type="text/x-handlebars-template">
   <button id="prev" type="button" class="btn btn-default" style="visibility: {{visiblility prev}}">Prev</button>
      <div class="btn-group">
         {{#pageMaker startPage endPage 1}}
            <button type="button" class="btn btn-default page {{this.active}}" value={{this.pageNo}}>{{this.pageNo}}</button>
         {{/pageMaker}}
      </div>
   <button id="next" type="button" class="btn btn-default" style="visibility: {{visiblility next}}">Next</button>
</script>

<script type="text/javascript">
     var pageNo = 1;
      getList(1, 1);
      
      
      function getList(pageNo, sigunguCode, contentTypeId) {
      /* default Page */
         
         sigunguCode = $('#gu option:selected').val();
         contentTypeId = $('#content option:selected').val();
         
      $.getJSON("/place/common?sigunguCode=" + sigunguCode +"&contentTypeId="+ contentTypeId + "&pageNo=" + pageNo, function(data) {
         
       var items = data.items.item;
       var pageMaker = data.pageMaker;
          
       var temp2 = $('#codeTemp').html();
       var template = Handlebars.compile(temp2);
          
         var page = $('#pageTemp').html();
      var pageTemplate = Handlebars.compile(page);
      var pagehtml = pageTemplate(pageMaker);
      $('#pagination').html(pagehtml);
   
      setPaginationEvent(data);
          
       $('#result').html("");
          
       for(var i=0; i<items.length; i++) {
         var html = template(items[i]);
          $('#result').append(html);
          imgCheck(i);
          imgHover();
          }
       });
   }

        /* select 버튼 클릭시 */
        $('#gu').on('change', function() {
           
           var sigunguCode = $('#gu option:selected').val();
              var contentTypeId = $('#content option:selected').val();
           
           $.getJSON("/place/common?sigunguCode=" + sigunguCode + "&contentTypeId="+ contentTypeId + "&pageNo=" + pageNo, function(data) {
                 
                var items = data.items.item;
                var pageMaker = data.pageMaker;
                 
                var temp2 = $('#codeTemp').html();
                var template = Handlebars.compile(temp2);
                 
                var page = $('#pageTemp').html();
               var pageTemplate = Handlebars.compile(page);
               var pagehtml = pageTemplate(pageMaker);
               $('#pagination').html(pagehtml);
            
               setPaginationEvent(data);
                 
                $('#result').html("");
                 
                for(var i=0; i<items.length; i++) {
                  var html = template(items[i]);
                   $('#result').append(html);
                   imgCheck(i);
                   imgHover();
                }
             });
        });
        
        /* select 버튼 클릭시 */
        $('#content').on('change', function() {
           
           var sigunguCode = $('#gu option:selected').val();
              var contentTypeId = $('#content option:selected').val();
           
           $.getJSON("/place/common?sigunguCode=" + sigunguCode + "&contentTypeId="+ contentTypeId + "&pageNo=" + pageNo, function(data) {
                 
                var items = data.items.item;
                var pageMaker = data.pageMaker;
                 
                var temp2 = $('#codeTemp').html();
                var template = Handlebars.compile(temp2);
                 
                var page = $('#pageTemp').html();
               var pageTemplate = Handlebars.compile(page);
               var pagehtml = pageTemplate(pageMaker);
               $('#pagination').html(pagehtml);
            
               setPaginationEvent(data);
                 
                $('#result').html("");
                 
                for(var i=0; i<items.length; i++) {
                  var html = template(items[i]);
                   $('#result').append(html);
                   imgCheck(i);
                   imgHover();
                }
             });
        });
   
   
   /* img url주소 null값 일때, 대체 이미지 */   
   function imgCheck(i) {
      if($('div.table_list img').eq(i).attr('src')==''){
         $('div.table_list img').eq(i).attr('src','/resources/img/noImage.png');
      }
   };
   /* image Hover Event */
   function imgHover() {
      $(".imgbox_hover").on({
           mouseenter: function(){
              var index = getIndex(this);
              if(!$(".table_imgbox").eq(index).is(':animated')){
                 $(".table_imgbox").eq(index).fadeTo('slow', 0.2);
              }
               if(!$('.info').eq(index).is(':animated')) {
               $('.info').eq(index).fadeIn();                  
               }
           },
           mouseleave: function(){
              var index = getIndex(this);   
              $(".table_imgbox").eq(index).stop().fadeTo('slow',1);              
               $('.info').fadeOut();
           }
       });
      
   }
   /* 각각의 이미지 객체 리턴 값 */
   function getIndex(obj) {
      return $('.imgbox_hover').index(obj);
   }
</script>

<script type="text/javascript">
   /* Paging Event */
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
       
       return accum;
   });
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

</body>
</html>