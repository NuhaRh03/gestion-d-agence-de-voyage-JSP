package ajoutEntite;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/InsertModeratorServlet")
public class InsertModeratorServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set up connection parameters
        String url = "jdbc:mysql://localhost:8080/agancevoyage"; // Corrected port
        String user = "root";
        String password = "221086@Nouha";

        // Get form parameters
        int AdminID = Integer.parseInt(request.getParameter("AdminID"));
        String full_name = request.getParameter("full_name");
        String Username = request.getParameter("Username");
        String Password = request.getParameter("Password");

        // JDBC variables
        Connection conn = null;
        PreparedStatement pstmt = null;
        PrintWriter out = response.getWriter(); // Moved here to ensure it's initialized

        try {
            // Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);

            // Create SQL statement for insertion
            String sql = "INSERT INTO moderator (AdminID, full_name, Username, Password) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, AdminID);
            pstmt.setString(2, full_name);
            pstmt.setString(3, Username);
            pstmt.setString(4, Password);

            // Execute the statement
            int rowsAffected = pstmt.executeUpdate();

            // Display message on the same page
            if (rowsAffected > 0) {
                out.println("<html><body><h2>Data inserted successfully!</h2></body></html>");
            } else {
                out.println("<html><body><h2>Failed to insert data!</h2></body></html>");
            }
        } catch (SQLException | ClassNotFoundException e) {
            // Forward the user to an error page with a meaningful message
            request.setAttribute("errorMessage", "Error occurred while inserting data: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } finally {
            // Close PrintWriter
            if (out != null) {
                out.close();
            }
            // Close JDBC objects
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
