<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="sidebar-01/css/style.css">
		<link rel="stylesheet" href="homepage.css">
</head>
<body>
<nav class="navbar">

  <div class="company-name">
    FinanaceFolio
  </div>
  <div class="navbar-links">
    <a href="index.jsp" class="home-link" > Home</a>
    <a href="register.jsp">Sign Up </a>
    <a href="login.jsp">Login </a>
  </div>
</nav>
  <div id="registration-form">
  <div class='fieldset'>
    <legend>Login</legend>
    <form action="LoginServlet" method="post" data-validate="parsley">
      
      <div class='row'>
        <label for="email">E-mail</label>
        <input type="text" placeholder="abc@gmail.com"  name='email' data-required="true" data-type="email" data-error-message="Your E-mail is required">
      </div>
      
      <div class='row'>
        <label for="cemail">Password</label>
        <input type="password" placeholder="" name='password' data-required="true" data-error-message="Your E-mail must correspond">
      </div>
      <!-- Display error message if there's an error -->
                
      
      <input type="submit" value="Log In">
      <div>
                    <% String errorMessage = request.getParameter("error"); %>
                    <% if (errorMessage != null && !errorMessage.isEmpty()) { %>
                        <div style="color: red;">
                           <span style="margin-left:40%;"> <strong><%= errorMessage %></strong></span>
                        </div>
                    <% } %>
                </div>
      
      <a href="register.jsp" style="margin-left:40%;">Sign up ? if not register</a>
   
    </form>
  </div>
</div>
</body>
</html>