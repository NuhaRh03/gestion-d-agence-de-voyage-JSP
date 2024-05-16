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

@WebServlet("/ajoutVoyageurServlet")
public class VoyageurServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set up connection parameters
        String url = "jdbc:mysql://localhost:8080/agancevoyage";
        String user = "root";
        String password = "221086@Nouha";

        // Get form parameters
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String passport = request.getParameter("passport");
        String id_voyage = request.getParameter("id_voyage");
        String tele = request.getParameter("tele");
        String email = request.getParameter("email");

        // JDBC variables
        Connection conn = null;
        PreparedStatement pstmt = null;

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            // Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);

            // Create SQL statement for insertion
            String sql = "INSERT INTO voyageur (nom, prenom, passport, id_voyage, tele, email) VALUES (?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, nom);
            pstmt.setString(2, prenom);
            pstmt.setString(3, passport);
            pstmt.setString(4, id_voyage);
            pstmt.setString(5, tele);
            pstmt.setString(6, email);

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
