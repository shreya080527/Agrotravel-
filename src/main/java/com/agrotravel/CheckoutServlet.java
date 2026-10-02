package com.agrotravel;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String customerName = request.getParameter("customerName");
        String customerEmail = request.getParameter("customerEmail");
        String address = request.getParameter("address");
        String productName = request.getParameter("productName");

        int quantity = Integer.parseInt(
                request.getParameter("quantity")
        );

        double totalPrice = Double.parseDouble(
                request.getParameter("totalPrice")
        );

        try {

            Connection con = DBConnection.getConnection();

            String query = "INSERT INTO orders "
                    + "(customer_name, customer_email, address, "
                    + "product_name, quantity, total_price) "
                    + "VALUES (?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, customerName);
            ps.setString(2, customerEmail);
            ps.setString(3, address);
            ps.setString(4, productName);
            ps.setInt(5, quantity);
            ps.setDouble(6, totalPrice);

            int result = ps.executeUpdate();

            if (result > 0) {

                response.sendRedirect("orderSuccess.jsp");

            } else {

                response.getWriter().println(
                        "Order could not be placed."
                );

            }

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                    "Error: " + e.getMessage()
            );

        }

    }

}