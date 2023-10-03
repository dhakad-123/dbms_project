package com.financeManage;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
    private static final String jdbcURL = "jdbc:mysql://localhost:3306/finance";
    private static final String dbUser = "dhakad123"; // Update with your database username
    private static final String dbPassword = "dhakad123"; // Update with your database password

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        // Validate passwords (e.g., match new password and confirm password)
        if (!newPassword.equals(confirmPassword)) {
            // Handle password mismatch error
            response.sendRedirect("dashboard.jsp?error=Passwords do not match");
            return;
        }

        // Here, you should have code to validate the current password from the database
        // Assuming you have a method to validate the current password
        // If the current password is not valid, redirect with an error message

        // Assuming you have a method to update the password in the database
        if (updatePasswordInDatabase(newPassword)) {
            // Password updated successfully
            response.sendRedirect("dashboard.jsp?success=Password updated successfully");
        } else {
            // Handle error while updating the password
            response.sendRedirect("dashboard.jsp?error=An error occurred while updating the password");
        }
    }

    private boolean updatePasswordInDatabase(String newPassword) {
    	 try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword)) {
    	        String updateQuery = "UPDATE users SET password = ? WHERE fullname = ?"; // Assuming username is the correct column
    	        try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
    	            preparedStatement.setString(1, newPassword);
    	            preparedStatement.setString(2, getUsernameFromSession()); // Get the username from the session

    	            int rowsUpdated = preparedStatement.executeUpdate();
    	            return rowsUpdated > 0;
    	        }
    	    } catch (SQLException e) {
    	        e.printStackTrace();
    	        return false;
    	    }
    }

    private String getUsernameFromSession() {
        // Implement a method to get the username from the session
        // You'll need to retrieve the username from the session or wherever it's stored
        // For demonstration, let's assume you have a method to retrieve it
        // Modify this according to your session handling
        // For example: return (String) request.getSession().getAttribute("username");
        return "username"; // Replace with your actual username retrieval logic
    }
}

