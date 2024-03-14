<%@ page import="daos.UserDao" %>
<%@ page import="business.User" %>
<%@ page import="business.Product" %>
<%@ page import="daos.CartDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cart</title>
</head>
<body>
<jsp:include page="head.jsp"/>

<%
    User loggedInUser = (User) session.getAttribute("loggedInUser");
    if (loggedInUser != null) {
        CartDao cartDao = new CartDao("xtra");
        Product p = cartDao.getCartByUserId(loggedInUser.getId());
%>

<p><strong>Username:</strong> <%= p.getProductId() %></p>
<p><strong>Email:</strong> <%= p.getQuantity() %></p>

<jsp:include page="footer.jsp"/>
</body>
</html>
