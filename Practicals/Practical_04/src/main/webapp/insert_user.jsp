<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert Record using JSP & JDBC</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f4f6f9; margin: 40px; }
        .card { background: white; max-width: 500px; margin: auto; padding: 25px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        input[type=text], input[type=password] { width: 100%; padding: 8px; box-sizing: border-box; }
        input[type=submit] { background: #28a745; color: white; border: none; padding: 10px 20px; border-radius: 4px; cursor: pointer; }
        .msg { margin-top: 15px; padding: 10px; border-radius: 4px; }
        .success { background: #d4edda; color: #155724; }
        .error { background: #f8d7da; color: #721c24; }
    </style>
</head>
<body>
<div class="card">
    <h2>Insert New User Record</h2>
    <p>Inserts new records into MySQL/Oracle database via JDBC in JSP.</p>
    <form method="post" action="insert_user.jsp">
        <div class="form-group">
            <label>Username:</label>
            <input type="text" name="username" required>
        </div>
        <div class="form-group">
            <label>Password:</label>
            <input type="password" name="password" required>
        </div>
        <input type="submit" name="submit" value="Add User Record">
    </form>

<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String u = request.getParameter("username");
        String p = request.getParameter("password");
        if (u != null && p != null && !u.trim().isEmpty()) {
            String url = "jdbc:mysql://localhost:3306/demo_db?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
            String dbUser = "root";
            String dbPass = "root";

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                try (Connection conn = DriverManager.getConnection(url, dbUser, dbPass);
                     PreparedStatement ps = conn.prepareStatement("INSERT INTO users (username, password) VALUES (?, ?)")) {
                    ps.setString(1, u.trim());
                    ps.setString(2, p.trim());
                    int affected = ps.executeUpdate();
                    if (affected > 0) {
                        out.println("<div class='msg success'>User <b>" + u + "</b> inserted successfully into database!</div>");
                    }
                }
            } catch (Exception e) {
                out.println("<div class='msg error'>Error: " + e.getMessage() + "</div>");
            }
        }
    }
%>
    <br>
    <a href="index.html">Back to Main Login</a>
</div>
</body>
</html>
