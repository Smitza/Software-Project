<%@ page import="business.User" %>
<%@ page import="business.Product" %>
<%@ page import="daos.CartDao" %>
<%@ page import="java.util.List" %>
<jsp:include page="head.jsp"/>
<%
    User loggedInUser = (User) session.getAttribute("loggedInUser");
    double totalPrice = 0.0;
    if (loggedInUser != null) {
        CartDao cartDao = new CartDao("xtra");
        List<Product> cartProducts = cartDao.getCartByUserId(loggedInUser.getId());

        if(cartProducts.isEmpty()){
            System.out.println("Cart is empty");
        } else {
            for (Product p : cartProducts){
            totalPrice += p.getPrice();
%>

<div class="card">
    <div class="card-body">
        <p class="card-text">Name: <%= p.getName() %></p>
        <p class="card-text">Description: <%= p.getDescription() %></p>
        <p class="card-text">Quantity: <%= p.getQuantity() %></p>
        <p class="card-text">Price: <%= p.getPrice() %></p>
    </div>
</div>
            <% } %>
        <% } %>
<% } %>
<div class="text-center mt-3">
    <p>Total Price: <%= totalPrice %></p>
</div>

<div class="text-center mt-3">
    <form action="delivery.jsp" method="post">
        <input type="hidden" name="action" value="cartCheckout">
        <button type="submit" class="btn btn-primary">Checkout</button>
    </form>
</div>

<jsp:include page="footer.jsp"/>