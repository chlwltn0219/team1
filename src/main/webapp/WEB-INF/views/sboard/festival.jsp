<%@page import="java.util.Calendar"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>행사/공연/축제</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" -->
<!--    href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->

<style>
/* Set height of the grid so .sidenav can be 100% (adjust if needed) */



.row.content {
   height: 1500px
}

/* Set gray background color and 100% height */
.sidenav {
   background-color: #f1f1f1;
   height: 100%;
}

/* Set black background color, white text and some padding */
footer {
   background-color: #555;
   color: white;
   padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
   .sidenav {
      height: auto;
      padding: 15px;
   }
   .row.content {
      height: auto;
   }
}
</style>
</head>
<body>

<%!
   public static String getdate(int mountdate){
   
   DecimalFormat df = new DecimalFormat("00");
   Calendar calendar = Calendar.getInstance();
   
   calendar.add(calendar.DATE, mountdate);
   
      String year = 
         Integer.toString(calendar.get(Calendar.YEAR)); //년
         
      String month =
         df.format(calendar.get(Calendar.MONTH) + 1);   //달
         
//       String day = 
//          df.format(calendar.get(Calendar.DATE));       //일

       String date = year + month ;
         
      return date;
}
%>

   <div class="container-fluid">
      <div class="row content">
        
            <h3>행사 / 공연  / 축제</h3>
            <ul class="nav nav-pills nav-stacked">
               <li>9월</li>
               <label><input type="date" id="start"></label>
               
               <hr>
               <li ><a href="#section1">대분류</a>
               <a href="/sboard/list">중분류</a>
               <a href="/sboard/openAPI.jsp">소분류</a>
               </li>
            </ul>
            <br>
            <div class="input-group">
               <input type="text" class="form-control" placeholder="search">
               <span class="input-group-btn">
                  <button class="btn btn-default" type="button">
                     <span class="glyphicon glyphicon-search"></span>
                  </button>
               </span>
            </div>
       

         <div class="col-sm-9">
			<select id="range">
				<option value="date">날짜순</option>
				<option value="hits">조회수순</option>
			</select>            
            <hr>
            
          
        
<!--                <span class="glyphicon glyphicon-time"></span> Post by John Doe, -->
             
<!--                <span class="label label-success">Lorem</span> -->
          
            <form role="form">
               <div class="form-group">
                  <textarea class="form-control" rows="3" required></textarea>
               </div>
              
            </form>
       

            <div class="row">
               <div class="col-sm-2 text-center">
                
               </div>
               <div class="col-sm-10">
                 
               </div>
               <div class="col-sm-2 text-center">
                 
               </div>
               <div class="col-sm-10">
                 
                 
                     <span class="badge">1</span> 
                
                  <div class="row">
                     <div class="col-sm-2 text-center">
                       
                     </div>
                     <div class="col-xs-10">
                     
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>

   <footer class="container-fluid">
      <p>Footer Text</p>
   </footer>

<script>

$("#")

</script>


</body>
</html>