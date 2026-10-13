<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSP Implicit Objects Demo</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; background: #f9f9f9; }
        .box { background: white; padding: 25px; border-radius: 8px; box-shadow: 0 0 10px #ddd; max-width: 700px; margin: auto; }
        table { width: 100%; border-collapse: collapse; margin-top: 15px; }
        th, td { border: 1px solid #ccc; padding: 8px 12px; text-align: left; }
        th { background: #007bff; color: white; }
    </style>
</head>
<body>
<div class="box">
    <h2>Demonstration of JSP Implicit Objects</h2>
    <p>JSP provides 9 implicit objects created automatically by the JSP engine.</p>
    <table>
        <tr>
            <th>Implicit Object</th>
            <th>Type</th>
            <th>Value / Demonstration</th>
        </tr>
        <tr>
            <td><code>request</code></td>
            <td>HttpServletRequest</td>
            <td>Method: <%= request.getMethod() %>, URI: <%= request.getRequestURI() %></td>
        </tr>
        <tr>
            <td><code>response</code></td>
            <td>HttpServletResponse</td>
            <td>Character Encoding: <%= response.getCharacterEncoding() %></td>
        </tr>
        <tr>
            <td><code>session</code></td>
            <td>HttpSession</td>
            <td>Session ID: <%= session.getId() %></td>
        </tr>
        <tr>
            <td><code>application</code></td>
            <td>ServletContext</td>
            <td>Server Info: <%= application.getServerInfo() %></td>
        </tr>
        <tr>
            <td><code>out</code></td>
            <td>JspWriter</td>
            <td><% out.print("Buffer Size: " + out.getBufferSize() + " bytes"); %></td>
        </tr>
        <tr>
            <td><code>config</code></td>
            <td>ServletConfig</td>
            <td>Servlet Name: <%= config.getServletName() %></td>
        </tr>
        <tr>
            <td><code>pageContext</code></td>
            <td>PageContext</td>
            <td>Scope count: <%= pageContext.PAGE_SCOPE %></td>
        </tr>
        <tr>
            <td><code>page</code></td>
            <td>Object (this)</td>
            <td>Class: <%= page.getClass().getSimpleName() %></td>
        </tr>
    </table>
    <br>
    <a href="index.html">Back to Main Page</a>
</div>
</body>
</html>
