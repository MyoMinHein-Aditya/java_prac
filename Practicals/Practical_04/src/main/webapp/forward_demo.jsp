<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>JSP Forward Action Tag Demo</title>
</head>
<body>
    <jsp:forward page="forward_target.jsp">
        <jsp:param name="studentName" value="Myo Min Hein" />
        <jsp:param name="subject" value="Enterprise Programming Using Java" />
    </jsp:forward>
</body>
</html>
