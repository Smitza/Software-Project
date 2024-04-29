<%@ page import="business.User" %>
<%@ page import="daos.CartDao" %>
<%@ page import="business.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="daos.ProductDao" %>
<%@ page import="daos.UserDao" %>
<%@ page import="daos.DeliveryDao" %>
<%@ page import="business.Delivery" %><%--
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
                UserDao userDao = new UserDao("xtra");
                User user = userDao.getUserById(loggedInUser.getId());
                ProductDao productDao = new ProductDao("xtra");
                DeliveryDao deliveryDao = new DeliveryDao("xtra");

                int id = loggedInUser.getId();
                List<Product> orders = productDao.getOrdersByUserId(id);



%>
<jsp:include page="head.jsp"/>


<section class="w-100 px-4 py-5 gradient-custom" style="border-radius: .5rem .5rem 0 0;">
        <style>
                .gradient-custom {
                        /* fallback for old browsers */
                        background: #bb0d0d;

                        /* Chrome 10-25, Safari 5.1-6 */
                        background: -webkit-linear-gradient(to top left, rgb(255, 0, 0), rgb(255, 169, 127));

                        /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
                        background: linear-gradient(to top left, rgb(255, 0, 0), rgb(255, 169, 127))
                }
        </style>
        <div class="row d-flex justify-content-center">
                <div class="col-lg-10 col-xl9">
                        <div class="card" style="border-radius: 10px;">
                                <div class="card-header px-4 py-5">
                                        <h5 class="text-muted mb-0">Thanks for your Order, <span style="color: #ff5400;"><%=user.getName()%></span>!</h5>
                                </div>
                                <div class="card-body p-4">
                                        <div class="d-flex justify-content-between align-items-center mb-4">
                                                <p class="lead fw-normal mb-0" style="color: #ff6400;">Receipt</p>
                                        </div>

                                        <%
                                                double totalPrice = 0;
                                                for (Product p : orders){
                                                         totalPrice += p.getPrice();
                                        %>
                                        <div class="card shadow-0 border mb-4">
                                                <div class="card-body">
                                                        <div class="row">
                                                                <div class="col-md-2">
                                                                        <img src="images/ProductImages/<%=p.getName()%>gameimg.png" class="img-fluid rounded-3" alt="<%=p.getName()%> Game Image">
                                                                </div>
                                                                <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                                        <p class="text-muted mb-0"><%=p.getName()%></p>
                                                                </div>
                                                                <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                                        <p class="text-muted mb-0 small"><%=p.getGenre()%></p>
                                                                </div>
                                                                <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                                        <p class="text-muted mb-0 small">Qty: <%= p.getQuantity()%></p>
                                                                </div>
                                                                <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                                        <p class="text-muted mb-0 small">&#x20AC; <%= p.getPrice() %></p>
                                                                </div>
                                                        </div>
                                                </div>
                                        </div>
                                        <%
                                                }
                                        %>
                                        <div class="d-flex justify-content-between pt-2">
                                                <p class="fw-bold mb-0">Order Details</p>
                                                <p class="text-muted mb-0"><span class="fw-bold me-4">Total</span>&#x20AC;<%= totalPrice %></p>
                                        </div>
                                        <div class="d-flex justify-content-between pt-2">
                                                <p class="fw-bold mb-0">Order Details</p>
                                                <p class="text-muted mb-0"><span class="fw-bold me-4">Delivery Status</span><%= deliveryDao.getDeliveryStatus(deliveryDao.getDeliveryId(id)) %></p>
                                        </div>
                                        <% double finalprice = totalPrice;

                                                        if(user.getMembership() == 3){
                                        %>
                                        <div class="d-flex justify-content-between pt-2">
                                                <p class="text-muted mb-0">Discount</p>
                                                <p class="text-muted mb-0"><span class="fw-bold me-4">Gold Discount</span>&#x20AC;19.00</p>
                                        </div>
                                        <div class="d-flex justify-content-between mb-5">
                                                <p class="text-muted mb-0">Shipping</p>
                                                <p class="text-muted mb-0"><span class="fw-bold me-4">Gold Shipping</span> Free</p>
                                        </div>
                                        <%
                                                finalprice -= 19.00;
                                        }else if(user.getMembership() == 2) {
                                        %>
                                        <div class="d-flex justify-content-between mb-5">
                                                <p class="text-muted mb-0">Shipping</p>
                                                <p class="text-muted mb-0"><span class="fw-bold me-4">Silver Shipping</span> Free</p>
                                        </div>
                                        <%

                                                }else {
                                        %>
                                        <div class="d-flex justify-content-between mb-5">
                                                <p class="text-muted mb-0">Shipping</p>
                                                <p class="text-muted mb-0"><span class="fw-bold me-4">Free Tier Shipping</span>&#x20AC;15.00</p>
                                        </div>
                                        <%
                                                finalprice += 15.00;
                                                }
                                        %>
                                </div>
                                <div class="card-footer border-0 px-4 py-5" style="background-color: #ff6400; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                                        <% String formattedFinalPrice = String.format("%.2f", finalprice); %>
                                        <h5 class="d-flex align-items-center justify-content-end text-white text-uppercase mb-0">Total paid: <span class="h2 mb-0 ms-2">&#x20AC;<%= formattedFinalPrice %></span></h5>
                                </div>
                        </div>
                </div>
        </div>
</section>
<% } %>
<jsp:include page="footer.jsp"/>
