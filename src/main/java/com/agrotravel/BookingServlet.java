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

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public BookingServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String farm = request.getParameter("farm");
        String description = request.getParameter("description");

        try {

            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO booking(name, email, farm, description) VALUES(?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, farm);
            ps.setString(4, description);

            int i = ps.executeUpdate();

            if (i > 0) {
                HttpSession session = request.getSession();
                session.setAttribute("name", name);
                session.setAttribute("email", email);
                session.setAttribute("lastBookingFarm", farm);
                response.sendRedirect("success.jsp?type=booking");
            } else {
                response.getWriter().println("Booking Failed!");
            }

            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();
            response.getWriter().println("Error : " + e.getMessage());

        }

    }

}