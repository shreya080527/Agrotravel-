<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="javax.xml.parsers.DocumentBuilder" %>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory" %>
<%@ page import="javax.xml.xpath.XPath" %>
<%@ page import="javax.xml.xpath.XPathConstants" %>
<%@ page import="javax.xml.xpath.XPathFactory" %>
<%@ page import="org.w3c.dom.Document" %>
<%@ page import="org.w3c.dom.Node" %>
<%@ page import="org.w3c.dom.NodeList" %>

<%
    String minRatingParam = request.getParameter("minRating");
    String expression;
    String filterLabel;

    if ("4".equals(minRatingParam)) {
        expression = "/feedbacks/feedback[rating >= 4]";
        filterLabel = "Rating Greater Than or Equal to 4 Stars";
    } else if ("5".equals(minRatingParam)) {
        expression = "/feedbacks/feedback[rating = 5]";
        filterLabel = "Only 5-Star Reviews";
    } else if ("all".equals(minRatingParam)) {
        expression = "/feedbacks/feedback";
        filterLabel = "All Reviews (Unfiltered)";
    } else {
        // Default lab requirement: rating > 3
        expression = "/feedbacks/feedback[rating > 3]";
        filterLabel = "Rating Greater Than 3 Stars (XPath Lab Spec)";
        minRatingParam = "3";
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Feedback Search (XPath) - AgroTravel</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
<style>
.search-container {
    width: 90%;
    max-width: 950px;
    margin: 40px auto;
    background: white;
    padding: 34px;
    border-radius: var(--radius-md);
    box-shadow: var(--shadow-md);
    border: 1px solid var(--border-light);
}
.search-container h2 {
    text-align: center;
    color: var(--primary-deep);
    margin-bottom: 8px;
}
.xpath-banner {
    background: var(--bg-cream);
    border-radius: var(--radius-sm);
    padding: 14px 18px;
    margin: 18px 0 24px;
    font-size: 13.5px;
    border-left: 4px solid var(--primary);
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    gap: 12px;
}
.search-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 15px;
}
.search-table th {
    background: var(--primary-deep);
    color: white;
    padding: 12px 14px;
    text-align: left;
    font-size: 13.5px;
}
.search-table td {
    border-bottom: 1px solid var(--border-light);
    padding: 12px 14px;
    font-size: 14px;
}
.rating-pill {
    display: inline-block;
    background: var(--amber-light);
    color: var(--earth-deep);
    font-weight: 700;
    padding: 3px 10px;
    border-radius: 20px;
    font-size: 12.5px;
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
        <a href="products.jsp">Products</a>
        <a href="feedbackForm.jsp">Feedback</a>
        <a href="feedbackSummary.jsp">Summary</a>
        <a href="feedbackSearch.jsp" class="active">Search</a>
        <a href="dashboard.jsp">Dashboard</a>
    </nav>
</header>

<!-- Lab Ribbon -->
<div class="lab-ribbon">
    <span>🔬 <b>Lab Feature:</b> XML Node Filtering using XPath Engine (<code>javax.xml.xpath.XPath</code>)</span>
    <div>
        <a href="feedbacks.xml">View feedbacks.xml</a> |
        <a href="feedbackSummary.jsp">XSLT Summary</a> |
        <a href="feedbackForm.jsp">+ Add Review</a>
    </div>
</div>

<div class="search-container">
    <h2>XPath Feedback Search Filter</h2>
    <p style="text-align: center; color: var(--text-muted); font-size: 14px; margin: 0 0 16px;">
        Queries XML nodes directly using W3C XPath standard syntax without database overhead.
    </p>

    <!-- Interactive XPath Selector Form -->
    <form action="feedbackSearch.jsp" method="get" style="width: 100%; max-width: 100%; margin: 0; padding: 16px 20px; background: var(--bg-sand); box-shadow: none; border: 1px solid var(--border-light); display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 12px;">
        <div style="display: flex; align-items: center; gap: 10px; flex-wrap: wrap;">
            <label for="minRating" style="font-weight: 700; font-size: 14px; color: var(--primary-deep); margin: 0;">Select XPath Expression Filter:</label>
            <select id="minRating" name="minRating" onchange="this.form.submit()" style="padding: 8px 12px; border-radius: var(--radius-sm); border: 1px solid var(--border-light); background: #ffffff; font-family: inherit;">
                <option value="3" <%= "3".equals(minRatingParam) ? "selected" : "" %>>/feedbacks/feedback[rating &gt; 3] (Default Lab Filter)</option>
                <option value="4" <%= "4".equals(minRatingParam) ? "selected" : "" %>>/feedbacks/feedback[rating &gt;= 4] (4+ Stars)</option>
                <option value="5" <%= "5".equals(minRatingParam) ? "selected" : "" %>>/feedbacks/feedback[rating = 5] (Only 5 Stars)</option>
                <option value="all" <%= "all".equals(minRatingParam) ? "selected" : "" %>>/feedbacks/feedback (All Reviews)</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary btn-sm" style="margin: 0;">Apply XPath Filter</button>
    </form>

    <div class="xpath-banner">
        <div>
            <b>Active XPath Expression:</b> <code><%= expression %></code><br>
            <span style="color: var(--text-muted);"><%= filterLabel %></span>
        </div>
        <span class="tag" style="background:#d4edda; color:#155724; font-size: 13px;">✓ XPath Engine Executed</span>
    </div>

    <!-- Preserved Table Container -->
    <table class="search-table">
        <thead>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Product / Farm</th>
                <th>Rating</th>
                <th>Feedback</th>
            </tr>
        </thead>
        <tbody>
        <%
        int matchCount = 0;
        try {
            String xmlPath = application.getRealPath("/feedbacks.xml");
            File xmlFile = new File(xmlPath);

            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document document = builder.parse(xmlFile);

            XPathFactory xPathFactory = XPathFactory.newInstance();
            XPath xpath = xPathFactory.newXPath();

            NodeList nodes = (NodeList) xpath.evaluate(expression, document, XPathConstants.NODESET);
            matchCount = nodes.getLength();

            for (int i = 0; i < nodes.getLength(); i++) {
                Node feedback = nodes.item(i);
                XPath nodeXPath = XPathFactory.newInstance().newXPath();

                String name = nodeXPath.evaluate("name", feedback);
                String email = nodeXPath.evaluate("email", feedback);
                String product = nodeXPath.evaluate("product", feedback);
                String rating = nodeXPath.evaluate("rating", feedback);
                String comment = nodeXPath.evaluate("comment", feedback);
        %>
            <tr>
                <td><b><%= name %></b></td>
                <td><%= email %></td>
                <td><span style="color: var(--primary); font-weight: 600;"><%= product %></span></td>
                <td><span class="rating-pill">★ <%= rating %> / 5</span></td>
                <td><%= comment %></td>
            </tr>
        <%
            }
            if (matchCount == 0) {
        %>
            <tr>
                <td colspan="5" style="text-align: center; color: var(--text-muted); padding: 24px;">
                    No feedback records matched this XPath filter expression.
                </td>
            </tr>
        <%
            }
        } catch(Exception e) {
        %>
            <tr>
                <td colspan="5" style="color: red; text-align: center; padding: 20px;">
                    XPath Query Error: <%= e.getMessage() %>
                </td>
            </tr>
        <%
        }
        %>
        </tbody>
    </table>

    <div style="margin-top: 25px; display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 12px;">
        <span style="font-size: 13.5px; color: var(--text-muted);">
            Matches found: <b><%= matchCount %></b> review nodes in <code>feedbacks.xml</code>.
        </span>
        <div style="display: flex; gap: 10px;">
            <a href="feedbackForm.jsp" class="btn btn-outline btn-sm">Add Feedback</a>
            <a href="feedbackSummary.jsp" class="btn btn-gold btn-sm">XSLT Summary</a>
        </div>
    </div>
</div>

<!-- Footer -->
<footer>
    <div class="footer-bottom">
        <p>© 2026 AgroTravel - XPath XML Processing Module. All rights reserved.</p>
    </div>
</footer>

</body>
</html>