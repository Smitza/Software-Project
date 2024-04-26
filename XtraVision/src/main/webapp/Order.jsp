<%@ page import="business.User" %>
<%@ page import="daos.CartDao" %>
<%@ page import="business.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="daos.ProductDao" %><%--
  Created by IntelliJ IDEA.
  User: carol
  Date: 24/04/2024
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%

        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null) {
        CartDao cartDao = new CartDao("xtra");
                ProductDao productDao = new ProductDao("xtra");
                int id = loggedInUser.getId();
                List<Product> orders = productDao.getOrdersByUserId(id);

%>

<html>
<head>
    <title>Finalized Order</title>
</head>
<body>
<jsp:include page="head.jsp"/>
<%

        for (Product p : orders){
               p.getQuantity();
%>

<div class="row mb-4 d-flex justify-content-between align-items-center">
        <div class="col-md-2 col-lg-2 col-xl-2">
                <img src="images/ProductImages/<%=p.getName()%>gameimg.png" class="img-fluid rounded-3" alt="<%=p.getName()%> Game Image">
        </div>
        <div class="col-md-3 col-lg-3 col-xl-3">
                <h6 class="text-muted"><%=p.getName()%></h6>
        </div>
        <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                <button data-mdb-button-init data-mdb-ripple-init class="btn btn-link px-2"
                        onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                        <i class="fas fa-minus"></i>
                </button>
                <input id="form1" min="0" name="quantity" value="<%=p.getQuantity()%>" type="number"
                       class="form-control form-control-sm" />

                <button data-mdb-button-init data-mdb-ripple-init class="btn btn-link px-2"
                        onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                        <i class="fas fa-plus"></i>
                </button>
        </div>
        <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                <h6 class="mb-0"><%= p.getPrice() %></h6>
        </div>
        <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                <form action="controller" class="text-center" method="POST">
                        <button type="submit" class="btn btn-link"><i class="fas fa-times"></i></button>
                        <input type="hidden" name="productId" value="<%= p.getProductId() %>">
                        <input type="hidden" name="action" value="removeproductcart">
                </form>
        </div>
</div>
<% } %>
<jsp:include page="footer.jsp"/>
</body>
</html>
<% } %>