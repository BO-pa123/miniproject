<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
    // Establish connection to MySQL database
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","Parimala@12345");

    // Get the room number from the request parameter
    int roomNo = Integer.parseInt(request.getParameter("roomNo"));
    String yearsection = request.getParameter("yearsection");
    
    // Query to fetch data based on the room number
    String query = "SELECT * FROM room_details WHERE roomno = ?";
    PreparedStatement pstmt = conn.prepareStatement(query);
    pstmt.setInt(1, roomNo);

    // Execute the query
    ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Room Details</title>
    
</head>
<body>
<center>
    <h1>IT ROOM NO <%= roomNo %></h1>
    <table border="5px" >
        <thead>
            <tr>
                <th>Room No</th>
                <th>No.of Blackboards</th>
                <th>Projector/TV Availability</th>
                <th>No.of Benches</th>
                <th>LAN connection Availability</th>
                <th>No.of AC's</th>
                <th>No.of fans</th>
                <th>No.of Lights</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Display fetched data
                while(rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getString("roomno") + "</td>");
                    out.println("<td>" + rs.getString("no_of_blackboards") + "</td>");
                    out.println("<td>" + rs.getString("projector_tv_availability") + "</td>");
                    out.println("<td>" + rs.getString("no_of_benches") + "</td>");
                    out.println("<td>" + rs.getString("lan_connection_availability") + "</td>");
                    out.println("<td>" + rs.getString("no_of_acs") + "</td>");
                    out.println("<td>" + rs.getString("no_of_fans") + "</td>");
                    out.println("<td>" + rs.getString("no_of_lights") + "</td>");
                    out.println("</tr>");
                }

                // Close resources
                rs.close();
                pstmt.close();
                conn.close();
            %>
        </tbody>
    </table>
</center>
</body>
</html>
