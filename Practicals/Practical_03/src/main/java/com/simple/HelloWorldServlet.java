package com.simple;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/hello")
public class HelloWorldServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html><html><head><title>Hello World Servlet</title></head>");
        out.println("<body style='font-family: Arial; text-align: center; margin-top: 50px;'>");
        out.println("<h1 style='color: #007bff;'>Hello World from Servlet!</h1>");
        out.println("<p>Welcome, Myo Min Hein!</p>");
        out.println("<p>Servlet is running successfully on Apache Tomcat.</p>");
        out.println("<br><a href='index.html'>Back to Home</a>");
        out.println("</body></html>");
        out.close();
    }
}
