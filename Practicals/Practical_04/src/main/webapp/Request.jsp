<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Result</title>
    <style> 
        body {
            font-family: Arial, sans-serif; 
            background: #f2f2f2;
        }
        .container { 
            width: 500px; 
            margin: 80px auto; 
            background: white; 
            padding: 25px; 
            border-radius: 10px;
            box-shadow: 0px 0px 10px gray; 
            text-align: center;
        }
        .success { 
            color: green;
        }
        .error {
            color: red;
        }
        a {
            text-decoration: none; 
            color: white; 
            background: #1976d2; 
            padding: 10px 20px; 
            border-radius: 5px;
            display: inline-block;
            margin-top: 15px;
        }
    </style>
</head>
<body>
<div class="container">
<%
    String user = request.getParameter("user"); 
    String pass = request.getParameter("pass");
    String url = "jdbc:mysql://localhost:3306/demo_db?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC"; 
    String dbUser = "root";
    String dbPass = "root"; 

    Connection con = null; 
    PreparedStatement ps = null; 
    ResultSet rs = null; 
    boolean login = false; 

    try {
        Class.forName("com.mysql.cj.jdbc.Driver"); 
        con = DriverManager.getConnection(url, dbUser, dbPass);
        String sql = "SELECT * FROM users WHERE username=? AND password=?"; 
        ps = con.prepareStatement(sql);
        ps.setString(1, user); 
        ps.setString(2, pass); 
        rs = ps.executeQuery(); 
        if (rs.next()) { 
            login = true;
        }
    } catch (Exception e) { 
        out.println("<h3 class='error'>" + e.getMessage() + "</h3>");
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) {}
        if (ps != null) try { ps.close(); } catch (SQLException e) {} 
        if (con != null) try { con.close(); } catch (SQLException e) {}
    }

    if (login) {
        Integer count = (Integer) session.getAttribute("count"); 
        if (count == null) {
            count = 1; 
        } else {
            count++;
        }
        session.setAttribute("count", count); 
        Cookie ck = new Cookie("username", user); 
        ck.setMaxAge(3600); 
        response.addCookie(ck);
%>
    <h2 class="success">Login Successful</h2>
    <p>Welcome <b><%= user %></b></p>
    <p>Session ID : <%= session.getId() %></p>
    <p>Visit Count : <%= count %></p>
    <p>Cookie Created Successfully.</p>
    <br>
    <a href="index.html">Logout</a>
<%
    } else {
%>
    <h2 class="error">Login Failed</h2>
    <p>Invalid Username or Password</p>
    <p><i>Hint: Try username <b>admin</b> and password <b>1234</b></i></p>
    <br>
    <a href="index.html">Try Again</a>
<%
    }
%>
</div>
</body>
</html>
