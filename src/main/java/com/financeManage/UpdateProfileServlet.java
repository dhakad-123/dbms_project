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

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
    private static final String jdbcURL = "jdbc:mysql://localhost:3306/finance";
    private static final String dbUser = "dhakad123"; // Update with your database username
    private static final String dbPassword = "dhakad123"; // Update with your database password

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fullName = request.getParameter("fullname");
        String email = request.getParameter("email");
        String mobileNumber = request.getParameter("mobileNumber");
       // String registrationDate = request.getParameter("registrationDate");

        if (updateProfileInDatabase(fullName, email, mobileNumber)) {
            // Profile updated successfully
            response.sendRedirect("dashboard.jsp?success=Profile updated successfully");
        } else {
            // Handle error while updating the profile
            response.sendRedirect("dashboard.jsp?error=An error occurred while updating the profile");
        }
    }

    private boolean updateProfileInDatabase(String fullName, String email, String mobileNumber) {
        try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword)) {
            String updateQuery = "UPDATE users SET fullname = ?, email = ?, mobile_number = ?, registration_date = ? WHERE username = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
                preparedStatement.setString(1, fullName);
                preparedStatement.setString(2, email);
                preparedStatement.setString(3, mobileNumber);

                preparedStatement.setString(4, getUsernameFromSession()); // Assuming you have a method to retrieve the username

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
        // Modify this according to your session handling
        // For example: return (String) request.getSession().getAttribute("username");
        return "username"; // Replace with your actual username retrieval logic
    }
}
