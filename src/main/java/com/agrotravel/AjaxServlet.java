package com.agrotravel;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AjaxServlet")
public class AjaxServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");

        response.getWriter().println(
            "<h3>Response from AgroTravel Servlet</h3>"
        );

        response.getWriter().println(
            "<p>AJAX successfully received data from the Servlet.</p>"
        );

        response.getWriter().println(
            "<p>Welcome to AgroTravel!</p>"
        );
    }
}