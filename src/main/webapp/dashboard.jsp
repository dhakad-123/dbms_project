<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!doctype html>
<html lang="en">
  <head>
  	<title>Welcome</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="sidebar-01/css/style.css">
		<link rel="stylesheet" href="homepage.css">
		<script type="text/javascript"  src="script1.js"></script>
		<script>
        <% String error = request.getParameter("error");
           String success = request.getParameter("success");
           if (error != null) {%>
            alert('<%= error %>');
        <%}
           if (success != null) {%>
            alert('<%= success %>');
        <%} %>
    </script>
  </head>
  <body>
		
		<div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar">
				<div class="p-4 pt-5">
		  		<a href="#" class="img logo rounded-circle mb-5" style="background-image: url(sidebar-01/images/logo.jpg);"></a>
	        <ul class="list-unstyled components mb-5">
	          <li class="active"  >
	            <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" onclick="changeContent('dashboard')">Dashboard</a>
	            
	          </li>
	         <!--  <li>
	              <a href="#">Dashboard</a>
	          </li>-->
	          <li>
              <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Expenses</a>
              <ul class="collapse list-unstyled" id="pageSubmenu">
                <li>
                    <a href="#" onclick="changeContent('add expense')">Add expenses</a>
                </li>
                <li>
                    <a href="#">Manage Expense</a>
                </li>
                
              </ul>
	          </li>
			 <li>
              <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Expense report</a>
              <ul class="collapse list-unstyled" id="pageSubmenu">
                <li>
                    <a href="#">Daywise Expenses</a>
                </li>
                <li>
                    <a href="#">Monthwise expenses</a>
                </li>
                <li>
                    <a href="#">Yearwise expenses</a>
                </li>
              </ul>
	          </li>
	          <li>
              <a href="#" onclick="changeContent('profile')">Profile</a>
	          </li>
	          <li>
	              <a href="#" onclick="changeContent('change pwd')">Change Password</a>
	          </li>
	          <li>
              <a href="LogoutServlet">LogOut</a>
	          </li>
	          
	        </ul>

	        <div class="footer">
	        	<p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved 
						  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
	        </div>

	      </div>
    	</nav>

        <!-- Page Content  -->
      <div id="content" class="p-4 p-md-5">

        <nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding:0.5em; margin-top:0;">
          <div class="container-fluid">

            <button type="button" id="sidebarCollapse" class="btn btn-primary">
              <i class="fa fa-bars"></i>
              <span class="sr-only">Toggle Menu</span>
            </button>
            <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fa fa-bars"></i>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="nav navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#"> <span style="color:green;font-size:20px;"><strong>Welcome, ${sessionScope.username}</strong></span></a>
                </li>
               
              </ul>
            </div>
          </div>
        </nav>
        <div>
        <!-- <h2 class="mb-4">Sidebar #01</h2>
        
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>-->
        <div class="content" id="dynamic-content">
      			<div class="dashboard">
    <div class="box box-total">
      <h2>Total Expenses (Last 7 Days)</h2>
      <p id="lastSevenDaysExpense">$0</p>
    </div>
    <div class="box box-total">
      <h2>Total Expenses (Last Month)</h2>
      <p id="lastMonthExpense">$0</p>
    </div>
    <div class="box box-total">
      <h2>Total Expenses (Last Year)</h2>
      <p id="lastYearExpense">$0</p>
    </div>
    <div class="box box-current">
      <h2>Current Expenses</h2>
      <p id="currentExpense">$0</p>
    </div>
  </div>
        </div>
      </div>
      </div>
		</div>

    <script src="sidebar-01/js/jquery.min.js"></script>
    <script src="sidebar-01/js/popper.js"></script>
    <script src="sidebar-01/js/bootstrap.min.js"></script>
    <script src="sidebar-01/js/main.js"></script>
   
  </body>
</html>