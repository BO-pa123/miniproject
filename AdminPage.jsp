<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
    // Establish connection to MySQL database
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","Parimala@12345");

    // Query to fetch data based on the selected menu item
    String menuItem = request.getParameter("menuItem");
    String query = "";

    if(menuItem.equals("IT")) {
        query = "SELECT * FROM html WHERE departmentname = 'IT'";
    } else if(menuItem.equals("CSE")) {
        query = "SELECT * FROM html WHERE departmentname = 'CSE'";
    } else if(menuItem.equals("ECE")) {
        query = "SELECT * FROM html WHERE departmentname = 'ECE'";
    }
    // Add more conditions for other submenu items as needed

    PreparedStatement pstmt = conn.prepareStatement(query);

    // Execute the query
    ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Menu Item Details</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
    </style>
</head>
<body>
    <h1>Classroom Details</h1>
    <table>
        <thead>
            <tr>
                <th>Block Name</th>
                <th>Department Name</th>
                <th>Floor No</th>
                <th>Room No</th>
                <th>Year/Section</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Display fetched data
                while(rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getString("blockname") + "</td>");
                    out.println("<td>" + rs.getString("departmentname") + "</td>");
                    out.println("<td>" + rs.getInt("floorno") + "</td>");
                    out.println("<td><a href='secondPage.jsp?roomNo=" + rs.getInt("roomno") + "'>" + rs.getInt("roomno") + "</a></td>");
                    out.println("<td>" + rs.getString("yearsection") + "</td>");
                    out.println("</tr>");
                }
                // Close resources
                rs.close();
                pstmt.close();
                conn.close();
            %>
        </tbody>
    </table>
</body>
</html>
