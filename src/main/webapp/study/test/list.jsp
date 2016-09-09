<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<html>
<head>
<title>list.jsp</title>
<!-- Bootstrap 3.3.4 -->
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<!-- Font Awesome Icons -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!-- jQuery 2.1.4 -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- HandleBars -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>

   <div class="row">
      <!-- left column -->

      <div class="col-md-12">
         <!-- general form elements -->
         <div class='box'>
            <div class="box-header with-border">
               <h3 class="box-title">Board List</h3>
            </div>
            <h3>호출 결과 보기</h3>
            
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
            
            
            <button id="getjson" class="btn btn-primary">getJSON form Open API</button>
            <button id="clear" class="btn btn-info">clear</button>

            <div class="table-responsive">
               <table class="table table-hover">
                  <thead>
                     <tr>
                        <th>제목</th>
                        <th>주소</th>
                        <th>이미지</th>
                     </tr>
                  </thead>
                  <tbody id="result"></tbody>
               </table>
            </div>


<script id="codeTemp" type="text/xxx-mytemplate">

   {{#each .}}
   <tr>
      <td>{{title}}</td>
      <td>{{addr1}}</td>
      <td><img src="{{firstimage2}}" style="width:150px; height:100px;"></td>
   </tr>
   {{/each}}

</script>


<script type="text/javascript">


   var serviceKey = "oMYSCkfnU%2BrM%2F6ad8zAICkGBj0eUCOxJc9bR%2F8MHuzhfo62P6cGA1YVZ7iY5QnDedVyfk5tMhc0Wu42fjDJ%2BcA%3D%3D";
   
   $('#getjson').on('click', function() {
            
	   sigunguCode = $('#gu option:selected').val();
	   
      
      $.getJSON("http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=" + serviceKey + "&areaCode=1&sigunguCode="+ sigunguCode +"&contentTypeid=12&numOfRows=50&MobileOS=ETC&MobileApp=TestApp&_type=json", function(areaCode) {
         // json 객체 내부 접근하기
         console.dir(areaCode);
         console.log(areaCode);
         console.log(areaCode.response);
         console.log(areaCode.response.body);
         console.log(areaCode.response.body.items);
         console.log(areaCode.response.body.items.item);
         
         var items = areaCode.response.body.items.item;
         
         var temp2 = $('#codeTemp').html();
         var template = Handlebars.compile(temp2);
         
         var html = template(items);
         console.log(html);
         
         
         $('#result').html(html);
         
      });
   });
   
   $('#clear').on('click', function() {
      $('#result').html("");
   });
   
   $('#MyLoc').on('click', function() {
      
   });

</script>

      </div>
   </div>
</div>



   <!-- /.row -->
</body>
</html>