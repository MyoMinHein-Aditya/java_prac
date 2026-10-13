package com.simple;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/request-details")
public class RequestDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html><html><head><title>HTTP Request Details</title>");
        out.println("<style>");
        out.println("body { font-family: Arial, sans-serif; background: #f8f9fa; margin: 30px; }");
        out.println(".card { background: white; max-width: 750px; margin: auto; padding: 25px; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); }");
        out.println("h2 { color: #007bff; text-align: center; }");
        out.println("table { width: 100%; border-collapse: collapse; margin-top: 20px; }");
        out.println("th, td { border: 1px solid #dee2e6; padding: 10px; text-align: left; }");
        out.println("th { background-color: #007bff; color: white; }");
        out.println("tr:nth-child(even) { background-color: #f2f2f2; }");
        out.println(".back-btn { display: inline-block; margin-top: 20px; padding: 8px 16px; background: #6c757d; color: white; text-decoration: none; border-radius: 4px; }");
        out.println("</style></head><body>");

        out.println("<div class='card'>");
        out.println("<h2>HTTP Request Details</h2>");
        out.println("<table>");
        out.println("<tr><th>Request Property</th><th>Value</th></tr>");
        out.println("<tr><td>HTTP Request Method</td><td>" + request.getMethod() + "</td></tr>");
        out.println("<tr><td>Client IP Address</td><td>" + request.getRemoteAddr() + "</td></tr>");
        out.println("<tr><td>Client Host</td><td>" + request.getRemoteHost() + "</td></tr>");
        out.println("<tr><td>Client Port</td><td>" + request.getRemotePort() + "</td></tr>");
        out.println("<tr><td>Server Name</td><td>" + request.getServerName() + "</td></tr>");
        out.println("<tr><td>Server Port</td><td>" + request.getServerPort() + "</td></tr>");
        out.println("<tr><td>Protocol</td><td>" + request.getProtocol() + "</td></tr>");
        out.println("<tr><td>Request URI</td><td>" + request.getRequestURI() + "</td></tr>");
        out.println("<tr><td>Context Path</td><td>" + request.getContextPath() + "</td></tr>");
        out.println("<tr><td>Servlet Path</td><td>" + request.getServletPath() + "</td></tr>");
        out.println("<tr><td>Browser Information (User-Agent)</td><td>" + request.getHeader("User-Agent") + "</td></tr>");
        out.println("</table>");

        out.println("<h3 style='margin-top:25px;'>All Request Headers</h3>");
        out.println("<table>");
        out.println("<tr><th>Header Name</th><th>Header Value</th></tr>");
        Enumeration<String> headerNames = request.getHeaderNames();
        while (headerNames.hasMoreElements()) {
            String headerName = headerNames.nextElement();
            String headerValue = request.getHeader(headerName);
            out.println("<tr><td>" + headerName + "</td><td>" + headerValue + "</td></tr>");
        }
        out.println("</table>");

        out.println("<a class='back-btn' href='index.html'>Back to Home</a>");
        out.println("</div></body></html>");
        out.close();
    }
}
