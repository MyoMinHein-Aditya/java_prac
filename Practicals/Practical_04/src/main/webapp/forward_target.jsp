<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Forwarded Target Page</title>
</head>
<body style="font-family: Arial; margin: 40px;">
    <h2>Target Page: Request Forwarded Successfully!</h2>
    <p>This request was redirected internally via the <code>&lt;jsp:forward&gt;</code> action tag.</p>
    <hr>
    <p><strong>Student Name:</strong> <%= request.getParameter("studentName") %></p>
    <p><strong>Subject:</strong> <%= request.getParameter("subject") %></p>
    <br>
    <a href="index.html">Back to Main Page</a>
</body>
</html>
