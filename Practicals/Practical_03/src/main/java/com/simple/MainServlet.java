package com.simple;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/MainApp")
public class MainServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html><html><head><title>Dashboard</title>");
        out.println("<style>");
        out.println("body{font-family:Arial,sans-serif;background-color:#f4f4f4;text-align:center;margin:40px;}");
        out.println(".box{width:350px;margin:40px auto;background-color:#ffffff;padding:20px;border:1px solid #cccccc;}");
        out.println("table{width:100%;border-collapse:collapse;margin-top:15px;}");
        out.println("table,th,td{border:1px solid #999999;padding:6px;text-align:left;}");
        out.println("th{background-color:#eeeeee;}");
        out.println("a{display:inline-block;margin-top:15px;padding:6px 12px;background-color:#0066cc;color:#ffffff;text-decoration:none;}");
        out.println("</style></head><body><div class='box'>");

        if ("admin".equals(user) && "1234".equals(pass)) {
            HttpSession session = request.getSession();
            Integer count = (Integer) session.getAttribute("count");
            if (count == null) {
                count = 1;
            } else {
                count++;
            }
            session.setAttribute("count", count);

            Cookie cookie = new Cookie("lastUser", user);
            cookie.setMaxAge(3600);
            response.addCookie(cookie);

            out.println("<h2>Login Successful</h2>");
            out.println("<table>");
            out.println("<tr><th>Username</th><td>" + user + "</td></tr>");
            out.println("<tr><th>Session ID</th><td>" + session.getId() + "</td></tr>");
            out.println("<tr><th>Visit Count</th><td>" + count + "</td></tr>");
            out.println("<tr><th>Cookie</th><td>lastUser Saved</td></tr>");
            out.println("</table>");
        } else {
            out.println("<h2>Login Failed</h2>");
            out.println("<p>Invalid Username or Password</p>");
            out.println("<p><b>Username:</b> admin</p>");
            out.println("<p><b>Password:</b> 1234</p>");
        }

        out.println("<a href='index.html'>Back to Login</a>");
        out.println("</div></body></html>");
        out.close();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("index.html");
    }
}
