<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="utf-8">
   	<title>Home</title>
   	<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
.carousel-inner > .item > img
   {
      width: 100%;
      height: 910px;
 	  margin: auto;  
  }
  </style>
</head>
<body>
<!-- <div class="container"> -->
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
      <li data-target="#myCarousel" data-slide-to="4"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">

       <div class="item active">
        <img src="/resources/img/seoul.png">
        <div class="carousel-caption">
        </div>
      </div>
      
      <div class="item">
        <img src="/resources/img/seoul2.jpg">
        <div class="carousel-caption">
        </div>
      </div>
      
      <div class="item">
        <img src="/resources/img/festival4.jpg">
        <div class="carousel-caption">
        </div>
      </div>
      
       <div class="item">
        <img src="/resources/img/kbk2.jpg">
        <div class="carousel-caption">
        </div>
      </div>
      
      <div class="item">
        <img src="/resources/img/festival3.jpg">
        <div class="carousel-caption">
        </div>
      </div>
  
    </div>
	
    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
   </div>
<!-- </div> -->
</body>
</html>