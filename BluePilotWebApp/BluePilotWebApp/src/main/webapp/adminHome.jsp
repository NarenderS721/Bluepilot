<%@page import="java.util.*"%>
<% 
	String adminName=(String)session.getAttribute("adminName");
	if(adminName==null){
		session.setAttribute("msg", "Please Login!");
		response.sendRedirect("index.jsp");
	}else{
%>
<!DOCTYPE html>
<html>
<head>
  <title>BluePilot</title>
  <link rel="icon" href="resources/bluepilot.png" />

  <meta name="viewport" content="width=device-width, initial-scale=1">

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"/>

  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js" integrity="sha512-6PM0qYu5KExuNcKt5bURAoT6KCThUmHRewN3zUFNaoI6Di7XJPTMoT6K0nsagZKk2OB4L7E3q1uQKHNHd4stIQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <!-- Font Awesome End -->
  
  <!-- Lightbox CSS & Script -->
  <script src="resources/lightbox/ekko-lightbox.js"></script>
  <link rel="stylesheet" href="resources/lightbox/ekko-lightbox.css"/>
  <!-- Lightbox END -->

  <!-- AOS css and JS -->
  <link rel="stylesheet" href="resources/aos/aos.css">
  <script src="resources/aos/aos.js"></script>
  <!-- AOS css and JS END-->

  <!-- custom css-->
  <link rel="stylesheet" href="resources/custom.css" />
  <!-- custom css END-->

  <meta name="author" content="Narender Singh" />
  <meta name="description" content="This is a website for Pilot Courses." />
  <meta name="keywords" content="best pilot training in the world" />
</head>

<body>
	<header>
	  <nav class="navbar navbar-expand-sm">
      <a class="c-logo navbar-brand" href="adminHome.jsp">
        <img src="resources/bluepilot.png" alt="">
        <span>Blue<strong>Pilot</strong></span>
      </a>
      <button class="navbar-toggler text-white" type="button" data-toggle="collapse" data-target="#my-navbar" >
        <i class="fa-solid fa-bars"></i> Menu
      </button>
      <div class="collapse navbar-collapse " id="my-navbar">
        <ul class="navbar-nav mx-auto">
        <!-- <ul class="navbar-nav ml-auto">--> <!--Right -->
        <!-- <ul class="navbar-nav mr-auto">--> <!--Left -->
          <li class="nav-item">
            <a class="nav-link" href="adminHome.jsp">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="adminCourses.jsp">Courses</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="adminPilots.jsp">Pilots</a>
          </li>
        </ul>
        <span class="text-white">
          Welcome: <b><%= adminName %></b>
          <a class="btn btn-danger"  href="Logout">Logout</a>
        </span>
      </div>
    </nav>
	</header>
  
  	<section>
  		<div class="p-4 bg-warning">
  			<h1>All Enquiries</h1>
  		</div>
  		<%
  			com.incapp.dao.DAO d=new com.incapp.dao.DAO();
  			ArrayList<HashMap> enquiries=d.getAllEnquiries();
  			d.disconnect();
  			for(HashMap enquiry:enquiries){
  		%>
  		<div class="p-2 m-2 bg-light">
  			<p>
  			Name: <%=enquiry.get("name") %> , 
  			Phone: <%=enquiry.get("phone") %> 
  			[<%=enquiry.get("status") %>]
  			<%
  				if(enquiry.get("status").equals("pending")){
	  			%>		
	  				<a class="btn btn-success"  href="EnquiryStatusUpdate?id=<%=enquiry.get("id") %>">DONE</a>
	  			<% 
  				}
  			%>
  			</p>
  		</div>	
  		<%		
  			}
  		%>
  	</section>
  
	<a id="c-top-button" href="#" ><i class="fa-solid fa-circle-arrow-up fa-3x"></i></a>
</body>

<script>
    //Script for Scroll to Top button for hide and show
    $(window).scroll(function() {
      if ($(this).scrollTop()) {
          $('#c-top-button').fadeIn();
      } else {
          $('#c-top-button').fadeOut();
      }
    });
    //script for scroll to top
    $("#c-top-button").click(function () {
        $("html, body").animate({scrollTop: 0}, 1000);
    });

    //script for AOS
    AOS.init();

</script>
</html>
<%		
	}
%>