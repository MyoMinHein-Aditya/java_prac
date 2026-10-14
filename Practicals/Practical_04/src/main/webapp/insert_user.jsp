<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert Record using JSP & JDBC</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 40px;
        }
        .box {
            background-color: #ffffff;
            width: 350px;
            margin: 40px auto;
            padding: 20px;
            border: 1px solid #cccccc;
        }
        h2 {
            margin-top: 0;
            color: #333333;
        }
        .form-group {
            margin-bottom: 12px;
        }
        label {
            display: block;
            margin-bottom: 4px;
            font-weight: bold;
        }
        input[type=text], input[type=password] {
            width: 100%;
            padding: 6px;
            border: 1px solid #999999;
            box-sizing: border-box;
        }
        input[type=submit] {
            width: 100%;
            padding: 8px;
            background-color: #28a745;
            color: #ffffff;
            border: 1px solid #1e7e34;
            cursor: pointer;
            font-size: 14px;
        }
        .msg {
            margin-top: 15px;
            padding: 8px;
            border: 1px solid #cccccc;
        }
        .success {
            background-color: #d4edda;
            color: #155724;
        }
        .error {
            background-color: #f8d7da;
            color: #721c24;
        }
        a {
            color: #0066cc;
            text-decoration: none;
        }
    </style>
</head>
<body>
<div class="box">
    <h2>Insert User Record</h2>
    <p>Add new user to MySQL demo_db database:</p>
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
            // 1. Connect to MySQL demo_db
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/demo_db?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
            Connection conn = DriverManager.getConnection(url, "root", "Dash@1908");

            // 2. Insert new user
            PreparedStatement ps = conn.prepareStatement("INSERT INTO users (username, password) VALUES (?, ?)");
            ps.setString(1, u.trim());
            ps.setString(2, p.trim());
            ps.executeUpdate();

            // 3. Close resources
            ps.close();
            conn.close();

            out.println("<div class='msg success'>User <b>" + u + "</b> inserted successfully!</div>");
        }
    }
%>
    <p style="margin-top: 15px;"><a href="index.html">Back to Login Page</a></p>
</div>
</body>
</html>
