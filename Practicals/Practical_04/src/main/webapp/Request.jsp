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
            background-color: #f4f4f4;
            margin: 40px;
        }
        .container { 
            width: 350px; 
            margin: 40px auto; 
            background-color: #ffffff; 
            padding: 20px; 
            border: 1px solid #cccccc;
            text-align: center;
        }
        .success { 
            color: #28a745;
        }
        .error { 
            color: #dc3545;
        }
        a {
            text-decoration: none; 
            color: #ffffff; 
            background-color: #0066cc; 
            padding: 8px 16px; 
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

    // 1. Load Driver and Connect to Database
    Class.forName("com.mysql.cj.jdbc.Driver"); 
    String url = "jdbc:mysql://localhost:3306/demo_db?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC"; 
    Connection con = DriverManager.getConnection(url, "root", "Dash@1908");

    // 2. Check credentials
    String sql = "SELECT * FROM users WHERE username=? AND password=?"; 
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, user); 
    ps.setString(2, pass); 
    ResultSet rs = ps.executeQuery(); 
    boolean login = rs.next();

    // 3. Close connection
    rs.close();
    ps.close();
    con.close();

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
