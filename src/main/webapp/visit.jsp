<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cookie Visit Counter - AgroTravel</title>
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
        <a href="products.jsp">Products</a>
        <a href="dashboard.jsp">Dashboard</a>
    </nav>
</header>

<!-- Lab Ribbon -->
<div class="lab-ribbon">
    <span>🔬 <b>Lab Feature:</b> HTTP Cookie Management (VisitServlet &rarr; visit.jsp)</span>
    <div>
        <a href="DeleteCookieServlet">Delete Cookie</a> |
        <a href="dashboard.jsp">User Dashboard</a> |
        <a href="ActiveUserServlet">Active Users</a>
    </div>
</div>

<section>
    <div class="cart-container" style="max-width: 540px; text-align: center;">
        <div style="font-size: 56px; margin-bottom: 12px;">🍪</div>
        <h2 style="color: var(--primary-deep); margin-bottom: 8px;">Cookie Visit Counter</h2>
        
        <div style="background: var(--bg-sand); padding: 24px; border-radius: var(--radius-sm); border: 1px solid var(--border-light); margin: 24px 0;">
            <p style="font-size: 15px; color: var(--text-muted); margin: 0 0 10px;">Welcome back to AgroTravel!</p>
            <h3 style="font-size: 24px; color: var(--primary); margin: 0;">
                You have visited this page <%= request.getAttribute("count") %> times.
            </h3>
            <p style="font-size: 12.5px; color: var(--text-muted); margin: 10px 0 0;">
                Tracking key: <code>visitCount</code> | Max Age: 24 Hours
            </p>
        </div>

        <div style="display: flex; justify-content: center; gap: 12px; flex-wrap: wrap;">
            <a href="VisitServlet" class="btn btn-primary">
                Visit Again (Increment) 🔄
            </a>
            <a href="DeleteCookieServlet" class="btn btn-danger">
                Delete Cookie 🗑️
            </a>
            <a href="dashboard.jsp" class="btn btn-outline">
                Back to Dashboard 👤
            </a>
        </div>
    </div>
</section>

<footer>
    <div class="footer-bottom">
        <p>© 2026 AgroTravel - Cookie Tracking Module. All rights reserved.</p>
    </div>
</footer>

</body>
</html>