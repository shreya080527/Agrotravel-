<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Delete Cookie - AgroTravel</title>
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
    <span>🔬 <b>Lab Feature:</b> Cookie Invalidation (DeleteCookieServlet &rarr; MaxAge = 0)</span>
    <div>
        <a href="VisitServlet">Visit Counter</a> |
        <a href="dashboard.jsp">Dashboard</a> |
        <a href="ActiveUserServlet">Active Users</a>
    </div>
</div>

<section>
    <div class="cart-container" style="max-width: 540px; text-align: center;">
        <div style="font-size: 56px; margin-bottom: 12px;">🗑️</div>
        <h2 style="color: var(--primary);">Cookie Deleted Successfully</h2>
        
        <div style="background: var(--bg-sand); padding: 22px; border-radius: var(--radius-sm); border: 1px solid var(--border-light); margin: 24px 0;">
            <p style="margin: 0; font-size: 15px; color: var(--text-main);">
                The <code>visitCount</code> cookie has been removed.
            </p>
            <p style="margin: 8px 0 0; font-size: 13px; color: #2e7d32; font-weight: 600;">
                ✓ Cookie MaxAge set to 0. Counter will re-initialize to 1 on your next visit.
            </p>
        </div>

        <div style="display: flex; justify-content: center; gap: 12px; flex-wrap: wrap;">
            <button type="button" class="btn btn-primary" onclick="location.href='VisitServlet'">
                Visit Counter Again 🔄
            </button>
            <a href="dashboard.jsp" class="btn btn-outline">
                Back to Dashboard 👤
            </a>
        </div>
    </div>
</section>

<footer>
    <div class="footer-bottom">
        <p>© 2026 AgroTravel - Cookie Invalidation Module. All rights reserved.</p>
    </div>
</footer>

</body>
</html>