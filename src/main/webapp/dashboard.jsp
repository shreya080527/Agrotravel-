<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.agrotravel.DBConnection" %>

<%
    // Preserve session timeout setting
    if (session.isNew()) {
        session.setMaxInactiveInterval(120);
    }

    String userName = (String) session.getAttribute("name");
    String userEmail = (String) session.getAttribute("email");
    String userPhone = (String) session.getAttribute("phone");
    String userLocation = (String) session.getAttribute("location");

    // Read visit count from cookie
    int visitCount = 1;
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie c : cookies) {
            if ("visitCount".equals(c.getName())) {
                try {
                    visitCount = Integer.parseInt(c.getValue());
                } catch (Exception ex) {
                    visitCount = 1;
                }
            }
        }
    }

    // Active users from ServletContext
    Integer activeUsers = (Integer) application.getAttribute("activeUsers");
    if (activeUsers == null || activeUsers < 1) {
        activeUsers = 1;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Dashboard - AgroTravel</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">

<script>
// Preserved Session Inactivity Timeout functionality
let timeout;
function resetTimer() {
    clearTimeout(timeout);
    // 2 minutes = 120000 ms
    timeout = setTimeout(function() {
        window.location.href = "sessionExpired.jsp";
    }, 120000);
}

window.onload = resetTimer;
document.onmousemove = resetTimer;
document.onkeypress = resetTimer;
document.onclick = resetTimer;
</script>

<style>
    .dashboard-header {
        background: linear-gradient(135deg, var(--primary-deep) 0%, var(--primary) 100%);
        color: #ffffff;
        padding: 35px 28px;
        border-radius: var(--radius-md);
        margin-bottom: 30px;
        box-shadow: var(--shadow-md);
        display: flex;
        justify-content: space-between;
        align-items: center;
        flex-wrap: wrap;
        gap: 20px;
    }
    .user-profile-badge {
        display: flex;
        align-items: center;
        gap: 16px;
    }
    .user-avatar {
        width: 60px;
        height: 60px;
        border-radius: var(--radius-full);
        background: var(--amber);
        color: var(--earth-deep);
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 26px;
        font-weight: 800;
        box-shadow: 0 4px 10px rgba(0,0,0,0.2);
    }
    .session-banner {
        background: #fff3cd;
        color: #856404;
        border: 1px solid #ffeeba;
        padding: 12px 20px;
        border-radius: var(--radius-sm);
        margin-bottom: 25px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        font-size: 13.5px;
        flex-wrap: wrap;
        gap: 10px;
    }
    .table-card {
        background: var(--card-bg);
        padding: 24px;
        border-radius: var(--radius-md);
        border: 1px solid var(--border-light);
        box-shadow: var(--shadow-sm);
        margin-bottom: 30px;
    }
    .table-card h3 {
        color: var(--primary-deep);
        margin-bottom: 14px;
        display: flex;
        justify-content: space-between;
        align-items: center;
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
        <a href="feedbackForm.jsp">Feedback</a>
        <a href="dashboard.jsp" class="active">My Account</a>
        <a href="about.html">About</a>
        <a href="register.jsp" class="nav-highlight">Register</a>
    </nav>
</header>

<!-- Lab Ribbon -->
<div class="lab-ribbon">
    <span>🔬 <b>Lab Features:</b> Session Management (2-min timeout), Cookie Tracking (`visitCount`), Active Users Listener (`activeUsers`), Relational MySQL Queries</span>
    <div>
        <a href="VisitServlet">Increment Cookie Count</a> |
        <a href="DeleteCookieServlet">Reset Cookie</a> |
        <a href="ActiveUserServlet">Active Users Monitor</a> |
        <a href="SessionForm.jsp">Session Form Demo</a>
    </div>
</div>

<section>
    <div class="container">
        
        <!-- Welcome Hero Banner -->
        <div class="dashboard-header">
            <div class="user-profile-badge">
                <div class="user-avatar">
                    <%= (userName != null && !userName.isEmpty()) ? userName.substring(0, 1).toUpperCase() : "A" %>
                </div>
                <div>
                    <h2 style="color: #ffffff; margin: 0 0 4px; font-size: 24px;">
                        Welcome back, <%= (userName != null && !userName.isEmpty()) ? userName : "Valued Agricultural Explorer" %>!
                    </h2>
                    <span style="color: var(--amber-light); font-size: 13.5px;">
                        <%= (userLocation != null && !userLocation.isEmpty()) ? "📍 Based in " + userLocation : "AgroTravel Registered Member" %>
                    </span>
                </div>
            </div>
            <div>
                <a href="booking.jsp" class="btn btn-gold">Book New Visit 🚜</a>
                <a href="products.jsp" class="btn btn-outline-white">Shop Harvest 🥬</a>
            </div>
        </div>

        <!-- Session Inactivity Banner (Lab Requirement) -->
        <div class="session-banner">
            <div>
                ⏱️ <b>Active Session Monitor:</b> Session will automatically expire after <b>2 minutes</b> of inactivity (Academic Lab Experiment 13).
            </div>
            <div>
                <button type="button" class="btn btn-outline btn-sm" onclick="resetTimer()" style="padding: 4px 10px; font-size: 12px;">Reset Activity Timer</button>
            </div>
        </div>

        <!-- Metrics Row -->
        <div class="metrics-row">
            <div class="metric-card">
                <div class="metric-icon">🍪</div>
                <div>
                    <div class="metric-val"><%= visitCount %></div>
                    <div class="metric-label">Website Visits (Cookie)</div>
                </div>
            </div>

            <div class="metric-card">
                <div class="metric-icon">👥</div>
                <div>
                    <div class="metric-val"><%= activeUsers %></div>
                    <div class="metric-label">Online Active Users</div>
                </div>
            </div>

            <div class="metric-card">
                <div class="metric-icon">🌾</div>
                <div>
                    <div class="metric-val">4+</div>
                    <div class="metric-label">Partner Farm Estates</div>
                </div>
            </div>

            <div class="metric-card">
                <div class="metric-icon">🛒</div>
                <div>
                    <div class="metric-val"><%= session.getAttribute("productName") != null ? "1" : "0" %></div>
                    <div class="metric-label">Active Items in Cart</div>
                </div>
            </div>
        </div>

        <!-- Quick Actions Grid -->
        <div class="grid-4" style="margin-bottom: 35px;">
            <div class="card" style="padding: 20px; text-align: center;">
                <div style="font-size: 32px; margin-bottom: 8px;">🚜</div>
                <h4 style="margin: 0 0 6px;">Explore Working Farms</h4>
                <p style="font-size: 13px; color: var(--text-muted); margin-bottom: 14px;">Browse certified organic agro-estates and fruit orchards.</p>
                <a href="farm.html" class="btn btn-outline btn-sm">Explore Farms</a>
            </div>

            <div class="card" style="padding: 20px; text-align: center;">
                <div style="font-size: 32px; margin-bottom: 8px;">📅</div>
                <h4 style="margin: 0 0 6px;">Book Farm Tours</h4>
                <p style="font-size: 13px; color: var(--text-muted); margin-bottom: 14px;">Schedule weekend retreats, fruit picking, and family visits.</p>
                <a href="booking.jsp" class="btn btn-primary btn-sm">Book Visit</a>
            </div>

            <div class="card" style="padding: 20px; text-align: center;">
                <div style="font-size: 32px; margin-bottom: 8px;">🍯</div>
                <h4 style="margin: 0 0 6px;">Fresh Farm Store</h4>
                <p style="font-size: 13px; color: var(--text-muted); margin-bottom: 14px;">Buy raw honey, heirloom rice, and chemical-free vegetables.</p>
                <a href="products.jsp" class="btn btn-gold btn-sm">Shop Products</a>
            </div>

            <div class="card" style="padding: 20px; text-align: center;">
                <div style="font-size: 32px; margin-bottom: 8px;">✍️</div>
                <h4 style="margin: 0 0 6px;">Customer Reviews</h4>
                <p style="font-size: 13px; color: var(--text-muted); margin-bottom: 14px;">Submit and search feedback using XML, XSD, XSLT &amp; XPath.</p>
                <a href="feedbackSummary.jsp" class="btn btn-outline btn-sm">Reviews Hub</a>
            </div>
        </div>

        <!-- Recent Farm Bookings Table (MySQL `booking` Table) -->
        <div class="table-card">
            <h3>
                <span>📅 Recent Farm Visit Bookings (Live Database Records)</span>
                <a href="booking.jsp" class="btn btn-primary btn-sm">+ New Booking</a>
            </h3>

            <%
            Connection con = null;
            PreparedStatement psBooking = null;
            ResultSet rsBooking = null;

            try {
                con = DBConnection.getConnection();
                String bookingSql = "SELECT * FROM booking ORDER BY id DESC LIMIT 5";
                psBooking = con.prepareStatement(bookingSql);
                rsBooking = psBooking.executeQuery();

                if (!rsBooking.isBeforeFirst()) {
            %>
                <p style="color: var(--text-muted); font-size: 14px;">No booking records found in database. Schedule your first visit today!</p>
            <%
                } else {
            %>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Visitor Name</th>
                            <th>Email</th>
                            <th>Farm Destination</th>
                            <th>Visit Description / Notes</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        while (rsBooking.next()) {
                        %>
                        <tr>
                            <td>#<%= rsBooking.getInt("id") %></td>
                            <td><b><%= rsBooking.getString("name") %></b></td>
                            <td><%= rsBooking.getString("email") %></td>
                            <td><span class="tag" style="background:#d4edda; color:#155724;"><%= rsBooking.getString("farm") %></span></td>
                            <td style="font-size: 13px;"><%= rsBooking.getString("description") != null ? rsBooking.getString("description") : "General Farm Tour" %></td>
                        </tr>
                        <%
                        }
                        %>
                    </tbody>
                </table>
            <%
                }
            } catch (Exception e) {
                out.println("<p style='color:red;'>Could not load bookings: " + e.getMessage() + "</p>");
            } finally {
                if (rsBooking != null) try { rsBooking.close(); } catch(Exception ex) {}
                if (psBooking != null) try { psBooking.close(); } catch(Exception ex) {}
            }
            %>
        </div>

        <!-- Recent Farm Orders Table (MySQL `orders` Table) -->
        <div class="table-card">
            <h3>
                <span>📦 Recent Farm Product Orders (Live Database Records)</span>
                <a href="products.jsp" class="btn btn-gold btn-sm">+ Shop Products</a>
            </h3>

            <%
            PreparedStatement psOrders = null;
            ResultSet rsOrders = null;

            try {
                if (con == null || con.isClosed()) {
                    con = DBConnection.getConnection();
                }
                String ordersSql = "SELECT * FROM orders ORDER BY order_id DESC LIMIT 5";
                psOrders = con.prepareStatement(ordersSql);
                rsOrders = psOrders.executeQuery();

                if (!rsOrders.isBeforeFirst()) {
            %>
                <p style="color: var(--text-muted); font-size: 14px;">No purchase orders found in database yet.</p>
            <%
                } else {
            %>
                <table>
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Customer</th>
                            <th>Product</th>
                            <th>Quantity</th>
                            <th>Total (₹)</th>
                            <th>Delivery Address</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        while (rsOrders.next()) {
                        %>
                        <tr>
                            <td>#ORD-<%= rsOrders.getInt("order_id") %></td>
                            <td><%= rsOrders.getString("customer_name") %></td>
                            <td><b><%= rsOrders.getString("product_name") %></b></td>
                            <td><%= rsOrders.getInt("quantity") %></td>
                            <td><span style="font-weight: 800; color: var(--primary);">&#8377; <%= rsOrders.getDouble("total_price") %></span></td>
                            <td style="font-size: 13px;"><%= rsOrders.getString("address") %></td>
                        </tr>
                        <%
                        }
                        %>
                    </tbody>
                </table>
            <%
                }
            } catch (Exception e) {
                out.println("<p style='color:red;'>Could not load orders: " + e.getMessage() + "</p>");
            } finally {
                if (rsOrders != null) try { rsOrders.close(); } catch(Exception ex) {}
                if (psOrders != null) try { psOrders.close(); } catch(Exception ex) {}
                if (con != null) try { con.close(); } catch(Exception ex) {}
            }
            %>
        </div>

        <!-- Cookie & Session Utilities Box (Preserves Lab Experiments) -->
        <div style="background: var(--card-bg); padding: 24px; border-radius: var(--radius-md); border: 1px solid var(--border-light); margin-bottom: 40px;">
            <h4 style="margin: 0 0 10px; color: var(--primary-deep);">Cookie &amp; Session Preferences (Academic Lab Demonstration)</h4>
            <p style="font-size: 14px; color: var(--text-muted); margin-bottom: 16px;">
                You have visited this site <b><%= visitCount %></b> times as recorded by your browser's <code>visitCount</code> cookie. You can test cookie tracking or simulate cookie clearance below:
            </p>
            <div style="display: flex; gap: 12px; flex-wrap: wrap;">
                <a href="VisitServlet" class="btn btn-outline btn-sm">Increment Visit Cookie (VisitServlet)</a>
                <a href="DeleteCookieServlet" class="btn btn-danger btn-sm">Clear Visit Cookie (DeleteCookieServlet)</a>
                <a href="ActiveUserServlet" class="btn btn-primary btn-sm">Active Users Monitor (ActiveUserServlet)</a>
                <a href="SessionForm.jsp" class="btn btn-secondary btn-sm">Test HTTP SessionForm</a>
            </div>
        </div>

    </div>
</section>

<!-- Footer -->
<footer>
    <div class="footer-bottom">
        <p>© 2026 AgroTravel - User Dashboard &amp; Account Portal. All rights reserved.</p>
    </div>
</footer>

</body>
</html>