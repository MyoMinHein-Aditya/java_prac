package com.simple;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/session")
public class SessionTrackingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        Integer accessCount = (Integer) session.getAttribute("accessCount");
        String heading;

        if (session.isNew() || accessCount == null) {
            heading = "Welcome, New Visitor!";
            accessCount = 0;
        } else {
            heading = "Welcome Back!";
            accessCount++;
        }
        session.setAttribute("accessCount", accessCount);

        out.println("<!DOCTYPE html><html><head><title>Session Tracking</title>");
        out.println("<style>body{font-family:Arial;background:#f0f2f5;margin:40px;}.box{background:white;padding:25px;max-width:550px;margin:auto;border-radius:8px;box-shadow:0 0 10px #bbb;}</style>");
        out.println("</head><body><div class='box'>");
        out.println("<h2 style='color:#007bff;'>" + heading + "</h2>");
        out.println("<table border='1' cellpadding='8' style='width:100%; border-collapse:collapse;'>");
        out.println("<tr><th>Information</th><th>Value</th></tr>");
        out.println("<tr><td>Session ID</td><td>" + session.getId() + "</td></tr>");
        out.println("<tr><td>Creation Time</td><td>" + new Date(session.getCreationTime()) + "</td></tr>");
        out.println("<tr><td>Last Accessed Time</td><td>" + new Date(session.getLastAccessedTime()) + "</td></tr>");
        out.println("<tr><td>Number of Accesses</td><td>" + accessCount + "</td></tr>");
        out.println("<tr><td>Is New Session?</td><td>" + session.isNew() + "</td></tr>");
        out.println("</table>");
        out.println("<br><p>Refresh the page to observe visit count increase.</p>");
        out.println("<a href='index.html'>Back to Home</a>");
        out.println("</div></body></html>");
        out.close();
    }
}
