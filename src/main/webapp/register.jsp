<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register - AgroTravel</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
<style>
    .register-card-box {
        width: 520px;
        max-width: 95%;
        margin: 35px auto 60px;
        background: #ffffff;
        padding: 38px 34px;
        border-radius: var(--radius-md);
        box-shadow: var(--shadow-lg);
        border: 1px solid var(--border-light);
        border-top: 6px solid var(--primary);
        color: var(--text-main);
    }
    .register-card-box h2 {
        color: var(--primary-deep);
        margin-bottom: 8px;
        text-align: center;
    }
    .register-card-box p.form-sub {
        color: var(--text-muted);
        font-size: 14px;
        text-align: center;
        margin-bottom: 24px;
    }
    .field-hint {
        font-size: 12px;
        color: var(--text-muted);
        margin-top: 4px;
    }
</style>
</head>

<body class="register-page">

<!-- Global Navigation -->
<nav>
    <a href="index.html">Home</a>
    <a href="farm.html">Farm</a>
    <a href="gallery.html">Gallery</a>
    <a href="register.jsp" class="nav-highlight">Register</a>
    <a href="booking.jsp">Book</a>
    <a href="products.jsp">E-Commerce</a>
    <a href="cart.jsp">Cart</a>
    <a href="feedbackForm.jsp">Feedback</a>
    <a href="feedbackSummary.jsp">Summary</a>
    <a href="feedbackSearch.jsp">Search</a>
    <a href="dashboard.jsp">Dashboard</a>
</nav>

<section style="padding: 40px 20px 10px;">
    <!-- Welcome Heading for Selenium locator findElement(By.className("welcome-heading")) & findElement(By.tagName("h1")) -->
    <h1 class="welcome-heading">Welcome to AgroTravel</h1>

    <p class="welcome-sub">
        Register below to start exploring farms, booking visits,
        and experiencing real rural life.
    </p>
</section>

<div class="register-card-box">
    <h2>Register Here</h2>
    <p class="form-sub">Join thousands of travelers connecting directly with local agro-estates.</p>

    <form id="registerForm" action="RegisterServlet" method="post" style="width:100%; max-width:100%; margin:0; padding:0; box-shadow:none; border:none; background:transparent;">

        <div class="form-group">
            <label for="name">Full Name *</label>
            <input type="text"
                   id="name"
                   name="name"
                   placeholder="Name"
                   required
                   autocomplete="name">
            <div class="field-hint">Enter your full name (letters only).</div>
        </div>

        <div class="form-group">
            <label for="phone">Phone Number *</label>
            <input type="text"
                   id="phone"
                   name="phone"
                   placeholder="Phone"
                   required
                   autocomplete="tel">
            <div class="field-hint">10-digit mobile number for visit updates.</div>
        </div>

        <div class="form-group">
            <label for="location">Location / City *</label>
            <input type="text"
                   id="location"
                   name="location"
                   placeholder="Location"
                   required>
            <div class="field-hint">Your home city (e.g. Coimbatore, Salem, Chennai).</div>
        </div>

        <button type="submit" style="width: 100%; margin-top: 10px;">
            Register Now
        </button>

    </form>

    <!-- AJAX validation result -->
    <div id="ajaxResult"
         style="margin-top:20px; font-size:15px; font-weight:600; min-height:28px;">
    </div>

    <p id="message" style="margin-top: 8px; font-size: 13px; color: var(--text-muted);"></p>

    <div style="margin-top: 24px; padding-top: 18px; border-top: 1px solid var(--border-light); text-align: center; font-size: 14px;">
        Already registered? <a href="dashboard.jsp" style="color: var(--primary); font-weight: 700; text-decoration: none;">Access Your Dashboard &rarr;</a>
    </div>
</div>

<footer style="margin-top: 40px; background: rgba(18, 44, 25, 0.95);">
    <p style="margin: 0;">© 2026 AgroTravel - Discover Farms. Experience Nature. Shop Fresh.</p>
</footer>

<script>
var formSubmitted = false;

document.getElementById("registerForm").addEventListener("submit", function(event) {
    if (formSubmitted) {
        return; // Allow native submission
    }
    
    event.preventDefault();

    var name = document.getElementById("name").value.trim();
    var phone = document.getElementById("phone").value.trim();
    var locationVal = document.getElementById("location").value.trim();

    var result = document.getElementById("ajaxResult");
    var form = this;

    // Client-side quick check
    if (name === "" || phone === "" || locationVal === "") {
        result.innerHTML = "<span style='color:#c93b2b;'>Please fill all required fields.</span>";
        return;
    }

    result.innerHTML = "<span style='color:#245832;'>⏳ Validating details via PHP AJAX service...</span>";

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "http://localhost/agrotravel/validate.php", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

    xhr.timeout = 3000;

    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                result.innerHTML = xhr.responseText;
                // If PHP returns valid, submit to RegisterServlet (MySQL insertion)
                if (xhr.responseText.indexOf("valid") !== -1 || xhr.responseText.indexOf("Valid") !== -1) {
                    localStorage.setItem("agrotravel_currentUser", name);
                    result.innerHTML += "<br><span style='color:#245832;'>Submitting registration to AgroTravel database...</span>";
                    formSubmitted = true;
                    setTimeout(function() {
                        form.submit();
                    }, 600);
                }
            } else {
                // If PHP server is offline or not running on port 80, perform fallback client validation and submit to Servlet
                if (/^[a-zA-Z ]+$/.test(name) && /^[0-9]{10}$/.test(phone) && locationVal !== "") {
                    result.innerHTML = "<span style='color:#2e7d32;'>✓ Validated (Local fallback). Submitting to database...</span>";
                    localStorage.setItem("agrotravel_currentUser", name);
                    formSubmitted = true;
                    setTimeout(function() {
                        form.submit();
                    }, 500);
                } else {
                    result.innerHTML = "<span style='color:#c93b2b;'>Please enter a valid name (letters only) and a 10-digit phone number.</span>";
                }
            }
        }
    };

    xhr.ontimeout = function() {
        if (/^[a-zA-Z ]+$/.test(name) && /^[0-9]{10}$/.test(phone) && locationVal !== "") {
            localStorage.setItem("agrotravel_currentUser", name);
            formSubmitted = true;
            form.submit();
        }
    };

    var data =
        "name=" + encodeURIComponent(name) +
        "&phone=" + encodeURIComponent(phone) +
        "&location=" + encodeURIComponent(locationVal);

    try {
        xhr.send(data);
    } catch(e) {
        formSubmitted = true;
        form.submit();
    }
});
</script>

</body>
</html>