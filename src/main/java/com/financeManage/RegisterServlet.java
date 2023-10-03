package com.financeManage;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // JDBC URL, username, and password of MySQL server
    private static final String jdbcURL = "jdbc:mysql://localhost:3306/finance";
    private static final String dbUser = "dhakad123";
    private static final String dbPassword = "dhakad123";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String password = request.getParameter("password");

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            // Load the MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Establish connection to the MySQL database
            connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // Check if the email is already registered
            String checkQuery = "SELECT * FROM users WHERE email=?";
            preparedStatement = connection.prepareStatement(checkQuery);
            preparedStatement.setString(1, email);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                // User is already registered
                response.sendRedirect("register.jsp?error=User already registered");
            } else {
                // User is not registered, proceed with registration
                String insertQuery = "INSERT INTO users (fullname, email, mobile, password) VALUES (?, ?, ?, ?)";
                preparedStatement = connection.prepareStatement(insertQuery);
                preparedStatement.setString(1, fullname);
                preparedStatement.setString(2, email);
                preparedStatement.setString(3, mobile);
                preparedStatement.setString(4, password);

                int rows = preparedStatement.executeUpdate();

                if (rows > 0) {
                    // Successful registration
                    response.sendRedirect("index.jsp?message=Registration successful");
                } else {
                    // Registration failed
                    response.sendRedirect("register.jsp?error=Registration failed");
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp?error=An error occurred during registration");
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
