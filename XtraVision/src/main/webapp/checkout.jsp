<%@ page import="daos.UserDao" %>
<%@ page import="business.User" %>
<%@ page import="business.BillingInformation" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="head.jsp"/>

<html>
<head>
    <title>Checkout</title>
</head>
<body>

<%

    User loggedInUser = (User) session.getAttribute("loggedInUser");
    if (loggedInUser != null) {
        UserDao userdao = new UserDao("xtra");
        BillingInformation bi = userdao.getUserBillingInfo(loggedInUser.getId());


%>

<label for="address1">Address Line 1:</label>
<input type="text" id="address1" name="address1" value="<%  if(bi != null){ bi.getAddressLine1(); }  %>" required><br><br>

<label for="address2">Address Line 2:</label>
<input type="text" id="address2" name="address2" value="<%  if(bi != null){ bi.getAddressLine2(); }  %>" required><br><br>

<label for="phonenumber">Address Line 2:</label>
<input type="number" id="phonenumber" name="phonenumber" required><br><br>

<label for="cardNumber">Card Number:</label>
<input type="number" id="cardNumber" name="cardNumber" value="<%  if(bi != null){ bi.getCardNumber(); }  %>" required><br><br>

<label for="cardHolder">Card Holder:</label>
<input type="text" id="cardHolder" name="cardHolder" value="<%  if(bi != null){ bi.getCardHolder(); }  %>" required><br><br>

<label for="expiry">Expiration date</label>
<select name='expireMM' id='expireMM'>
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
<select name='expireYY' id='expireYY'>
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

<label for="secNumb">Security numbers:</label>
<input type="number" id="secNumb" name="secNumb" value="<%  if(bi != null){ bi.getSecNum(); }  %>" required><br><br>

<input type="submit" value="Finish">
<input type="hidden" name="action" value="finishCheck">
</body>
</html>
<% } %>
<jsp:include page="footer.jsp"/>
