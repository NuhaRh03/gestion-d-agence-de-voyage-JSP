<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Voyage Information</title>
</head>
<body>
    <h2>Search Voyage Information</h2>
    <form method="post" action="">
        <label for="searchType">Search by:</label>
        <select name="searchType" id="searchType">
            <option value="id">ID Voyage</option>
            <option value="date">Date of Departure</option>
        </select>
        <input type="text" name="searchValue" id="searchValue" required>
        <input type="submit" value="Search">
    </form>
    <br>

    <%
        String searchType = request.getParameter("searchType");
        String searchValue = request.getParameter("searchValue");

        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            // Establish database connection
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/agencevoyage";
            String dbUsername = "root";
            String dbPassword = "your_password_here";
            conn = DriverManager.getConnection(url, dbUsername, dbPassword);

            // Perform search based on the selected criteria
            String sql = "SELECT v.id, v.date_depart, v.typev, vr.nom, vr.passport " +
                         "FROM voyage v JOIN voyageur vr ON v.id = vr.id_voyage " +
                         "WHERE ";

            if (searchType.equals("id")) {
                sql += "v.id = ?";
            } else if (searchType.equals("date")) {
                sql += "v.date_depart = ?";
            }

            pst = conn.prepareStatement(sql);
            pst.setString(1, searchValue);
            rs = pst.executeQuery();

            // Display search results
            out.println("<h3>Search Results:</h3>");
            out.println("<table border='1'>");
            out.println("<tr><th>ID Voyage</th><th>Date of Departure</th><th>Type</th><th>Nom</th><th>Passport</th></tr>");

            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getInt("id") + "</td>");
                out.println("<td>" + rs.getDate("date_depart") + "</td>");
                out.println("<td>" + rs.getString("typev") + "</td>");
                out.println("<td>" + rs.getString("nom") + "</td>");
                out.println("<td>" + rs.getString("passport") + "</td>");
                out.println("</tr>");
            }

            out.println("</table>");
        } catch (Exception e) {
            out.println("Exception occurred: " + e.getMessage());
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                out.println("Exception occurred during cleanup: " + e.getMessage());
            }
        }
    %>
</body>
</html>
