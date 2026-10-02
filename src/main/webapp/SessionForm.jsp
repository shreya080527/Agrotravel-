<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Session Form - AgroTravel</title>
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

<!-- Lab Ribbon -->
<div class="lab-ribbon">
    <span>🔬 <b>Lab Feature:</b> HTTP Session State Management (SessionServlet &rarr; Confirmation.jsp)</span>
    <div>
        <a href="dashboard.jsp">Dashboard</a> |
        <a href="ActiveUserServlet">Active Users</a> |
        <a href="VisitServlet">Visit Cookie</a>
    </div>
</div>

<section>
    <div class="cart-container" style="max-width: 520px;">
        <h2 style="color: var(--primary-deep); margin-bottom: 8px; text-align: center;">HTTP Session Management</h2>
        <p style="text-align: center; color: var(--text-muted); font-size: 14px; margin-bottom: 24px;">
            This form sets user attributes in the server-side <code>HttpSession</code> via <code>SessionServlet</code>.
        </p>

        <form action="SessionServlet" method="post" style="width: 100%; max-width: 100%; margin: 0; padding: 0; box-shadow: none; border: none; background: transparent;">
            
            <div class="form-group">
                <label for="name">Visitor Name :</label>
                <input type="text"
                       id="name"
                       name="name"
                       placeholder="e.g. Shreya A"
                       required>
            </div>

            <div class="form-group">
                <label for="email">Email Address :</label>
                <input type="email"
                       id="email"
                       name="email"
                       placeholder="e.g. shreya@example.com"
                       required>
            </div>

            <button type="submit" style="width: 100%; margin-top: 10px;">
                Store in Session &rarr;
            </button>
        </form>
    </div>
</section>

<footer>
    <div class="footer-bottom">
        <p>© 2026 AgroTravel - Academic Lab Session Module. All rights reserved.</p>
    </div>
</footer>

</body>
</html>