package ajoutEntite;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import models.Voyage;

public class VoyageServletView extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// JDBC URL, username, and password of MySQL server
    private static final String url = "jdbc:mysql://localhost:8080/agancevoyage";
    private static final String user = "root";
    private static final String password = "2210868@Nouha";

    // Method to handle GET requests
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve query parameter to determine action
        String action = request.getParameter("action");

        if (action == null) {
            // Default action - Display all voyages
            displayAllVoyages(request, response);
        } else if (action.equals("delete")) {
            // Action to delete a voyage
            deleteVoyage(request, response);
        } else if (action.equals("update")) {
            // Action to update a voyage
            updateVoyage(request, response);
        } else if (action.equals("select")) {
            // Action to select a specific voyage
            selectVoyage(request, response);
        }
    }

    // Method to display all voyages
    private void displayAllVoyages(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Connect to the database and retrieve all voyages
        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM voyage");

            // Process the result set and forward to JSP for display
            request.setAttribute("voyageList", rs);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/voyageview.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }

    // Method to delete a voyage
    private void deleteVoyage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        // Connect to the database and delete the voyage
        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            PreparedStatement stmt = conn.prepareStatement("DELETE FROM voyage WHERE id=?");
            stmt.setInt(1, id);
            stmt.executeUpdate();

            response.sendRedirect(request.getContextPath() + "/VoyageServletView");
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }

    // Method to update a voyage
    private void updateVoyage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        int id = Integer.parseInt(request.getParameter("id"));
        Date dateDepart = Date.valueOf(request.getParameter("date_Depart"));
        Date dateRetour = Date.valueOf(request.getParameter("date_Retour"));
        int nbPlaces = Integer.parseInt(request.getParameter("nb_Places"));
        String hotel = request.getParameter("hotel");
        String moyTransport = request.getParameter("moy_Transport");
        String typev = request.getParameter("typev");

        // Create a Voyage object
        Voyage voyage = new Voyage(id, dateDepart, dateRetour, nbPlaces, hotel, moyTransport, typev);

        // Connect to the database and update the voyage
        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            PreparedStatement stmt = conn.prepareStatement("UPDATE voyage SET date_Depart=?, date_Retour=?, nb_Places=?, hotel=?, moy_Transport=?, typev=? WHERE id=?");
            stmt.setDate(1, voyage.getDateDepart());
            stmt.setDate(2, voyage.getDateRetour());
            stmt.setInt(3, voyage.getNbPlaces());
            stmt.setString(4, voyage.getHotel());
            stmt.setString(5, voyage.getMoyTransport());
            stmt.setString(6, voyage.getTypev());
            stmt.setInt(7, voyage.getId());
            stmt.executeUpdate();

            response.sendRedirect(request.getContextPath() + "/voyageview");
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }

    // Method to select a specific voyage
    private void selectVoyage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        // Connect to the database and retrieve the selected voyage
        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM voyage WHERE id=?");
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            // Process the result set and forward to JSP for display
            request.setAttribute("selectedVoyage", rs);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/voyageview.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}

