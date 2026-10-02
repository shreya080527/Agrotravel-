<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.agrotravel.DBConnection" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Farm Products &amp; Fresh Market - AgroTravel</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
<style>
    .market-banner {
        background: linear-gradient(135deg, var(--bg-cream) 0%, #ecdcc9 100%);
        border-radius: var(--radius-md);
        padding: 28px 32px;
        margin-bottom: 35px;
        border: 1px solid var(--border-light);
        display: flex;
        justify-content: space-between;
        align-items: center;
        flex-wrap: wrap;
        gap: 16px;
    }
    .market-badge {
        display: inline-flex;
        align-items: center;
        gap: 6px;
        background: #ffffff;
        padding: 6px 14px;
        border-radius: var(--radius-full);
        font-weight: 700;
        font-size: 13px;
        color: var(--primary-deep);
        box-shadow: var(--shadow-sm);
    }
</style>
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
        <a href="farm.html">Explore Farms</a>
        <a href="gallery.html">Gallery</a>
        <a href="booking.jsp">Book a Visit</a>
        <a href="products.jsp" class="active">Farm Products</a>
        <a href="cart.jsp">Cart 🛒</a>
        <a href="feedbackForm.jsp">Feedback</a>
        <a href="dashboard.jsp">My Account</a>
        <a href="about.html">About</a>
        <a href="register.jsp" class="nav-highlight">Register</a>
    </nav>
</header>

<!-- Lab Ribbon -->
<div class="lab-ribbon">
    <span>🔬 <b>Lab Features:</b> E-Commerce Flow, CartServlet (Session), MySQL Database Retrieval (`products` table)</span>
    <div>
        <a href="cart.jsp">View Shopping Cart</a> |
        <a href="checkout.jsp">Checkout</a> |
        <a href="dashboard.jsp">Dashboard Orders</a>
    </div>
</div>

<section>
    <div class="container">
        <div class="section-header">
            <span class="section-tag">Direct From Growers</span>
            <h2 class="section-title">Fresh Products from Local Farms</h2>
            <p class="section-desc">Chemical-free produce, raw unpasteurized honey, and heritage grains harvested and packed with care by our partner farmers.</p>
        </div>

        <div class="market-banner">
            <div>
                <h3 style="margin: 0 0 6px; color: var(--primary-deep);">100% Pure Agricultural Guarantee</h3>
                <p style="margin: 0; font-size: 14px; color: var(--text-muted);">All items are certified organic, ethically harvested, and support fair prices for rural farmers.</p>
            </div>
            <div style="display: flex; gap: 10px; flex-wrap: wrap;">
                <span class="market-badge">🌱 Chemical-Free</span>
                <span class="market-badge">📦 Eco Packaging</span>
                <span class="market-badge">⚡ Same-Day Dispatch</span>
            </div>
        </div>

        <div class="product-container">
            <%
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                con = DBConnection.getConnection();
                String query = "SELECT * FROM products";
                ps = con.prepareStatement(query);
                rs = ps.executeQuery();

                while (rs.next()) {
                    int pId = rs.getInt("id");
                    String pName = rs.getString("name");
                    String pDesc = rs.getString("description");
                    double pPrice = rs.getDouble("price");
                    String pImage = rs.getString("image");
                    
                    if (pImage == null || pImage.trim().isEmpty()) {
                        pImage = "vegetables.jpg";
                    }
            %>

            <div class="product-card">
                <div class="product-img-wrap">
                    <img src="images/<%= pImage %>" alt="<%= pName %>">
                </div>
                <div class="product-body">
                    <h3><%= pName %></h3>
                    <p><%= pDesc %></p>
                    <div class="product-footer">
                        <span class="price">&#8377; <%= pPrice %></span>
                        <a class="buy-button" href="CartServlet?id=<%= pId %>">
                            Add to Cart 🛒
                        </a>
                    </div>
                </div>
            </div>

            <%
                }
            } catch (Exception e) {
                out.println("<div style='grid-column: 1/-1; text-align: center; color: red;'>Error loading products: " + e.getMessage() + "</div>");
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (con != null) con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            %>
        </div>

        <div style="background: var(--card-bg); padding: 25px; border-radius: var(--radius-md); border: 1px solid var(--border-light); margin-top: 25px; text-align: center;">
            <h4 style="margin: 0 0 8px; color: var(--primary-deep);">Have feedback or questions about our farm harvest?</h4>
            <p style="margin: 0 0 16px; font-size: 14px; color: var(--text-muted);">Share your review with our grower community or search existing verified customer ratings.</p>
            <div style="display: flex; justify-content: center; gap: 12px; flex-wrap: wrap;">
                <a href="feedbackForm.jsp" class="btn btn-outline btn-sm">Submit Review ✍️</a>
                <a href="feedbackSummary.jsp" class="btn btn-primary btn-sm">View Feedback Summary 📜</a>
                <a href="cart.jsp" class="btn btn-gold btn-sm">Go to Cart 🛒</a>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<footer>
    <div class="footer-content">
        <div class="footer-col">
            <div style="display: flex; align-items: center; gap: 10px; margin-bottom: 12px;">
                <span style="font-size: 26px;">🌾</span>
                <span style="font-size: 22px; font-weight: 800; color: #ffffff;">AgroTravel</span>
            </div>
            <p>Bringing fresh, authentic organic produce directly from agricultural fields to your doorstep.</p>
        </div>
        <div class="footer-col">
            <h4>Shopping Navigation</h4>
            <ul>
                <li><a href="products.jsp">All Products</a></li>
                <li><a href="cart.jsp">Shopping Cart</a></li>
                <li><a href="checkout.jsp">Checkout</a></li>
                <li><a href="dashboard.jsp">Recent Orders</a></li>
            </ul>
        </div>
        <div class="footer-col">
            <h4>Related Labs</h4>
            <ul>
                <li><a href="cart.jsp">Session-Based Cart</a></li>
                <li><a href="feedbackForm.jsp">XML Review Submission</a></li>
                <li><a href="feedbackSearch.jsp">XPath Review Search</a></li>
            </ul>
        </div>
        <div class="footer-col">
            <h4>Customer Support</h4>
            <p>📞 Phone: +91 98765 43210</p>
            <p>✉️ Email: orders@agrotravel.com</p>
        </div>
    </div>
    <div class="footer-bottom">
        <p>© 2026 AgroTravel - Fresh Farm Products &amp; E-Commerce. All rights reserved.</p>
    </div>
</footer>

</body>
</html>