<%@ page import="daos.UserDao" %>
<%@ page import="business.User" %>
<%@ page import="business.BillingInformation" %>
<%@ page import="business.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="daos.CartDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="head.jsp"/>


<%

    User loggedInUser = (User) session.getAttribute("loggedInUser");
    double totalPrice = 0.0;
    if (loggedInUser != null) {
        CartDao cartDao = new CartDao("xtra");
        List<Product> cartProducts = cartDao.getCartByUserId(loggedInUser.getId());
        UserDao userdao = new UserDao("xtra");
        BillingInformation bi = userdao.getUserBillingInfo(loggedInUser.getId());

        response.sendRedirect("billingInfo.jsp");
        if(bi != null){
%>

<section style="background-image: url('images/shelfbg.png'); background-size: cover; background-attachment: fixed;">
    <div class="container py-5">
        <div class="row mb-4 d-flex justify-content-between align-items-center">
            <div class="card card-checkout" style="border-radius: 15px">
                <div class="card-body p-0">
                    <div class="p-5">
                        <div class="d-flex justify-content-between align-items-center mb-5">
                            <%if(cartProducts.isEmpty()){ %>
                            <h1 class="fw-bold mb-0 text-black">No products added</h1>
                            <%
                            } else {
                            %>
                            <h1 class="fw-bold mb-0 text-black">Review + Purchase</h1>
                        </div>
                        <hr class="my-4">
                        <%

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
                            <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                <h6 class="mb-0">&#x20AC; <%= p.getPrice() %></h6>
                            </div>
                        </div>
                        <%
                            }
                        %>
                        <hr class="my-4">
                        <div class="d-flex justify-content-between mb-3">
                            <h3 class="fw-bold">Total: </h3>
                            <h3>&#x20AC; <%= totalPrice %></h3>
                        </div>
                    </div>
                </div>
                <div class="pay-form m-3">
                    <div class= "text-center mt-2 mb-3">
                        <h2 class="fw-bold mb-0 text-black">Pay With Card</h2>
                        <hr class="my-4">
                    </div>
                    <form  action="controller"  method="post">
                        <div class="row gx-3 p-4">
                            <h4 class="fw-bold mb-4 text-black">Confirm your details: </h4>
                            <div class="col-12">
                                <div class="d-flex flex-column">
                                    <p class="text mb-1">Billing address</p>
                                    <input class="check-form mb-3" type="text" id="address1" name="address1" value="<%=  bi.getAddressLine1()   %>" required>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="d-flex flex-column">
                                    <p class="text mb-1">Billing address, line 2</p>
                                    <input class="check-form mb-3" type="text" id="address2" name="address2" value="<%= bi.getAddressLine2()   %>" required>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="d-flex flex-column">
                                    <p class="text mb-1">Phone number</p>
                                    <input class="check-form mb-3" type="number" id="phonenumber" name="phonenumber" required>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="d-flex flex-column">
                                    <p class="text mb-1">Card holder</p>
                                    <input class="check-form mb-3" type="text" id="cardHolder" placeholder="Name " name="cardHolder" value="<%=  bi.getCardHolder()  %>" required>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="d-flex flex-column">
                                    <p class="text mb-1">Card number</p>
                                    <input class="check-form mb-3" type="number" id="cardNumber" placeholder="1234 5678 435678" name="cardNumber" value="<%=  bi.getCardNumber() %>" required>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="d-flex flex-column">
                                    <p class="text mb-1">Expiration month</p>
                                    <select class="check-form mb-3" name='expireMM' id='expireMM'>
                                        <option value=''>Month</option>
                                        <option value='01'>January</option>
                                        <option value='02'>February</option>
                                        <option value='03'>March</option>
                                        <option value='04'>April</option>
                                        <option value='05'>May</option>
                                        <option value='06'>June</option>
                                        <option value='07'>July</option>
                                        <option value='08'>August</option>
                                        <option value='09'>September</option>
                                        <option value='10'>October</option>
                                        <option value='11'>November</option>
                                        <option value='12'>December</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-2">
                                <p class="text mb-1">Expiration year</p>
                                <div class="d-flex flex-column">
                                    <select class="check-form mb-3" name='expireYY' id='expireYY'>
                                        <option value=''>Year</option>
                                        <option value='20'>2020</option>
                                        <option value='21'>2021</option>
                                        <option value='22'>2022</option>
                                        <option value='23'>2023</option>
                                        <option value='24'>2024</option>
                                    </select>
                                    <input class="inputCard" type="hidden" name="expiry" id="expiry" maxlength="4"/>
                                    <script>

                                        var month = document.getElementById("expireMM");
                                        var year = document.getElementById("expireYY");

                                        var expire = document.getElementById("expiry");

                                        month.addEventListener('change', updateExpiry);
                                        year.addEventListener('change', updateExpiry);

                                        function updateExpiry(){
                                            var selectedMonth = month.value;
                                            var selectedYear = year.value;

                                            expireValue = selectedMonth + selectedYear;

                                            expire.value = expireValue;
                                        }

                                        updateExpiry();
                                    </script>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="d-flex flex-column">
                                    <p class="text mb-1">Security code</p>
                                    <input class="check-form mb-3" type="number" id="secNumb" name="secNumb" value="<%  if(bi != null){ bi.getSecNum(); }  %>" required>
                                </div>
                            </div>
                            <div class="col-12 pt-4">
                                <button class="btn btn-primary d-block w-100" value="submit" type="submit">Pay &#x20AC;<%= totalPrice%></button>
                                <input type="hidden" name="action" value="finishCheck">
                                <input type="hidden" name="totalPrice" value="<%= totalPrice %>">
                            </div>
                        </div>
                    </form>
                </div>
                <%
                    }
                %>
                <hr class="my-4">
                <h6><a href="cart.jsp" class="text-body"><i class="fas fa-long-arrow-alt-left me-2"></i>Back to cart</a></h6>
            </div>
        </div>
    </div>
</section>

<% } %>
<%}%>
<jsp:include page="footer.jsp"/>
