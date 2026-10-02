<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Session Expired - AgroTravel</title>
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
        <a href="farm.html">Farms</a>
        <a href="products.jsp">Products</a>
        <a href="dashboard.jsp">Dashboard</a>
    </nav>
</header>

<section>
    <div class="cart-container" style="text-align: center; padding: 45px 25px;">
        <div style="font-size: 60px; margin-bottom: 14px;">⏱️</div>
        <h2 style="color: #c93b2b; margin-bottom: 12px;">Session Expired!</h2>
        <p style="font-size: 16px; color: var(--text-muted); max-width: 500px; margin: 0 auto 24px;">
            Your AgroTravel session has timed out because there was no activity for more than <b>2 minutes</b> (Academic Lab Session Experiment).
        </p>
        <button type="button" class="btn btn-primary" onclick="location.href='dashboard.jsp'">
            Create New Session &rarr;
        </button>
    </div>
</section>

<footer>
    <div class="footer-bottom">
        <p>© 2026 AgroTravel. All rights reserved.</p>
    </div>
</footer>

</body>
</html>