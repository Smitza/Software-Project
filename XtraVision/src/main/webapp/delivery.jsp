<%--
  Created by IntelliJ IDEA.
  User: Sean
  Date: 01/02/2024
  Time: 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
    <title>Delivery Page</title>
        <form  action="controller" method="post">

            <label for="address">Address:</label>
            <input type="text" id="address" name="address" required><br><br>

            <label for="phonenumber">Phonenumber:</label>
            <input type="number" id="phonenumber" name="phonenumber" required><br><br>

            <label for="payMethod">Payment method:</label>
            <input type="text" id="payMethod" name="payMethod" required><br><br>

            <input type="submit" value="Delivery">
            <input type="hidden" name="action" value="delivery">
        </form>


</body>
</html>
