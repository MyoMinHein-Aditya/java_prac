package com.simple;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/cookies")
public class CookieDemoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html><html><head><title>Cookie Management</title>");
        out.println("<style>body{font-family:Arial,sans-serif;margin:40px;background-color:#f4f4f4;}.box{background-color:#ffffff;padding:20px;max-width:500px;margin:auto;border:1px solid #cccccc;}a{color:#0066cc;text-decoration:none;}</style>");
        out.println("</head><body><div class='box'>");
        out.println("<h2 style='color:#333333;margin-top:0;'>Cookie Management Demo</h2>");

        if ("create".equalsIgnoreCase(action)) {
            String cookieName = request.getParameter("name");
            String cookieVal = request.getParameter("val");
            if (cookieName == null || cookieName.isEmpty()) {
                cookieName = "studentName";
                cookieVal = "Kalpataru_Dash";
            }
            Cookie ck = new Cookie(cookieName, cookieVal);
            ck.setMaxAge(3600);
            response.addCookie(ck);
            out.println("<p style='color:#28a745;'>Cookie Created: <b>" + cookieName + " = " + cookieVal + "</b></p>");
        }

        out.println("<h3>Existing Cookies:</h3>");
        Cookie[] cookies = request.getCookies();
        if (cookies != null && cookies.length > 0) {
            out.println("<ul>");
            for (Cookie c : cookies) {
                out.println("<li><b>" + c.getName() + "</b> : " + c.getValue() + "</li>");
            }
            out.println("</ul>");
        } else {
            out.println("<p>No cookies found on client browser.</p>");
        }

        out.println("<br><a href='cookies?action=create&name=student&val=KalpataruDash'>Click here to Create Sample Cookie</a>");
        out.println("<br><br><a href='index.html'>Back to Home</a>");
        out.println("</div></body></html>");
        out.close();
    }
}
