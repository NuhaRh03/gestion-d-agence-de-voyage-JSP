package ajoutEntite;

import models.Moderateur;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ModerateurServlet", urlPatterns = {"/ModerateurServlet"})
public class ModerateurServlet extends HttpServlet {
    private static final String JDBC_URL = "jdbc:mysql://localhost:8080/agancevoyage";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "221086@Nouha";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch data from the database
        List<Moderateur> moderators = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
            String query = "SELECT * FROM moderator";
            try (PreparedStatement pstmt = conn.prepareStatement(query);
                 ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    int adminID = rs.getInt("AdminID");
                    String fullName = rs.getString("full_name");
                    String username = rs.getString("Username");
                    String password = rs.getString("Password");
                    moderators.add(new Moderateur(adminID, fullName, username, password));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle SQL exception
        }

        // Set the data as a request attribute
        request.setAttribute("moderators", moderators);

        // Forward to the JSP to display the data
        request.getRequestDispatcher("Moderateurview.jsp").forward(request, response);
    }
}
