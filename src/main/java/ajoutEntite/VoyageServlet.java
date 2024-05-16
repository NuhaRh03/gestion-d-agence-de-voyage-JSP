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

@WebServlet("/AjoutVoyageServlet")
public class VoyageServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set up connection parameters
        String url = "jdbc:mysql://localhost:8080/agancevoyage";
        String user = "root";
        String password = "221086@Nouha";

        // Get form parameters
        int id = Integer.parseInt(request.getParameter("id"));
        String date_depart= request.getParameter("date_depart");
        String date_retour= request.getParameter("date_retour");
        int nb_places = Integer.parseInt(request.getParameter("nb_places"));
        String hotel= request.getParameter("hotel");
        String moy_transport = request.getParameter("moy_transport");
        String typev = request.getParameter("typev");

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
            String sql = "INSERT INTO voyage (id ,date_depart,date_retour, nb_places,hotel, moy_transport, typev) VALUES (?,?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            pstmt.setString(2, date_depart);
            pstmt.setString(3, date_retour);
            pstmt.setInt(4, nb_places);
            pstmt.setString(5, hotel);
            pstmt.setString(6,moy_transport);
            pstmt.setString(7, typev);

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
            request.getRequestDispatcher("login.jsp").forward(request, response);
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
