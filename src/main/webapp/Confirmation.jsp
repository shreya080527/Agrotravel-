<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Session Confirmation - AgroTravel</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
</head>
<body>

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
        <a href="booking.jsp">Book</a>
        <a href="products.jsp">Products</a>
        <a href="dashboard.jsp">Dashboard</a>
    </nav>
</header>

<section>
    <div class="cart-container" style="max-width: 540px; text-align: center;">
        <div style="font-size: 56px; margin-bottom: 12px;">✅</div>
        <h2 style="color: var(--primary);">Session Data Stored Successfully</h2>
        <p style="color: var(--text-muted); font-size: 14px; margin-bottom: 22px;">
            The following user attributes are now actively cached inside the current <code>HttpSession</code> container:
        </p>

        <div style="background: var(--bg-sand); padding: 22px; border-radius: var(--radius-sm); border: 1px solid var(--border-light); margin-bottom: 26px; text-align: left;">
            <p style="margin: 8px 0; font-size: 16px;">
                <b>Name :</b> <%= session.getAttribute("name") != null ? session.getAttribute("name") : "Not Set" %>
            </p>
            <p style="margin: 8px 0; font-size: 16px;">
                <b>Email :</b> <%= session.getAttribute("email") != null ? session.getAttribute("email") : "Not Set" %>
            </p>
            <p style="margin: 8px 0; font-size: 13px; color: #2e7d32; font-weight: 600;">
                ✓ Session ID: <code><%= session.getId() %></code>
            </p>
        </div>

        <div style="display: flex; justify-content: center; gap: 12px; flex-wrap: wrap;">
            <a href="dashboard.jsp" class="btn btn-primary">Go to Dashboard 👤</a>
            <a href="SessionForm.jsp" class="btn btn-outline">Edit Session</a>
            <a href="index.html" class="btn btn-gold">Explore AgroTravel 🌾</a>
        </div>
    </div>
</section>

<footer>
    <div class="footer-bottom">
        <p>© 2026 AgroTravel - Academic Lab Session Module. All rights reserved.</p>
    </div>
</footer>

</body>
</html>