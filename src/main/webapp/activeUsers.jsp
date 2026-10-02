<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
    Object countObj = application.getAttribute("activeUsers");
    int activeCount = 1;
    if (countObj != null) {
        try {
            activeCount = Integer.parseInt(countObj.toString());
            if (activeCount < 1) activeCount = 1;
        } catch (Exception e) {
            activeCount = 1;
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Active Users Monitor - AgroTravel</title>
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
        <a href="dashboard.jsp">Dashboard</a>
    </nav>
</header>

<!-- Lab Ribbon -->
<div class="lab-ribbon">
    <span>🔬 <b>Lab Features:</b> SessionListener (HttpSessionListener), ServletContext Active User Tracking, ActiveUserServlet</span>
    <div>
        <a href="dashboard.jsp">User Dashboard</a> |
        <a href="SessionForm.jsp">Session Demo</a> |
        <a href="VisitServlet">Visit Cookie</a>
    </div>
</div>

<section>
    <div class="cart-container" style="max-width: 600px; text-align: center;">
        <span class="section-tag">System Administration &amp; Telemetry</span>
        <h2 style="color: var(--primary-deep); margin: 10px 0 20px;">Currently Logged-In Users</h2>

        <div style="background: linear-gradient(135deg, var(--bg-cream) 0%, #ecdcc9 100%); padding: 34px 20px; border-radius: var(--radius-md); border: 1px solid var(--border-light); margin: 20px 0;">
            <div style="font-size: 14px; text-transform: uppercase; font-weight: 700; color: var(--earth-deep); letter-spacing: 0.08em; margin-bottom: 8px;">
                Active Browser Sessions
            </div>
            
            <h1 style="font-size: 64px; font-weight: 800; color: var(--primary-deep); margin: 0; line-height: 1;">
                <%= activeCount %>
            </h1>

            <p style="margin: 14px 0 0; font-size: 14px; color: var(--text-muted);">
                Each new browser session increases the active user count.
            </p>
        </div>

        <div style="background: var(--bg-sand); padding: 16px; border-radius: var(--radius-sm); border: 1px solid var(--border-light); text-align: left; font-size: 13.5px; margin-bottom: 24px;">
            <p style="margin: 4px 0;"><b>⚙️ Architecture:</b> Handled by <code>SessionListener</code> implementing <code>HttpSessionListener</code>.</p>
            <p style="margin: 4px 0;"><b>⏱️ Session Scope:</b> Stored globally in Tomcat's <code>ServletContext</code> via key <code>activeUsers</code>.</p>
            <p style="margin: 4px 0;"><b>⏳ Lifecycle:</b> Auto-decrements when sessions timeout or expire (configured for 2 minutes in <code>web.xml</code>).</p>
        </div>

        <div style="display: flex; justify-content: center; gap: 12px; flex-wrap: wrap;">
            <button type="button" class="btn btn-primary" onclick="location.href='ActiveUserServlet'">
                Refresh Counter 🔄
            </button>
            <a href="dashboard.jsp" class="btn btn-outline">
                Back to Dashboard 👤
            </a>
            <a href="index.html" class="btn btn-gold">
                Home Page 🏠
            </a>
        </div>
    </div>
</section>

<!-- Footer -->
<footer>
    <div class="footer-bottom">
        <p>© 2026 AgroTravel - Session Listener &amp; Active User Monitor. All rights reserved.</p>
    </div>
</footer>

</body>
</html>