<%@ page import="business.User" %>
<%@ page import="daos.UserDao" %>
<%@ page import="business.BillingInformation" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="head.jsp"/>
<%

    User loggedInUser = (User) session.getAttribute("loggedInUser");
    if (loggedInUser != null) {
        UserDao userdao = new UserDao("xtra");
%>
<section style="background-image: url(images/profilebg.png); background-size: cover; background-attachment: fixed;">
    <div class="container py-5">
        <div class="row mb-4 d-flex justify-content-between align-items-center">
            <div class="card" style="border-radius: 15px">
                <div class="card-body p-0">
                    <div class= "text-center mt-2 mb-3">
                        <h2 class="fw-bold mb-0 text-black pt-3">Set up Your Billing Info</h2>
                        <hr class="my-4">
                    </div>
                    <form  action="controller"  method="post">
                        <div class="row gx-3 p-4">
                            <div class="col-12">
                                <div class="d-flex flex-column">
                                    <p class="text mb-1">Billing address</p>
                                    <input class="check-form mb-3" type="text" id="address1" name="address1" required>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="d-flex flex-column">
                                    <p class="text mb-1">Billing address, line 2</p>
                                    <input class="check-form mb-3" type="text" id="address2" name="address2" required>
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
                                    <input class="check-form mb-3" type="text" id="cardHolder" placeholder="Name " name="cardHolder" required>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="d-flex flex-column">
                                    <p class="text mb-1">Card number</p>
                                    <input class="check-form mb-3" type="number" id="cardNumber" placeholder="1234 5678 435678" name="cardNumber" required>
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
                                    <input class="check-form mb-3" type="number" id="secNumb" name="secNumb" required>
                                </div>
                            </div>
                            <div class="col-12 pt-4">
                                <button class="btn btn-primary d-block w-100" value="submit" type="submit">Update Details</button>
                                <input type="hidden" name="action" value="addBillingInformation">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<% } %>
<jsp:include page="footer.jsp"/>