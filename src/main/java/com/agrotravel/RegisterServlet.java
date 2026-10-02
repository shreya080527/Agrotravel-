package com.agrotravel;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public RegisterServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String location = request.getParameter("location");

        try {

            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO users(name, phone, location) VALUES(?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, phone);
            ps.setString(3, location);

            int i = ps.executeUpdate();

            if(i > 0) {
                HttpSession session = request.getSession();
                session.setAttribute("name", name);
                session.setAttribute("phone", phone);
                session.setAttribute("location", location);
                response.sendRedirect("success.jsp?type=register");
            } else {
                response.getWriter().println("Registration Failed!");
            }

            ps.close();
            con.close();

        } catch(Exception e) {

            e.printStackTrace();
            response.getWriter().println("Error : " + e.getMessage());

        }

    }

}