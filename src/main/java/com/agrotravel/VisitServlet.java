package com.agrotravel;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/VisitServlet")
public class VisitServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int count = 1;

        Cookie cookies[] = request.getCookies();

        if(cookies != null){

            for(Cookie c : cookies){

                if(c.getName().equals("visitCount")){

                    count = Integer.parseInt(c.getValue());

                    count++;

                }

            }

        }

        Cookie visitCookie = new Cookie("visitCount",
                String.valueOf(count));

        visitCookie.setMaxAge(60*60*24);

        response.addCookie(visitCookie);

        request.setAttribute("count", count);

        request.getRequestDispatcher("visit.jsp")
                .forward(request, response);

    }

}