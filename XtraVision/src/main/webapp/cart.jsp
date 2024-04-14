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
%>

    <section class="h-100" style="background-image: url('images/shelfbg.png')">
        <div class="container py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-12">
                    <div class="card card-cart" style="border-radius: 15px;">
                        <div class="card-body p-0">
                            <div class="row g-0">
                                <div class="col-lg-8">
                                    <div class="p-5">
                                        <div class="d-flex justify-content-between align-items-center mb-5">
                                            <h1 class="fw-bold mb-0 text-black">Shopping Cart</h1>
                                        </div>
                                        <hr class="my-4">


            <%if(cartProducts.isEmpty()){ %>
                                        <div class="col-md-2 col-lg-2 col-xl-2">
                                            <h3 class="text-black mb-0">Cart Empty</h3>
                                        </div>
            <%
                } else {
                for (Product p : cartProducts){
                    totalPrice += p.getPrice() * p.getQuantity();
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
                                        <% } %>
                                    <% } %>

                                    <hr class="my-4">
                                        <h6 class="mb-0"><a href="gameslist.jsp" class="text-body"><i class="fas fa-long-arrow-alt-left me-2"></i>Back to shop</a></h6>
                                    </div>
                                </div>

                                <div class="col-lg-4" style="background-color: lightgrey">
                                    <div class="p-5">
                                        <h3 class="fw-bold mb-5 mt-2 pt-1">Summary</h3>
                                        <hr class="my-4">
                                        <h5 class="text-uppercase mb-3">Shipping</h5>

                                        <div class="mb-4 pb-2">
                                            <select class="select">
                                                <option value="1">Physical Delivery</option>
                                                <option value="2">In-Store Pickup</option>
                                            </select>
                                        </div>

                                        <hr class="my-4">

                                        <div class="d-flex justify-content-between mb-5">
                                            <h5 class="text-uppercase">Total price</h5>
                                            <h5><%= totalPrice %></h5>
                                        </div>
                                        <form action="delivery.jsp" method="post">
                                        <input type="hidden" name="action" value="cartCheckout">
                                        <button type="submit" data-mdb-button-init data-mdb-ripple-init class="btn btn-dark btn-block btn-lg"
                                                data-mdb-ripple-color="dark">Checkout</button>
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

<jsp:include page="footer.jsp"/>