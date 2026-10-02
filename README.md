# 🌾 AgroTravel — Farm Tourism & Farm Products Web Application

> **"Discover Farms. Experience Nature. Shop Fresh."**

AgroTravel is a comprehensive full-stack Java Dynamic Web Application developed using the Java Servlet & JSP architecture, MySQL relational database, XML technologies (XSD, XSLT, XPath), multi-protocol AJAX communications, PHP web services, and automated Selenium WebDriver test suites.

---

## 🌟 Key Features

1. **Farm Tourism Discovery (`farm.html`)**
   - Curated working agro-ecological estates in Salem, Coimbatore, Pollachi, and Ooty.
   - Interactive client-side filters for Location, Farm Type, and Price Range.
   - Interactive farm details modal with activity schedules, visiting hours, amenities, and verified reviews.
2. **Interactive Photo Gallery (`gallery.html`)**
   - Auto-rotating showcase slider with mouse hover DOM events.
   - Categorized responsive gallery grid (Farms, Activities, Harvest, Visitors).
3. **User Registration & Live AJAX Validation (`register.jsp`)**
   - Asynchronous client-to-server validation via local PHP endpoint (`validate.php`).
   - Server-side validation and persistence via `RegisterServlet` into MySQL `users` table.
4. **Farm Visit Booking Portal (`booking.jsp`)**
   - Auto-populates registered user details from session.
   - Direct farm pre-selection from farm cards.
   - Persisted via `BookingServlet` into MySQL `booking` table.
5. **Fresh Farm Products E-Commerce (`products.jsp`)**
   - Live product listings loaded dynamically from MySQL `products` table.
   - Session-based cart persistence (`CartServlet` & `cart.jsp`).
   - Order checkout (`checkout.jsp`) and order confirmation (`orderSuccess.jsp`).
6. **User Dashboard & Telemetry (`dashboard.jsp`)**
   - Real-time display of recent bookings and recent product orders from MySQL.
   - Cookie visit counter tracking (`visitCount`).
   - 2-minute session inactivity timer and auto-redirect to `sessionExpired.jsp`.
7. **XML Customer Feedback & Search System**
   - Review submission (`feedbackForm.jsp`) parsed via Java DOM and stored in `feedbacks.xml`.
   - Structural XML validation via `feedbackSchema.xsd`.
   - Dynamic XSLT transformation into responsive review tables (`feedbackSummary.xsl` & `feedbackSummary.jsp`).
   - XPath node filtering (`feedbackSearch.jsp`) evaluating `/feedbacks/feedback[rating > 3]`.
8. **Multi-Protocol AJAX Integration Hub (`ajax.jsp`)**
   - Protocol 1: AJAX to Java Servlet (`AjaxServlet`).
   - Protocol 2: AJAX to XML DOM Parser (`feedbacks.xml`).
   - Protocol 3: AJAX to PHP Web Service (`ajax.php`).
9. **Active Users & Session Management**
   - `SessionListener` implementing `javax.servlet.http.HttpSessionListener` tracking live user counts.
   - `ActiveUserServlet` and `activeUsers.jsp` telemetry view.
10. **Automated Selenium WebDriver Suite (`AgroTravelTesting.java`)**
    - 100% automated test coverage across Chrome and Edge browsers.
    - Tests navigation, element states, mouse actions, scrolling, and all 7 locators (`id`, `name`, `className`, `linkText`, `tagName`, `cssSelector`, `xpath`).

---

## 🛠️ Technology Stack

- **Backend / Web Layer:** Java 17 / 24, Java Servlets (JSR 315), JSP (JavaServer Pages)
- **Servlet Container:** Apache Tomcat 9
- **Database:** MySQL 8.0 with JDBC (`mysql-connector-j-9.4.0.jar`)
- **Frontend:** HTML5, CSS3, JavaScript (ES6+), XML, XSD, XSLT, XPath, AJAX
- **Microservice / Validation Layer:** PHP 8.0 on XAMPP Apache
- **Testing:** Selenium WebDriver 4.49.0
- **IDE:** Eclipse Dynamic Web Project

---

## 📁 Repository Structure

```text
Agrotravel-/
├── .classpath                          # Eclipse project classpath configuration
├── .project                            # Eclipse project descriptor
├── vercel.json                         # Vercel deployment routing configuration
├── database/
│   └── agrotravel_db.sql               # MySQL database dump (users, booking, products, orders)
├── php/
│   ├── validate.php                    # CORS-enabled AJAX registration validator
│   └── ajax.php                        # CORS-enabled live farm status endpoint
├── src/main/
│   ├── java/com/agrotravel/
│   │   ├── ActiveUserServlet.java      # Active users servlet
│   │   ├── AgroTravelTesting.java      # Complete Selenium WebDriver testing suite
│   │   ├── AjaxServlet.java            # Asynchronous AJAX response servlet
│   │   ├── BookingServlet.java         # Farm tour booking processor
│   │   ├── CartServlet.java            # Shopping cart session manager
│   │   ├── CheckoutServlet.java        # Order placement servlet
│   │   ├── DBConnection.java           # Centralized JDBC connection manager
│   │   ├── DeleteCookieServlet.java    # Cookie invalidation handler
│   │   ├── FeedbackServlet.java        # XML DOM feedback persistence
│   │   ├── RegisterServlet.java        # User registration servlet
│   │   ├── SessionListener.java        # HttpSessionListener active user telemetry
│   │   ├── SessionServlet.java         # HTTP session attributes setter
│   │   └── VisitServlet.java           # HTTP cookie tracking counter
│   └── webapp/
│       ├── WEB-INF/
│       │   ├── web.xml                 # Web descriptor with SessionListener & timeout
│       │   └── lib/                    # MySQL JDBC driver jar
│       ├── images/                     # Farm & organic product photography
│       ├── index.html                  # AgroTravel modern landing page
│       ├── farm.html                   # Farm exploration & discovery portal
│       ├── gallery.html                # Responsive gallery & rotating slider
│       ├── about.html                  # Mission, offerings & contact desk
│       ├── register.jsp                # User registration page
│       ├── booking.jsp                 # Farm visit booking page
│       ├── products.jsp                # Farm products catalog
│       ├── cart.jsp                    # Shopping cart view
│       ├── checkout.jsp                # Order billing & shipping
│       ├── orderSuccess.jsp            # Purchase confirmation
│       ├── dashboard.jsp               # User account & telemetry dashboard
│       ├── activeUsers.jsp             # Online user monitoring
│       ├── visit.jsp                   # Cookie visit counter display
│       ├── deleteCookie.jsp            # Cookie deletion confirmation
│       ├── SessionForm.jsp             # Manual session test form
│       ├── Confirmation.jsp            # Session confirmation view
│       ├── sessionExpired.jsp          # Inactivity timeout alert
│       ├── feedbackForm.jsp            # Customer review input form
│       ├── feedbacks.xml               # Structured XML feedback storage
│       ├── feedbackSchema.xsd          # W3C XML Schema definition
│       ├── feedbackSummary.xsl         # XSLT transformation stylesheet
│       ├── feedbackSummary.jsp         # Dynamic XSLT summary renderer
│       ├── feedbackSearch.jsp          # XPath node query interface
│       ├── ajax.jsp                    # Multi-protocol AJAX dashboard
│       ├── style.css                   # Cohesive nature-inspired stylesheet
│       └── script.js                   # Client-side interactions & sliders
```

---

## 🚀 How to Run Locally

### 1. Prerequisites
- **Java Development Kit (JDK 17+)**
- **Apache Tomcat 9**
- **XAMPP** (with Apache and MySQL enabled)
- **Eclipse IDE for Enterprise Java and Web Developers**

### 2. Database Setup
1. Open phpMyAdmin (`http://localhost/phpmyadmin`) or MySQL CLI:
   ```sql
   CREATE DATABASE agrotravel_db;
   USE agrotravel_db;
   ```
2. Import `database/agrotravel_db.sql`:
   ```bash
   mysql -u root -p agrotravel_db < database/agrotravel_db.sql
   ```

### 3. PHP Setup in XAMPP
Copy files from `php/` to `C:/xampp/htdocs/agrotravel/`:
- `validate.php`
- `ajax.php`
Start Apache in XAMPP Control Panel.

### 4. Running the Web Application
1. In Eclipse, import the project: **File** &rarr; **Import** &rarr; **Existing Projects into Workspace**.
2. Right-click `AgroTravel1` &rarr; **Run As** &rarr; **Run on Server** (select Apache Tomcat v9.0).
3. Access the website at:
   ```text
   http://localhost:8080/AgroTravel1/index.html
   ```

---

## 🧪 Running Automated Selenium Tests

1. Start Tomcat on port `8080`.
2. In Eclipse, navigate to `src/main/java/com/agrotravel/AgroTravelTesting.java`.
3. Right-click &rarr; **Run As** &rarr; **Java Application**.
4. The test suite will launch Chrome & Edge, test all locators, web elements, navigation, and log test status to the console.

---

## 🌐 Deploying to Vercel

This repository includes a `vercel.json` file configured for static frontend deployment on Vercel:
1. Log in to [Vercel](https://vercel.com) and click **Add New...** &rarr; **Project**.
2. Import your GitHub repository: `https://github.com/shreya080527/Agrotravel-`.
3. Keep default settings and click **Deploy**.
4. The static frontend pages (`index.html`, `farm.html`, `gallery.html`, `about.html`, `style.css`, etc.) will be hosted live on your `.vercel.app` domain.
*(Note: Full backend Java Servlets and MySQL require a Java-compatible cloud environment like Render, Railway, or AWS).*

---

## 📄 License
This project is developed as part of an academic Web Programming and Automated Testing curriculum. All rights reserved.
