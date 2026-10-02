<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
    String type = request.getParameter("type");
    String name = (String) session.getAttribute("name");
    String email = (String) session.getAttribute("email");
    String farm = (String) session.getAttribute("lastBookingFarm");
    boolean isBooking = "booking".equalsIgnoreCase(type);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><%= isBooking ? "Booking Confirmed" : "Registration Successful" %> - AgroTravel</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
</head>

<body>

<!-- Header -->
<header class="site-header">
    <a href="index.html" class="brand-wrapper">
        <span class="brand-logo-icon">🌾</span>
        <div>
            <h1 class="brand-name">AgroTravel</h1>
            <span class="brand-tagline">Farm Tourism &amp; Fresh Products</span>
        </div>
    </a>
    
    <nav>
        <a href="index.html">Home</a>
        <a href="farm.html">Farm</a>
        <a href="gallery.html">Gallery</a>
        <a href="register.jsp">Register</a>
        <a href="booking.jsp">Book</a>
        <a href="products.jsp">E-Commerce</a>
        <a href="dashboard.jsp">Dashboard</a>
    </nav>
</header>

<section>
    <div class="success-container">
        <div style="font-size: 64px; margin-bottom: 12px;">🎉</div>

        <% if (isBooking) { %>
            <h2 style="color: var(--primary);">Farm Visit Booking Successful!</h2>
            <p style="font-size: 16px; color: var(--text-muted); margin-bottom: 24px;">
                Thank you <b><%= name != null ? name : "Visitor" %></b>! Your farm reservation request has been registered in the AgroTravel database.
            </p>

            <div style="background: var(--bg-sand); padding: 20px; border-radius: var(--radius-sm); border: 1px solid var(--border-light); margin-bottom: 25px; text-align: left;">
                <p style="margin: 6px 0;"><b>🌾 Farm Destination:</b> <%= farm != null ? farm : "Selected Farm" %></p>
                <p style="margin: 6px 0;"><b>👤 Visitor Name:</b> <%= name != null ? name : "Registered Guest" %></p>
                <% if (email != null && !email.isEmpty()) { %>
                    <p style="margin: 6px 0;"><b>✉️ Confirmation Email:</b> <%= email %></p>
                <% } %>
                <p style="margin: 6px 0; color: #2e7d32; font-weight: 600;">✓ Database status: Booking record inserted successfully.</p>
            </div>
        <% } else { %>
            <h2 style="color: var(--primary);">Registration Successful!</h2>
            <p style="font-size: 16px; color: var(--text-muted); margin-bottom: 24px;">
                Welcome to AgroTravel <%= name != null ? ", " + name : "" %>! Your member profile is now active and stored in our database.
            </p>

            <div style="background: var(--bg-sand); padding: 20px; border-radius: var(--radius-sm); border: 1px solid var(--border-light); margin-bottom: 25px; text-align: left;">
                <p style="margin: 6px 0;"><b>👤 Member Name:</b> <%= name != null ? name : "New User" %></p>
                <p style="margin: 6px 0;"><b>📱 Active Session:</b> Initialized</p>
                <p style="margin: 6px 0; color: #2e7d32; font-weight: 600;">✓ Database status: User record inserted successfully.</p>
            </div>
        <% } %>

        <div style="display: flex; justify-content: center; gap: 14px; flex-wrap: wrap;">
            <a href="dashboard.jsp" class="btn btn-primary">Go to Dashboard 👤</a>
            <a href="farm.html" class="btn btn-gold">Explore Farms 🚜</a>
            <a href="products.jsp" class="btn btn-secondary">Shop Farm Products 🥬</a>
            <a href="index.html" class="btn btn-outline">Go to Home 🏠</a>
        </div>
    </div>
</section>

<!-- Footer -->
<footer>
    <div class="footer-bottom">
        <p>© 2026 AgroTravel. All rights reserved.</p>
    </div>
</footer>

</body>
</html>