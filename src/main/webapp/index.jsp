<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FinanceFolio</title>
<link rel="stylesheet" href="homepage.css">
</head>
<body  style="background:black">
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
<div class="context">
        <div id="tagline"></div>
    </div>
 <div class="area" >
            <ul class="circles">
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
            </ul>
</div >
    <script src="script1.js"></script>  
     <script>
        // Check if success parameter is present in the URL
        const urlParams = new URLSearchParams(window.location.search);
        const successMessage = urlParams.get('message');

        if (successMessage) {
            // Display an alert with the success message
            alert(successMessage);
        }
    </script>
    
</body>
</html>