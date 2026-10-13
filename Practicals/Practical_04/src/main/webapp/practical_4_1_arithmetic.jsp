<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hello World JSP - Practical 4.1</title>
</head>
<body style="font-family: Arial; margin: 50px;">
    <h1><% out.println("Hello World!"); %></h1>
    <hr>
    <h2>Simple Arithmetic Operations</h2>
    <%
        int num1 = 20; 
        int num2 = 5;
        int sum = num1 + num2; 
        int diff = num1 - num2;
        int product = num1 * num2; 
        int quotient = num1 / num2;
    %>
    <p><strong>First Number:</strong> <%= num1 %></p>
    <p><strong>Second Number:</strong> <%= num2 %></p>
    <p>Addition (20 + 5): <strong><%= sum %></strong></p>
    <p>Subtraction (20 - 5): <strong><%= diff %></strong></p>
    <p>Multiplication (20 * 5): <strong><%= product %></strong></p>
    <p>Division (20 / 5): <strong><%= quotient %></strong></p>
    <br>
    <a href="index.html">Back to Main Page</a>
</body>
</html>
