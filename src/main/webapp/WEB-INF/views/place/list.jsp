<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<html>
<head>
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
			</div>

<div style="width: 100%; height: 600px;">

	<div>
		<div class="img_hover"></div>
		<div class="table_img margin_right margin_bottom">
			<img class="table_imgbox fade_in" alt="xx" src="http://tong.visitkorea.or.kr/cms/resource/39/1939139_image2_1.jpg">
		</div>
		<div class="table_img margin_right margin_bottom">
			<img class="table_imgbox" alt="xx" src="http://tong.visitkorea.or.kr/cms/resource/39/1939139_image2_1.jpg">
		</div>
		<div class="table_img margin_bottom">
			<img class="table_imgbox" alt="xx" src="http://tong.visitkorea.or.kr/cms/resource/39/1939139_image2_1.jpg">
		</div>
	</div>
	<div>
		<div class="table_img margin_right margin_bottom">
			<img class="table_imgbox" alt="xx" src="http://tong.visitkorea.or.kr/cms/resource/39/1939139_image2_1.jpg">
		</div>
		<div class="table_img margin_right margin_bottom">
			<img class="table_imgbox" alt="xx" src="http://tong.visitkorea.or.kr/cms/resource/39/1939139_image2_1.jpg">
		</div>
		<div class="table_img margin_bottom">
			<img class="table_imgbox" alt="xx" src="http://tong.visitkorea.or.kr/cms/resource/39/1939139_image2_1.jpg">
		</div>
	</div>
</div>

<h1>호출 결과 보기</h1>
<button id="db" class="btn btn-primary">getJSON form Open API</button>
<button id="clear" class="btn btn-info">clear</button>

<div class="table-responsive">
   <table class="table table-hover">
   <tbody id="result"></tbody>
   </table>
</div>

<c:if test="">

</c:if>
<script id="codeTemp" type="text/xxx-mytemplate">
   {{#each .}}
	<div class="table_img margin_right margin_bottom">
			<img class="table_imgbox" alt="이미지첨부없음" src="{{firstimage}}">
	</div>
   {{/each}}
</script>

<script type="text/javascript">

   var serviceKey = "oMYSCkfnU%2BrM%2F6ad8zAICkGBj0eUCOxJc9bR%2F8MHuzhfo62P6cGA1YVZ7iY5QnDedVyfk5tMhc0Wu42fjDJ%2BcA%3D%3D";
   
      $.getJSON("http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=" + serviceKey + "&contentTypeid=12&areaCode=1&sigunguCode=1&MobileOS=ETC&MobileApp=AppTesting", function(areaCode) {
         // json 객체 내부 접근하기
         
         var items = areaCode.response.body.items.item;
         
         var temp2 = $('#codeTemp').html();
         var template = Handlebars.compile(temp2);
         
         var html = template(items);
         
         $('#result').html(html);
      });
   $('#db').on('click', function() {
   });	   
      
   $('#clear').on('click', function() {
	   $('#result').html("");	   		   
   });
   
   $( ".fade_in" ).click(function() {
	   $( ".img_hover" ).fadeIn( "slow", function() {
	     	console.log("aa");
		   // Animation complete
		   $(".img_hover").show;
	   });
	 });

</script>


	</div>
	<!-- /.row -->

	<script>
		var result = '${msg}';

		if (result == 'SUCCESS') {
			alert("처리가 완료되었습니다.");
			location.replace(self.location);
		}
	</script>

	<script>
		$(document).ready(
				function() {

					$('#searchBtn').on(
							"click",
							function(event) {

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