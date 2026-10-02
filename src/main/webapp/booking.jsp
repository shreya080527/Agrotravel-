<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
    String sessionName = (String) session.getAttribute("name");
    String sessionEmail = (String) session.getAttribute("email");
    String requestedFarm = request.getParameter("farm");
    if (requestedFarm == null) {
        requestedFarm = "";
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Book a Farm Visit - AgroTravel</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
<style>
    .booking-wrapper {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 35px;
        align-items: start;
        margin: 30px auto 50px;
    }
    .booking-info-panel {
        background: var(--card-bg);
        padding: 30px;
        border-radius: var(--radius-md);
        border: 1px solid var(--border-light);
        box-shadow: var(--shadow-sm);
    }
    .feature-item {
        display: flex;
        gap: 14px;
        margin-bottom: 18px;
    }
    .feature-icon {
        font-size: 24px;
        background: var(--primary-subtle);
        width: 44px;
        height: 44px;
        border-radius: var(--radius-sm);
        display: flex;
        align-items: center;
        justify-content: center;
        flex-shrink: 0;
    }
    @media (max-width: 860px) {
        .booking-wrapper {
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
        <a href="booking.jsp" class="active">Book a Visit</a>
        <a href="products.jsp">Farm Products</a>
        <a href="cart.jsp">Cart 🛒</a>
        <a href="feedbackForm.jsp">Feedback</a>
        <a href="dashboard.jsp">My Account</a>
        <a href="about.html">About</a>
        <a href="register.jsp" class="nav-highlight">Register</a>
    </nav>
</header>

<!-- Lab Ribbon -->
<div class="lab-ribbon">
    <span>🔬 <b>Lab Features:</b> Java Servlet Database Insertion (BookingServlet), MySQL `booking` table persistence</span>
    <div>
        <a href="farm.html">Explore Farms</a> |
        <a href="products.jsp">Farm Products</a> |
        <a href="dashboard.jsp">Dashboard</a>
    </div>
</div>

<section>
    <div class="container">
        <div class="section-header">
            <span class="section-tag">Reservations</span>
            <h2 class="section-title">Schedule Your Farm Tour or Stay</h2>
            <p class="section-desc">Experience hands-on rural farming, harvesting workshops, tractor tours, and organic meals.</p>
        </div>

        <div class="booking-wrapper">
            <!-- Left: Info panel -->
            <div class="booking-info-panel">
                <h3 style="color: var(--primary-deep); margin-bottom: 14px;">Why Visit Our Farms?</h3>
                <p style="color: var(--text-muted); font-size: 14.5px; margin-bottom: 22px;">
                    Whether you are an individual explorer, a family seeking green open spaces, or a school group wanting educational insights, our partner farms offer safe, guided, and enriching encounters.
                </p>

                <div class="feature-item">
                    <div class="feature-icon">🌱</div>
                    <div>
                        <h4 style="margin: 0 0 4px; font-size: 16px;">Hands-On Activities</h4>
                        <p style="margin: 0; font-size: 13.5px; color: var(--text-muted);">Pick fresh vegetables, harvest seasonal fruits, or learn traditional bio-fertilizer composting.</p>
                    </div>
                </div>

                <div class="feature-item">
                    <div class="feature-icon">🍲</div>
                    <div>
                        <h4 style="margin: 0 0 4px; font-size: 16px;">Authentic Farm Meals</h4>
                        <p style="margin: 0; font-size: 13.5px; color: var(--text-muted);">Savor meals made with ingredients picked the same morning on banana leaves.</p>
                    </div>
                </div>

                <div class="feature-item">
                    <div class="feature-icon">🚜</div>
                    <div>
                        <h4 style="margin: 0 0 4px; font-size: 16px;">Safety &amp; Guidance</h4>
                        <p style="margin: 0; font-size: 13.5px; color: var(--text-muted);">Trained agricultural guides accompany every group throughout the tour.</p>
                    </div>
                </div>

                <!-- Dynamic Farm Details Box (Preserved ID from script.js) -->
                <div id="farmDetails" style="margin-top: 24px; padding: 16px; background: var(--bg-cream); border-radius: var(--radius-sm); border-left: 4px solid var(--primary); font-size: 14px; font-weight: 600; color: var(--primary-deep);">
                    🌱 Green Farm is famous for organic vegetables and fresh fruits.
                </div>

                <!-- Booking Info Container (Preserved ID from script.js) -->
                <div id="bookingInfo" style="margin-top: 15px;"></div>
            </div>

            <!-- Right: Booking Form -->
            <div>
                <form action="BookingServlet" method="post" style="width: 100%; max-width: 100%; margin: 0;">
                    <h3 style="color: var(--primary-deep); margin-bottom: 18px; text-align: center;">Enter Booking Details</h3>

                    <div class="form-group">
                        <label for="name">Visitor Name *</label>
                        <input type="text"
                               id="name"
                               name="name"
                               value="<%= sessionName != null ? sessionName : "" %>"
                               placeholder="e.g. Shreya A"
                               required>
                    </div>

                    <div class="form-group">
                        <label for="email">Email Address *</label>
                        <input type="email"
                               id="email"
                               name="email"
                               value="<%= sessionEmail != null ? sessionEmail : "" %>"
                               placeholder="e.g. shreya@example.com"
                               required>
                    </div>

                    <div class="form-group">
                        <label for="farm">Select Farm Estate *</label>
                        <select id="farm" name="farm" required>
                            <option value="Green Farm" <%= "Green Farm".equalsIgnoreCase(requestedFarm) ? "selected" : "" %>>Green Farm (Salem - Organic Vegetables)</option>
                            <option value="Nature Farm" <%= "Nature Farm".equalsIgnoreCase(requestedFarm) ? "selected" : "" %>>Nature Farm (Coimbatore - Fruit Orchards)</option>
                            <option value="Organic Farm" <%= "Organic Farm".equalsIgnoreCase(requestedFarm) ? "selected" : "" %>>Organic Farm (Pollachi - Dairy &amp; Honey)</option>
                            <option value="Highland Agro Farm" <%= "Highland Agro Farm".equalsIgnoreCase(requestedFarm) ? "selected" : "" %>>Highland Agro Farm (Ooty - Eco Tea)</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="description">Trip Details &amp; Special Requests</label>
                        <textarea id="description"
                                  name="description"
                                  rows="4"
                                  placeholder="Preferred visit date, number of visitors, group type (family/school), or dietary preferences..."></textarea>
                    </div>

                    <div style="margin-top: 24px;">
                        <button type="submit" style="width: 100%;">
                            Submit Booking Request 🚀
                        </button>
                    </div>
                </form>
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
            <p>Connecting people with nature and authentic rural living.</p>
        </div>
        <div class="footer-col">
            <h4>Quick Links</h4>
            <ul>
                <li><a href="index.html">Home</a></li>
                <li><a href="farm.html">Explore Farms</a></li>
                <li><a href="gallery.html">Gallery</a></li>
                <li><a href="products.jsp">Farm Products</a></li>
                <li><a href="dashboard.jsp">Dashboard</a></li>
            </ul>
        </div>
        <div class="footer-col">
            <h4>Lab Modules</h4>
            <ul>
                <li><a href="register.jsp">Registration (AJAX/PHP)</a></li>
                <li><a href="VisitServlet">Visit Cookie Counter</a></li>
                <li><a href="feedbackForm.jsp">Submit XML Feedback</a></li>
                <li><a href="feedbackSummary.jsp">XSLT Feedback Summary</a></li>
            </ul>
        </div>
        <div class="footer-col">
            <h4>Reservations Desk</h4>
            <p>📞 +91 98765 43210</p>
            <p>✉️ bookings@agrotravel.com</p>
        </div>
    </div>
    <div class="footer-bottom">
        <p>© 2026 AgroTravel - Farm Booking Portal. All rights reserved.</p>
    </div>
</footer>

<script src="script.js"></script>

</body>
</html>