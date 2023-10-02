<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
    <a href="index.jsp" class="home-link" > &#x1F3E0 Home</a>
    <a href="register.jsp">Sign Up </a>
    <a href="login.jsp">Login </a>
  </div>
</nav>
<div id="registration-form">
  <div class='fieldset'>
    <legend>Sign Up</legend>
    <form action="#" method="post" data-validate="parsley">
      <div class='row'>
        <label for='firstname'>Full Name</label>
        <input type="text" placeholder="full Name" name='firstname' id='firstname' data-required="true" data-error-message="Your First Name is required">
      </div>
      <div class='row'>
        <label for="email">E-mail</label>
        <input type="text" placeholder="abc@gmail.com"  name='email' data-required="true" data-type="email" data-error-message="Your E-mail is required">
      </div>
      <div class='row'>
        <label for="cemail">Mobile Number</label>
        <input type="text" placeholder="8467099999" name='cemail' data-required="true" data-error-message="Your E-mail must correspond">
      </div>
      <div class='row'>
        <label for="cemail">Password</label>
        <input type="password" placeholder="" name='cemail' data-required="true" data-error-message="Your E-mail must correspond">
      </div>
      <input type="submit" value="Register">
      <br>
      <br>
      <a href="login.jsp" style="margin-left:40%;">Login ? if already register</a>
    </form>
  </div>
</div>

</body>
</html>