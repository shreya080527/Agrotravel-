<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String sessionName = (String) session.getAttribute("name");
    String sessionEmail = (String) session.getAttribute("email");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Product &amp; Farm Feedback - AgroTravel</title>
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
        <a href="farm.html">Explore Farms</a>
        <a href="gallery.html">Gallery</a>
        <a href="booking.jsp">Book a Visit</a>
        <a href="products.jsp">Farm Products</a>
        <a href="cart.jsp">Cart 🛒</a>
        <a href="feedbackForm.jsp" class="active">Feedback</a>
        <a href="dashboard.jsp">My Account</a>
        <a href="about.html">About</a>
        <a href="register.jsp" class="nav-highlight">Register</a>
    </nav>
</header>

<!-- Lab Ribbon -->
<div class="lab-ribbon">
    <span>🔬 <b>Lab Features:</b> XML Storage (FeedbackServlet), XSD Schema Validation, XSLT Transformation, XPath Query Search</span>
    <div>
        <a href="feedbackSummary.jsp">XSLT Review Summary</a> |
        <a href="feedbackSearch.jsp">XPath Search (&gt; 3 Stars)</a> |
        <a href="feedbacks.xml">Raw XML Feed</a>
    </div>
</div>

<section>
    <div class="feedback-container">
        <span class="section-tag" style="display: block; width: fit-content; margin: 0 auto 10px;">Customer Reviews &amp; XML Store</span>
        <h2>Product &amp; Farm Feedback</h2>
        <p style="text-align: center; color: var(--text-muted); font-size: 14px; margin-bottom: 24px;">
            Your reviews are validated against <code>feedbackSchema.xsd</code> and stored in structured <code>feedbacks.xml</code>.
        </p>

        <form action="FeedbackServlet" method="post" style="width: 100%; max-width: 100%; margin: 0; padding: 0; box-shadow: none; border: none; background: transparent;">

            <!-- Input 1: Name -->
            <div class="form-group">
                <label for="name">Your Name *</label>
                <input type="text"
                       id="name"
                       name="name"
                       value="<%= sessionName != null ? sessionName : "" %>"
                       placeholder="e.g. Dharshini S"
                       required>
            </div>

            <!-- Input 2: Email -->
            <div class="form-group">
                <label for="email">Email Address *</label>
                <input type="email"
                       id="email"
                       name="email"
                       value="<%= sessionEmail != null ? sessionEmail : "" %>"
                       placeholder="e.g. dharshini@gmail.com"
                       required>
            </div>

            <!-- Input 3: Product / Farm -->
            <div class="form-group">
                <label for="product">Product or Farm Destination *</label>
                <select id="product" name="product" required>
                    <option value="">Select Item / Experience</option>
                    <option value="Organic Vegetables">Organic Vegetables</option>
                    <option value="Farm Honey">Farm Honey</option>
                    <option value="Organic Rice">Organic Rice</option>
                    <option value="Fresh Fruits">Fresh Fruits</option>
                    <option value="Green Farm Tour">Green Farm (Salem)</option>
                    <option value="Nature Farm Experience">Nature Farm (Coimbatore)</option>
                    <option value="Organic Dairy Experience">Organic Farm (Pollachi)</option>
                </select>
            </div>

            <!-- Input 4: Rating -->
            <div class="form-group">
                <label for="rating">Rating (1 to 5 Stars) *</label>
                <select id="rating" name="rating" required>
                    <option value="">Select Star Rating</option>
                    <option value="5">★★★★★ 5 - Excellent</option>
                    <option value="4">★★★★☆ 4 - Very Good</option>
                    <option value="3">★★★☆☆ 3 - Good</option>
                    <option value="2">★★☆☆☆ 2 - Fair</option>
                    <option value="1">★☆☆☆☆ 1 - Poor</option>
                </select>
            </div>

            <!-- Input 5: Feedback / Comment -->
            <div class="form-group">
                <label for="feedback">Your Review Comments *</label>
                <textarea id="feedback"
                          name="feedback"
                          rows="4"
                          placeholder="Tell other travelers and growers about product quality, taste, freshness, or tour hospitality..."
                          required></textarea>
            </div>

            <button type="submit" style="width: 100%; margin-top: 10px;">
                Submit Feedback to XML &rarr;
            </button>

        </form>

        <div style="margin-top: 25px; padding-top: 20px; border-top: 1px solid var(--border-light); display: flex; justify-content: space-around; flex-wrap: wrap; gap: 10px;">
            <a href="feedbackSummary.jsp" style="font-size: 13.5px; color: var(--primary); font-weight: 700; text-decoration: none;">
                📜 View XSLT Summary
            </a>
            <a href="feedbackSearch.jsp" style="font-size: 13.5px; color: var(--earth-deep); font-weight: 700; text-decoration: none;">
                🔍 XPath Rating Search
            </a>
            <a href="feedbacks.xml" target="_blank" style="font-size: 13.5px; color: var(--text-muted); text-decoration: none;">
                📄 View feedbacks.xml
            </a>
        </div>
    </div>
</section>

<!-- Footer -->
<footer>
    <div class="footer-bottom">
        <p>© 2026 AgroTravel - XML Feedback System. All rights reserved.</p>
    </div>
</footer>

</body>
</html>