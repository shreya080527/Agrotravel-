<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
    String productName = (String) session.getAttribute("productName");
    Double productPrice = (Double) session.getAttribute("productPrice");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Shopping Cart - AgroTravel</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
<style>
    .cart-table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
    }
    .cart-table th {
        background: var(--primary-deep);
        color: #ffffff;
        padding: 12px 16px;
        text-align: left;
    }
    .cart-table td {
        padding: 16px;
        border-bottom: 1px solid var(--border-light);
    }
    .cart-summary-box {
        background: var(--bg-cream);
        border-radius: var(--radius-sm);
        padding: 20px;
        margin-top: 25px;
        border: 1px solid var(--border-light);
    }
    .cart-summary-row {
        display: flex;
        justify-content: space-between;
        margin-bottom: 10px;
        font-size: 15px;
    }
    .cart-total-row {
        display: flex;
        justify-content: space-between;
        font-size: 20px;
        font-weight: 800;
        color: var(--primary-deep);
        border-top: 2px solid var(--border-light);
        padding-top: 12px;
        margin-top: 12px;
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
        <a href="cart.jsp" class="active">Cart 🛒</a>
        <a href="feedbackForm.jsp">Feedback</a>
        <a href="dashboard.jsp">My Account</a>
        <a href="about.html">About</a>
        <a href="register.jsp" class="nav-highlight">Register</a>
    </nav>
</header>

<!-- Lab Ribbon -->
<div class="lab-ribbon">
    <span>🔬 <b>Lab Features:</b> HTTP Session State Management (CartServlet), Dynamic E-Commerce Calculations</span>
    <div>
        <a href="products.jsp">Browse Products</a> |
        <a href="checkout.jsp">Checkout</a> |
        <a href="SessionForm.jsp">Session Demo</a>
    </div>
</div>

<section>
    <div class="cart-container">
        <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 20px; border-bottom: 2px solid var(--border-light); padding-bottom: 14px;">
            <h2 style="margin: 0; color: var(--primary-deep);">Your Shopping Cart 🛒</h2>
            <a href="products.jsp" style="font-size: 13.5px; color: var(--primary); font-weight: 700; text-decoration: none;">&larr; Continue Shopping</a>
        </div>

        <% if (productName != null && productPrice != null) { %>

        <form action="checkout.jsp" method="post" style="width: 100%; max-width: 100%; margin: 0; padding: 0; box-shadow: none; border: none; background: transparent;">
            
            <table class="cart-table">
                <thead>
                    <tr>
                        <th>Selected Farm Product</th>
                        <th>Unit Price</th>
                        <th>Quantity</th>
                        <th>Subtotal</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <div style="display: flex; align-items: center; gap: 14px;">
                                <div style="font-size: 28px;">📦</div>
                                <div>
                                    <div style="font-weight: 700; font-size: 16px; color: var(--primary-deep);"><%= productName %></div>
                                    <div style="font-size: 12px; color: #2e7d32;">✓ Direct from partner farm</div>
                                </div>
                            </div>
                        </td>
                        <td>
                            <span style="font-weight: 700; color: var(--text-main);">&#8377; <%= productPrice %></span>
                        </td>
                        <td>
                            <input type="number"
                                   id="cartQty"
                                   name="quantity"
                                   value="1"
                                   min="1"
                                   max="50"
                                   class="quantity-input"
                                   onchange="updateSubtotal(<%= productPrice %>)"
                                   oninput="updateSubtotal(<%= productPrice %>)"
                                   required>
                        </td>
                        <td>
                            <span id="subtotalDisplay" style="font-weight: 800; font-size: 17px; color: var(--primary);">&#8377; <%= productPrice %></span>
                        </td>
                    </tr>
                </tbody>
            </table>

            <div class="cart-summary-box">
                <div class="cart-summary-row">
                    <span>Item Subtotal:</span>
                    <span id="summarySubtotal">&#8377; <%= productPrice %></span>
                </div>
                <div class="cart-summary-row">
                    <span>Farm Packing &amp; Direct Handling:</span>
                    <span style="color: #2e7d32; font-weight: 700;">FREE</span>
                </div>
                <div class="cart-total-row">
                    <span>Order Total:</span>
                    <span id="orderTotalDisplay">&#8377; <%= productPrice %></span>
                </div>
            </div>

            <div style="margin-top: 26px; display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 14px;">
                <a href="products.jsp" class="btn btn-outline">Add More Products</a>
                <button type="submit" class="checkout-button">
                    Proceed to Checkout &rarr;
                </button>
            </div>

        </form>

        <% } else { %>

        <div style="text-align: center; padding: 40px 20px;">
            <div style="font-size: 60px; margin-bottom: 12px;">🛒</div>
            <h3 style="color: var(--primary-deep); margin-bottom: 8px;">Your shopping cart is empty</h3>
            <p style="color: var(--text-muted); max-width: 450px; margin: 0 auto 24px;">
                Explore fresh seasonal vegetables, wild apiary honey, heirloom rice, and orchard fruits grown directly by our local farmers.
            </p>
            <a href="products.jsp" class="btn btn-primary">
                Explore Farm Products 🥬
            </a>
        </div>

        <% } %>
    </div>
</section>

<!-- Footer -->
<footer>
    <div class="footer-bottom">
        <p>© 2026 AgroTravel. All rights reserved.</p>
    </div>
</footer>

<script>
function updateSubtotal(unitPrice) {
    const qtyInput = document.getElementById("cartQty");
    let qty = parseInt(qtyInput.value);
    if (isNaN(qty) || qty < 1) {
        qty = 1;
        qtyInput.value = 1;
    }
    const total = (unitPrice * qty).toFixed(2);
    document.getElementById("subtotalDisplay").innerText = "₹ " + total;
    document.getElementById("summarySubtotal").innerText = "₹ " + total;
    document.getElementById("orderTotalDisplay").innerText = "₹ " + total;
}
</script>

</body>
</html>