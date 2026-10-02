<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
    String productName = (String) session.getAttribute("productName");
    Double productPrice = (Double) session.getAttribute("productPrice");
    String sessionName = (String) session.getAttribute("name");
    String sessionEmail = (String) session.getAttribute("email");

    String quantity = request.getParameter("quantity");
    if (quantity == null || quantity.trim().isEmpty()) {
        quantity = "1";
    }

    int qty = 1;
    try {
        qty = Integer.parseInt(quantity);
    } catch (Exception e) {
        qty = 1;
    }

    if (productPrice == null) {
        productPrice = 100.0;
    }
    if (productName == null) {
        productName = "Fresh Farm Produce";
    }

    double totalPrice = productPrice * qty;
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Checkout - AgroTravel</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
<style>
    .checkout-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 30px;
        align-items: start;
    }
    @media (max-width: 800px) {
        .checkout-grid {
            grid-template-columns: 1fr;
        }
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
        <a href="products.jsp">Farm Products</a>
        <a href="cart.jsp">Cart 🛒</a>
        <a href="dashboard.jsp">My Account</a>
    </nav>
</header>

<section>
    <div class="checkout-container" style="width: 880px;">
        <h2 style="color: var(--primary-deep); margin-bottom: 24px; text-align: center;">Direct Farm Order Checkout</h2>

        <div class="checkout-grid">
            <!-- Order Summary Card -->
            <div class="checkout-details">
                <h3 style="color: var(--primary); margin-top: 0; margin-bottom: 16px;">📦 Order Summary</h3>
                
                <div style="border-bottom: 1px solid var(--border-light); padding-bottom: 12px; margin-bottom: 12px;">
                    <div style="font-weight: 700; font-size: 16px; color: var(--primary-deep);"><%= productName %></div>
                    <div style="font-size: 13px; color: var(--text-muted);">Direct grower packaging</div>
                </div>

                <div style="display: flex; justify-content: space-between; margin-bottom: 8px; font-size: 14.5px;">
                    <span>Unit Price:</span>
                    <b>₹ <%= productPrice %></b>
                </div>

                <div style="display: flex; justify-content: space-between; margin-bottom: 8px; font-size: 14.5px;">
                    <span>Quantity:</span>
                    <b><%= qty %></b>
                </div>

                <div style="display: flex; justify-content: space-between; margin-bottom: 8px; font-size: 14.5px;">
                    <span>Delivery Fee:</span>
                    <span style="color: #2e7d32; font-weight: 700;">FREE (Farm-Direct)</span>
                </div>

                <div style="display: flex; justify-content: space-between; font-size: 18px; font-weight: 800; color: var(--primary-deep); border-top: 2px solid var(--border-light); padding-top: 12px; margin-top: 12px;">
                    <span>Total Payable:</span>
                    <span style="color: var(--primary); font-size: 20px;">₹ <%= totalPrice %></span>
                </div>

                <div style="margin-top: 20px; font-size: 12.5px; color: var(--text-muted); background: #ffffff; padding: 12px; border-radius: var(--radius-sm); border: 1px dashed var(--border-light);">
                    🌱 <b>Direct-to-Farmer:</b> 100% of proceeds go directly to supporting the regenerative farming community.
                </div>
            </div>

            <!-- Customer Shipping Form -->
            <div>
                <form action="CheckoutServlet" method="post" class="checkout-form" style="width: 100%; max-width: 100%; margin: 0; padding: 0; border: none; box-shadow: none;">
                    
                    <input type="hidden" name="productName" value="<%= productName %>">
                    <input type="hidden" name="quantity" value="<%= qty %>">
                    <input type="hidden" name="totalPrice" value="<%= totalPrice %>">

                    <h3 style="color: var(--primary); margin-top: 0; margin-bottom: 16px;">🚚 Shipping &amp; Contact</h3>

                    <div class="form-group">
                        <label for="customerName">Full Name *</label>
                        <input type="text"
                               id="customerName"
                               name="customerName"
                               value="<%= sessionName != null ? sessionName : "" %>"
                               placeholder="e.g. Shreya A"
                               required>
                    </div>

                    <div class="form-group">
                        <label for="customerEmail">Email Address *</label>
                        <input type="email"
                               id="customerEmail"
                               name="customerEmail"
                               value="<%= sessionEmail != null ? sessionEmail : "" %>"
                               placeholder="e.g. shreya@example.com"
                               required>
                    </div>

                    <div class="form-group">
                        <label for="address">Delivery Address *</label>
                        <textarea id="address"
                                  name="address"
                                  rows="3"
                                  placeholder="Full street address, area, pin code..."
                                  required></textarea>
                    </div>

                    <button type="submit" class="order-button" style="width: 100%;">
                        Place Order (₹ <%= totalPrice %>) 🛍️
                    </button>
                    
                    <p style="text-align: center; font-size: 12px; color: var(--text-muted); margin-top: 10px;">
                        Simulated checkout. Order details will be recorded in the MySQL orders table.
                    </p>
                </form>
            </div>
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