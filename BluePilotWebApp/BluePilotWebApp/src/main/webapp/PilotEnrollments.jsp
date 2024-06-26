<%@page import="java.util.*"%>
<%
String pilotName = (String) session.getAttribute("pilotName");
String pilotEmail = (String) session.getAttribute("pilotEmail");
if (pilotName == null) {
	session.setAttribute("msg", "Please Login!");
	response.sendRedirect("Pilot.jsp");
} else {
%>
<!DOCTYPE html>
<html>
<head>
<title>BluePilot</title>
<link rel="icon" href="resources/bluepilot.png" />

<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js"
	integrity="sha512-6PM0qYu5KExuNcKt5bURAoT6KCThUmHRewN3zUFNaoI6Di7XJPTMoT6K0nsagZKk2OB4L7E3q1uQKHNHd4stIQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- Font Awesome End -->

<!-- Lightbox CSS & Script -->
<script src="resources/lightbox/ekko-lightbox.js"></script>
<link rel="stylesheet" href="resources/lightbox/ekko-lightbox.css" />
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
			<a class="c-logo navbar-brand" href="PilotHome.jsp"> <img
				src="resources/bluepilot.png" alt=""> <span>Blue<strong>Pilot</strong></span>
			</a>
			<button class="navbar-toggler text-white" type="button"
				data-toggle="collapse" data-target="#my-navbar">
				<i class="fa-solid fa-bars"></i> Menu
			</button>
			<div class="collapse navbar-collapse " id="my-navbar">
				<ul class="navbar-nav mx-auto">
					<!-- <ul class="navbar-nav ml-auto">-->
					<!--Right -->
					<!-- <ul class="navbar-nav mr-auto">-->
					<!--Left -->
					<li class="nav-item"><a class="nav-link" href="PilotHome.jsp">Home</a>
					</li>
				</ul>
				<span class="text-white"> <img
					src="GetPhoto?email=<%=pilotEmail%>&userType=pilot" height="40"
					style="border-radius: 50%;" /> Welcome: <b><%=pilotName%></b> <a
					class="btn btn-danger" href="Logout">Logout</a>
				</span>
			</div>
		</nav>
	</header>

	<%
	com.incapp.dao.DAO d = new com.incapp.dao.DAO();
	String status = d.getPilotStatus(pilotEmail);
	%>
	<p class="p-2 bg-warning">
		Status: <b><%=status%></b>
	</p>
	<%
	if (status.equalsIgnoreCase("accepted")) {
	%>
	<section>
  		<%
  			String course_name=request.getParameter("name");
  		%>
  		<div class="p-4 bg-warning">
  			<h3>All Enrollments in <b><%= course_name %></b></h3>
  		</div>
  		<%
  			d=new com.incapp.dao.DAO();
			TreeSet<String> users=d.getAllUsersByCourse(course_name);
			
  			for(String user_email:users){
  				HashMap user=d.getUserByEmail(user_email);
  		%>
  		<div class="p-2 m-2 bg-light">
  			<p>
  			<img src="GetPhoto?email=<%=user_email %>&userType=user" height="40" style="border-radius:50%;" />
  			Name: <%=user.get("name") %> , 
  			Phone: <%=user.get("phone") %>,
  			Age: <%=user.get("age") %> , 
  			Gender: <%=user.get("gender") %> 
  			</p>
  			<p>
  			Address: <%=user.get("address") %>  
  			</p>
  			<form action="PilotConversation.jsp">
  				<input type="hidden" name="user_email" value="<%=user_email%>" />
  				<button class="btn btn-info">Conversations</button>
  			</form>
  		</div>	
  		<%		
  			}
  			d.disconnect();
  		%>
  	</section>
	<%
	}
	%>

	<a id="c-top-button" href="#"><i
		class="fa-solid fa-circle-arrow-up fa-3x"></i></a>
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
	$("#c-top-button").click(function() {
		$("html, body").animate({
			scrollTop : 0
		}, 1000);
	});

	//script for AOS
	AOS.init();
</script>
</html>
<%
}
%>