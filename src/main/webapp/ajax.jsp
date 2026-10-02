<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AgroTravel AJAX Integration Hub</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
<style>
.ajax-grid {
    display: grid;
    grid-template-columns: 1fr;
    gap: 25px;
    margin-top: 25px;
}
.ajax-card {
    background: var(--card-bg);
    border: 1px solid var(--border-light);
    border-radius: var(--radius-md);
    padding: 24px;
    box-shadow: var(--shadow-sm);
    border-left: 5px solid var(--primary);
}
.ajax-card-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 12px;
    flex-wrap: wrap;
    gap: 10px;
}
.ajax-badge {
    font-size: 11.5px;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 0.05em;
    padding: 4px 10px;
    border-radius: 20px;
    background: var(--bg-cream);
    color: var(--earth-deep);
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
        <a href="farm.html">Farm</a>
        <a href="gallery.html">Gallery</a>
        <a href="register.jsp">Register</a>
        <a href="booking.jsp">Book</a>
        <a href="products.jsp">E-Commerce</a>
        <a href="feedbackForm.jsp">Feedback</a>
        <a href="ajax.jsp" class="active">AJAX Hub</a>
        <a href="dashboard.jsp">Dashboard</a>
    </nav>
</header>

<!-- Lab Ribbon -->
<div class="lab-ribbon">
    <span>🔬 <b>Lab Features:</b> Asynchronous JavaScript and XML (AJAX) with 3 Backends: Java Servlet, XML DOM Parser, and PHP REST Service</span>
    <div>
        <a href="register.jsp">AJAX Registration</a> |
        <a href="feedbacks.xml">Raw XML</a> |
        <a href="http://localhost/agrotravel/ajax.php" target="_blank">Direct PHP Endpoint</a>
    </div>
</div>

<section>
    <div class="ajax-container">
        <span class="section-tag" style="display: block; width: fit-content; margin: 0 auto 10px;">Asynchronous Communications</span>
        <h2 style="text-align: center; color: var(--primary-deep); margin-bottom: 8px;">AgroTravel Multi-Protocol AJAX Hub</h2>
        <p style="text-align: center; color: var(--text-muted); font-size: 14.5px; margin: 0 auto 30px; max-width: 650px;">
            Demonstrating seamless asynchronous data retrieval from Java Servlet backend, structured XML documents, and Apache PHP web services without full page reload.
        </p>

        <div class="ajax-grid">
            
            <!-- Protocol 1: AJAX -> Java Servlet -->
            <div class="ajax-card">
                <div class="ajax-card-header">
                    <div>
                        <h3 style="margin: 0; color: var(--primary-deep); font-size: 18px;">1. AJAX &rarr; Java Servlet (AjaxServlet)</h3>
                        <div style="font-size: 13px; color: var(--text-muted);">Asynchronously calls <code>AjaxServlet</code> deployed in Apache Tomcat.</div>
                    </div>
                    <span class="ajax-badge" style="background:#e8f5e9; color:#1b5e20;">Tomcat Java Backend</span>
                </div>
                
                <p style="font-size: 14px; color: var(--text-muted); margin: 8px 0 16px;">
                    Sends an asynchronous HTTP GET request to <code>/AgroTravel1/AjaxServlet</code> and dynamically injects the HTML payload into the DOM.
                </p>

                <button type="button" class="btn btn-primary btn-sm" onclick="loadServlet()">
                    ⚡ Fetch Data from Java Servlet
                </button>

                <div id="servletResult" class="result">
                    <span style="color: var(--text-muted); font-style: italic;">Click the button above to load dynamic servlet data.</span>
                </div>
            </div>

            <!-- Protocol 2: AJAX -> XML -->
            <div class="ajax-card">
                <div class="ajax-card-header">
                    <div>
                        <h3 style="margin: 0; color: var(--primary-deep); font-size: 18px;">2. AJAX &rarr; XML Document (feedbacks.xml)</h3>
                        <div style="font-size: 13px; color: var(--text-muted);">Parses XML DOM nodes client-side from <code>feedbacks.xml</code>.</div>
                    </div>
                    <span class="ajax-badge" style="background:#fff3e0; color:#e65100;">W3C XML DOM Parsing</span>
                </div>

                <p style="font-size: 14px; color: var(--text-muted); margin: 8px 0 16px;">
                    Requests raw XML over XMLHttpRequest, iterates over each <code>&lt;feedback&gt;</code> element, and generates styled review cards.
                </p>

                <button type="button" class="btn btn-gold btn-sm" onclick="loadXML()">
                    📄 Parse &amp; Render XML Data
                </button>

                <div id="xmlResult" class="result">
                    <span style="color: var(--text-muted); font-style: italic;">Click the button above to load and parse XML nodes.</span>
                </div>
            </div>

            <!-- Protocol 3: AJAX -> PHP -->
            <div class="ajax-card">
                <div class="ajax-card-header">
                    <div>
                        <h3 style="margin: 0; color: var(--primary-deep); font-size: 18px;">3. AJAX &rarr; PHP Service (XAMPP agrotravel/ajax.php)</h3>
                        <div style="font-size: 13px; color: var(--text-muted);">Cross-origin API request to local Apache/PHP web service.</div>
                    </div>
                    <span class="ajax-badge" style="background:#e3f2fd; color:#0d47a1;">XAMPP PHP Integration</span>
                </div>

                <p style="font-size: 14px; color: var(--text-muted); margin: 8px 0 16px;">
                    Executes CORS-enabled asynchronous call to <code>http://localhost/agrotravel/ajax.php</code> to fetch real-time farm market status.
                </p>

                <button type="button" class="btn btn-secondary btn-sm" onclick="loadPHP()">
                    🐘 Query PHP Web Service
                </button>

                <div id="phpResult" class="result">
                    <span style="color: var(--text-muted); font-style: italic;">Click the button above to communicate with PHP backend.</span>
                </div>
            </div>

        </div>

        <div style="margin-top: 35px; text-align: center;">
            <a href="register.jsp" class="btn btn-outline">Try AJAX Live Registration Form &rarr;</a>
            <a href="dashboard.jsp" class="btn btn-primary">Go to Dashboard</a>
        </div>
    </div>
</section>

<!-- Footer -->
<footer>
    <div class="footer-bottom">
        <p>© 2026 AgroTravel - AJAX Integration Showcase. All rights reserved.</p>
    </div>
</footer>

<script>
/* AJAX - JSP / Servlet */
function loadServlet() {
    var result = document.getElementById("servletResult");
    result.innerHTML = "<span style='color:var(--primary); font-weight:600;'>⏳ Connecting to AjaxServlet...</span>";

    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4) {
            if (xhr.status == 200) {
                result.innerHTML = xhr.responseText;
            } else {
                result.innerHTML = "<span style='color:#c93b2b;'>Error contacting AjaxServlet (Status: " + xhr.status + ")</span>";
            }
        }
    };
    xhr.open("GET", "AjaxServlet", true);
    xhr.send();
}

/* AJAX - XML */
function loadXML() {
    var result = document.getElementById("xmlResult");
    result.innerHTML = "<span style='color:var(--primary); font-weight:600;'>⏳ Loading feedbacks.xml...</span>";

    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                var xml = xhr.responseXML;
                if (!xml) {
                    result.innerHTML = "<span style='color:#c93b2b;'>XML could not be parsed.</span>";
                    return;
                }

                var feedbacks = xml.getElementsByTagName("feedback");
                var output = "<h4 style='color:var(--primary-deep); margin:0 0 12px;'>✓ Parsed " + feedbacks.length + " Review Records from XML</h4>";
                
                for (var i = 0; i < feedbacks.length; i++) {
                    var name = feedbacks[i].getElementsByTagName("name")[0].textContent;
                    var email = feedbacks[i].getElementsByTagName("email")[0].textContent;
                    var product = feedbacks[i].getElementsByTagName("product")[0].textContent;
                    var rating = feedbacks[i].getElementsByTagName("rating")[0].textContent;
                    var comment = feedbacks[i].getElementsByTagName("comment")[0].textContent;

                    output +=
                        "<div style='background:var(--bg-sand); padding:12px; border-radius:6px; margin-bottom:10px; border-left:3px solid var(--amber);'>" +
                        "<div style='display:flex; justify-content:space-between; margin-bottom:4px;'>" +
                        "<b>" + name + "</b> <span style='color:var(--amber); font-weight:700;'>★ " + rating + "/5</span>" +
                        "</div>" +
                        "<div style='font-size:12.5px; color:var(--primary); font-weight:600;'>" + product + " (" + email + ")</div>" +
                        "<div style='margin-top:4px; font-size:13.5px;'>" + comment + "</div>" +
                        "</div>";
                }

                result.innerHTML = output;
            } else {
                result.innerHTML = "<span style='color:#c93b2b;'>Unable to load XML. Status: " + xhr.status + "</span>";
            }
        }
    };

    xhr.open("GET", "feedbacks.xml", true);
    xhr.send();
}

/* AJAX - PHP */
function loadPHP() {
    var result = document.getElementById("phpResult");
    result.innerHTML = "<span style='color:var(--primary); font-weight:600;'>⏳ Connecting to PHP server (http://localhost/agrotravel/ajax.php)...</span>";

    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                result.innerHTML = xhr.responseText;
            } else {
                result.innerHTML = 
                    "<div style='background:#ffebee; padding:12px; border-radius:6px; color:#c62828;'>" +
                    "<b>PHP Service Notice:</b> Unable to connect to <code>http://localhost/agrotravel/ajax.php</code> (HTTP " + xhr.status + ").<br>" +
                    "<small>Please ensure XAMPP Apache is started on port 80 to test live PHP integration.</small>" +
                    "</div>";
            }
        }
    };

    xhr.open("GET", "http://localhost/agrotravel/ajax.php", true);
    xhr.send();
}
</script>

</body>
</html>