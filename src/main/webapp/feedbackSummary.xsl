<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html lang="en">
<head>
<title>AgroTravel Feedback Summary (XSLT)</title>
<link rel="stylesheet" href="style.css"/>
<style>
body {
    margin: 0;
    font-family: 'Plus Jakarta Sans', -apple-system, BlinkMacSystemFont, Arial, sans-serif;
    background-color: #fbf9f4;
    color: #212520;
}
.summary-container {
    width: 90%;
    max-width: 1000px;
    margin: 40px auto;
    background: #ffffff;
    padding: 36px;
    border-radius: 12px;
    box-shadow: 0 8px 24px rgba(22, 56, 32, 0.08);
    border: 1px solid #e4dcce;
}
.table-header-title {
    text-align: center;
    color: #163820;
    margin-bottom: 6px;
}
.table-sub-desc {
    text-align: center;
    color: #5e685f;
    font-size: 14px;
    margin-bottom: 25px;
}
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 15px;
    background: #ffffff;
    border-radius: 8px;
    overflow: hidden;
}
th {
    background-color: #163820;
    color: #ffffff;
    padding: 14px;
    text-align: left;
    font-size: 13.5px;
    text-transform: uppercase;
    letter-spacing: 0.04em;
}
td {
    border-bottom: 1px solid #e4dcce;
    padding: 13px 14px;
    font-size: 14px;
}
tr:nth-child(even) td {
    background-color: #faf9f6;
}
tr:hover td {
    background-color: #e8f3eb;
}
.rating-pill {
    display: inline-block;
    background: #f7e6c4;
    color: #6b4423;
    font-weight: 700;
    padding: 4px 10px;
    border-radius: 20px;
    font-size: 13px;
}
.product-badge {
    font-weight: 600;
    color: #245832;
}
</style>
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
        <a href="farm.html">Explore Farms</a>
        <a href="products.jsp">Farm Products</a>
        <a href="feedbackForm.jsp">Submit Feedback</a>
        <a href="feedbackSearch.jsp">XPath Search</a>
        <a href="dashboard.jsp">Dashboard</a>
    </nav>
</header>

<div class="lab-ribbon">
    <span>🔬 <b>Lab Feature:</b> XML to HTML Transformation via XSLT Stylesheet (feedbackSummary.xsl)</span>
    <div>
        <a href="feedbackForm.jsp">+ New Feedback</a> |
        <a href="feedbackSearch.jsp">XPath Filter</a> |
        <a href="feedbacks.xml">Raw XML Data</a>
    </div>
</div>

<section style="padding: 20px;">
    <div class="summary-container">
        <h2 class="table-header-title">AgroTravel Product &amp; Farm Reviews Summary</h2>
        <p class="table-sub-desc">Dynamically compiled from <code>feedbacks.xml</code> through <code>feedbackSummary.xsl</code> transformation.</p>

        <table>
            <thead>
                <tr>
                    <th>Customer Name</th>
                    <th>Email Address</th>
                    <th>Product / Farm</th>
                    <th>Star Rating</th>
                    <th>Review Comment</th>
                </tr>
            </thead>
            <tbody>
                <xsl:for-each select="feedbacks/feedback">
                    <tr>
                        <td>
                            <b><xsl:value-of select="name"/></b>
                        </td>
                        <td>
                            <xsl:value-of select="email"/>
                        </td>
                        <td>
                            <span class="product-badge"><xsl:value-of select="product"/></span>
                        </td>
                        <td>
                            <span class="rating-pill">
                                ★ <xsl:value-of select="rating"/> / 5
                            </span>
                        </td>
                        <td>
                            <xsl:value-of select="comment"/>
                        </td>
                    </tr>
                </xsl:for-each>
            </tbody>
        </table>

        <div style="margin-top: 30px; display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 14px;">
            <a href="feedbackForm.jsp" class="btn btn-primary btn-sm">✍️ Submit New Review</a>
            <a href="feedbackSearch.jsp" class="btn btn-gold btn-sm">🔍 Filter by Rating (XPath)</a>
            <a href="dashboard.jsp" class="btn btn-outline btn-sm">👤 Return to Dashboard</a>
        </div>
    </div>
</section>

<footer>
    <div class="footer-bottom">
        <p>© 2026 AgroTravel - XSLT Transformation System. All rights reserved.</p>
    </div>
</footer>

</body>
</html>
</xsl:template>
</xsl:stylesheet>