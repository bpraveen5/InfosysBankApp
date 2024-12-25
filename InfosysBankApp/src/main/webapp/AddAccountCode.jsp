<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
    // Retrieve form data
    String card_number = request.getParameter("cno");
    String card_name = request.getParameter("cname");
    String expire_date = request.getParameter("expdate");
    String cvv = request.getParameter("cvv");
    String amount = request.getParameter("amount");

    // Retrieve UID from session (assuming user is logged in and UID is stored in session)
    Integer uid = (Integer) session.getAttribute("uid");

    if (uid == null) {
        out.println("<h2>Error: User is not logged in.</h2>");
    } else {
        // Database connection details
        String dbURL = "jdbc:mysql://localhost:3306/infosysapp"; // replace with your database name
        String dbUser = "root"; // replace with your MySQL username
        String dbPass = "root"; // replace with your MySQL password

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            // Insert data into the cards table with UID
            String sql = "INSERT INTO cards (uid, card_number, card_name, expire_date, cvv, amount) VALUES (?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);

            // Set parameters
            pstmt.setInt(1, uid); // Set UID from session
            pstmt.setString(2, card_number);
            pstmt.setString(3, card_name);
            pstmt.setString(4, expire_date);
            pstmt.setString(5, cvv);
            pstmt.setDouble(6, Double.parseDouble(amount));

            // Execute the update
            int rowsInserted = pstmt.executeUpdate();

            // Output success message
            if (rowsInserted > 0) {
                out.println("<h2>Account added successfully!</h2>");
            } else {
                out.println("<h2>Failed to add account. Please try again.</h2>");
            }

        } catch (SQLException sqlEx) {
            sqlEx.printStackTrace();
            out.println("<h2>Database error: " + sqlEx.getMessage() + "</h2>");
        } catch (NumberFormatException nfe) {
            out.println("<h2>Invalid input for amount. Please enter a valid number.</h2>");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h2>Unexpected error: " + e.getMessage() + "</h2>");
        } finally {
            // Close resources
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }
%>

<a href="AddAccountCode.jsp">Back to Add Account</a>
<a href="welcome.jsp">Back to Home</a>


</body>
</html>