package com.agrotravel;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ActiveUserServlet")
public class ActiveUserServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Integer count = (Integer)getServletContext().getAttribute("activeUsers");

        if(count == null || count < 1){
            count = 1;
            getServletContext().setAttribute("activeUsers", count);
        }

        if(session.getAttribute("visited") == null){
            session.setAttribute("visited", "yes");
        }

        request.getRequestDispatcher("activeUsers.jsp").forward(request, response);
    }
}