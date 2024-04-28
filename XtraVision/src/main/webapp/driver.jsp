<%@ page import="business.User" %>
<%@ page import="daos.UserDao" %>
<%@ page import="java.util.List" %>
<%@ page import="business.Delivery" %>
<%@ page import="daos.DeliveryDao" %><%--
  Created by IntelliJ IDEA.
  User: Sean
  Date: 28/04/2024
  Time: 21:17
  To change this template use File | Settings | File Templates.
--%>
<jsp:include page="head.jsp"/>
<section class="vh-100" style="background-image: url('images/shelfbg.png')">
    <div class="container rounded"  style="background-image: url('images/adminbg.jpg'); background-size: cover; background-attachment: fixed; ">
        <div class="row row-cols-1 row-cols-md-2 g-4 pt-5 mb-3 pb-3 ">
            <%
                User u  = (User) session.getAttribute("loggedInUser");
                if (u != null && u.IsDeliverer()== 1) {
                   DeliveryDao deliveryDao = new DeliveryDao("xtra");
                    List<Delivery> deliveryOrders = deliveryDao.getOrdersForUser(u.getId());

                    if (deliveryOrders.isEmpty()) {
            %>
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <p class="card-text">You have no current deliveries.</p>
                    </div>
                </div>
            </div>
            <%
            } else {
                // Display delivery orders
                for (Delivery order : deliveryOrders) {
            %>
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Delivery Order #<%= order.getDeliveryId() %></h5>
                        <p class="card-text">Delivery Date: <%= order.getDeliveryDate() %></p>
                        <p class="card-text">Status: <%= order.getStatus() %></p>
                        <a href="#" class="btn btn-primary">Check Status</a>
                        <a href="#" class="btn btn-success">Mark Delivered</a>
                    </div>
                </div>
            </div>
            <%
                    }
                }
                } else {
                    response.sendRedirect("index.jsp");
                }
            %>
        </div>
    </div>
</section>

<jsp:include page="footer.jsp"/>