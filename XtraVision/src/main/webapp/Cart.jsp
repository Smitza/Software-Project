<%@ page import="business.User" %>
<%@ page import="business.Product" %>
<%@ page import="daos.CartDao" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %><!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cart</title>
</head>
<body>
<jsp:include page="head.jsp"/>
<h1 class="text-center"> Your Cart </h1>
<%
    User loggedInUser = (User) session.getAttribute("loggedInUser");
    if (loggedInUser != null) {
        CartDao cartDao = new CartDao("xtra");
        List<Product> cartProducts = cartDao.getCartByUserId(loggedInUser.getId());

        if(cartProducts.isEmpty()){
            System.out.println("Cart is empty");
        } else {
            for (Product p : cartProducts){

%>

<div class="card">
    <div class="card-body">
        <p class="card-text">Name <%= p.getName() %></p>
        <p class="card-text">ProductId <%= p.getProductId() %></p>
        <p class="card-text">Quantity <%= p.getQuantity() %></p>
    </div>
</div>
            <% } %>
        <% } %>
<jsp:include page="footer.jsp"/>
</body>
</html>
<% } %>