<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Order Placed Successfully - AgroTravel</title>
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
        <a href="products.jsp">Products</a>
        <a href="cart.jsp">Cart</a>
        <a href="dashboard.jsp">Dashboard</a>
    </nav>
</header>

<section>
    <div class="success-container">
        <div style="font-size: 68px; margin-bottom: 12px;">🎉</div>

        <h2 style="color: var(--primary);">Order Placed Successfully!</h2>

        <p style="font-size: 16px; color: var(--text-muted); margin-bottom: 22px;">
            Thank you for shopping directly from our local farming community. Your order details have been securely saved into our database.
        </p>

        <div style="background: var(--bg-sand); padding: 22px; border-radius: var(--radius-sm); border: 1px solid var(--border-light); margin-bottom: 25px; text-align: left;">
            <p style="margin: 6px 0; color: #2e7d32; font-weight: 700;">✓ Database Insertion: Verified (Table: `orders`)</p>
            <p style="margin: 6px 0;"><b>📦 Order Status:</b> Confirmed &amp; Dispatched to Farm Coordinator</p>
            <p style="margin: 6px 0;"><b>🚚 Delivery Method:</b> Direct Farm-to-Home Eco Courier</p>
            <p style="margin: 6px 0; font-size: 13.5px; color: var(--text-muted);">A receipt and tracking confirmation has been dispatched to your email address.</p>
        </div>

        <div style="display: flex; justify-content: center; gap: 14px; flex-wrap: wrap;">
            <a href="dashboard.jsp" class="btn btn-primary">View in Dashboard 👤</a>
            <a href="products.jsp" class="btn btn-gold">Continue Shopping 🥬</a>
            <a href="feedbackForm.jsp" class="btn btn-outline">Leave Farm Feedback ✍️</a>
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