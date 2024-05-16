package login;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;



import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class ServletLogin extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
            
            // Connect to the database
            String url = "jdbc:mysql://localhost:8080/agancevoyage";
            String dbUsername = "root";
            String dbPassword = "221086@Nouha";
            conn = DriverManager.getConnection(url, dbUsername, dbPassword);
            
            // Check in the admin table
            String adminQuery = "SELECT * FROM admin WHERE Username=? AND Password=?";
            pst = conn.prepareStatement(adminQuery);
            pst.setString(1, username);
            pst.setString(2, password);
            rs = pst.executeQuery();
            
            if (rs.next()) {
                // Authentication successful
                out.println("Login successful as admin!");
                jakarta.servlet.RequestDispatcher dispatcher = request.getRequestDispatcher("/formvoyage.jsp");
                dispatcher.forward(request, response);
                return;
                
            }
            
            // Check in the moderator table
            String moderatorQuery = "SELECT * FROM moderator WHERE Username=? AND Password=?";
            pst = conn.prepareStatement(moderatorQuery);
            pst.setString(1, username);
            pst.setString(2, password);
            rs = pst.executeQuery();
            
            if (rs.next()) {
                // Authentication successful
                out.println("Login successful as moderator!");
                jakarta.servlet.RequestDispatcher dispatcher = request.getRequestDispatcher("/formvoyage.jsp");
                dispatcher.forward(request, response);
                return;
                
            }
            
            // Authentication failed
            out.println("Invalid username or password!");
        } catch (Exception e) {
            out.println("Exception occurred: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                out.println("Exception occurred during cleanup: " + e.getMessage());
            }
        }
    }
}

